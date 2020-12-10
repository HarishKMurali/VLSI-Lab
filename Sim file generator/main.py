def postfix(in_exp):   # function to convert expression to postfix
	post_exp = []
	stack = []

	for i in in_exp:
		
		if(i == '('):
			stack.append('(')
		elif(i == ')'):
			
			# if()
			post_exp.append(stack[-1])
			stack.pop()
			stack.pop()
		elif(i == '+' or i == '!' or i == '.'):
			stack.append(i)
		else:
			post_exp.append(i)
	if stack:
		print('invalid expression-use brackets whereever necessary')
		exit()
	return post_exp

def gate_structure(exp):   # function to write contents of gate structure to a list
	stack=[]
	simfile=[]
	out_number=0
	node_number=0

	for i in range(len(exp)):
		elem=exp[i]
		if(elem=='.'):
			a=stack.pop()
			b=stack.pop()
			simfile.append('p '+a+' vdd out'+str(out_number)+' 2 4\n')
			simfile.append('p '+b+' vdd out'+str(out_number)+' 2 4\n')
			simfile.append('n '+a+' gnd '+str(node_number)+' 2 4\n')
			simfile.append('n '+b+' '+str(node_number)+' out'+str(out_number)+' 2 4\n')

			simfile.append('p out'+str(out_number)+' vdd out'+str(out_number+1)+' 2 4\n')
			simfile.append('n out'+str(out_number)+' gnd out'+str(out_number+1)+' 2 4\n')
			stack.append('out'+str(out_number+1))
			out_number+=2
			node_number+=1
		
		elif(elem=='+'):
			a=stack.pop()
			b=stack.pop()
			simfile.append('p '+a+' vdd '+str(node_number)+' 2 4\n')
			simfile.append('p '+b+' '+str(node_number)+' out'+str(out_number)+' 2 4\n')
			simfile.append('n '+a+' gnd out'+str(out_number)+' 2 4\n')
			simfile.append('n '+b+' gnd out'+str(out_number)+' 2 4\n')

			simfile.append('p out'+str(out_number)+' vdd out'+str(out_number+1)+' 2 4\n')
			simfile.append('n out'+str(out_number)+' gnd out'+str(out_number+1)+' 2 4\n')
			stack.append('out'+str(out_number+1))
			out_number+=2
			node_number+=1
		
		elif(elem=='!'):
			a=stack.pop()
			simfile.append('p '+a+' vdd out'+str(out_number)+' 2 4\n')
			simfile.append('n '+a+' gnd out'+str(out_number)+' 2 4\n')
			stack.append('out'+str(out_number))
			out_number+=1
		
		else:
			stack.append(elem)
	simfile.append('out'+str(out_number-1))
	return simfile



# main part
exp=input("Enter expression : ")
filename=input("Enter filename : ")
print('postfix expression is ')
print(postfix(exp))

structure=gate_structure(postfix(exp))

output=structure.pop()
f=open(filename,'w')
f.writelines(structure)
#for i in structure:
#	print(i)
print('your output is ',output)
print('sim file created successfully!')
f.write('\n')
f.close()