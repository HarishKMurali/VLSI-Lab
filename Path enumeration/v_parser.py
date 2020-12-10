#function to parse verilog file content into ip,op nodes and wires
def parser(filename):
	vfile=open(filename,'r')

	GATES=['and','or','not','nand','nor','xor','xnor']
	input_nodes=[]
	output_nodes=[]
	gates=[]
	edges=[] #edge contains 3 attributes: name of wire,gate from which is starts,set of nodes it goes to

	line=vfile.readline()
	while(line):
		line=line.lstrip()

		if(line.startswith('input')):#separating input nodes
			line=line.lstrip('input').split(sep=',')
			line=[w.strip(',;\n ') for w in line]
			[input_nodes.append(w) for w in line]
		
		elif(line.startswith('output')):#separating output nodes
			line=line.lstrip('output').split(sep=',')
			line=[w.strip(',;\n ') for w in line]
			[output_nodes.append(w) for w in line]
		
		elif(any(g in line for g in GATES)):#for gate lines

			str1=''
			line=line.split(sep=' ',maxsplit=1)[1]#separating out gate type
			line=str1.join(line)

			line=line.split('(')
			gate=(line[0].strip(',;\n ()'))
			gates.append(gate)#gatename separation
			line=line[1:]

			str1=''
			line=str1.join(line)
			line=[x.strip(',;\n ()') for x in line.split(',')]
			out_=line[0]#output node for the gate instance
			in_=line[1:]#all nodes inside gate instance for eg.,in xor1(a,b,c) in_ will be ['a','b','c']

			if(out_ in output_nodes):
				edges.append([out_,gate,[out_]])#appending edge table for op nodes
			else:
				flag=0
				for i in edges:#for internal nodes,checking if its already present in edge table
					if(i[0] == out_):
						i[1] = gate#if present then write the gate
						flag = 1
						break
				
				if(flag == 0):
					edges.append([out_, gate, []])#else append to table
			
			for i in in_:
				# print(i, end='')
				if(i in input_nodes):#for every input node in gate instance
					flag = 0
					for j in edges:
						if(j[0] == i):
							j[2].append(gate)#if input is already there in edge table append gate to dest
							flag = 1
							break
					if(flag == 0):
						edges.append([i, i, [gate]])#else append to table

				else:
					flag = 0
					for j in edges:#for internal nodes
						if(j[0] == i):
							j[2].append(gate)#if input is already there in edge table append gate to dest
							flag = 1
							break

					if(flag == 0):
						edges.append([i, ' ', [gate]])#else append to table
		line=vfile.readline()

	print("\nINPUT:")
	print(input_nodes)

	print("\nOUTPUT:")
	print(output_nodes)

	print("\nGATES:")
	print(gates)

	print("\nWIRES: ")

	print("{:<15}{:<10}{}".format("Wire name", "From", "To"))
	for i in edges:
		print("{:<15}{:<10}{}".format(i[0], i[1], i[2]))
	
	return input_nodes, output_nodes, gates, edges