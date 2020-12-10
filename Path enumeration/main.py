from v_parser import parser
from vgraph import grapher

if __name__ == "__main__":
	print('Enter name of verilog file:')
	filename=input()
	input_nodes,output_nodes,nodes,edges=parser(filename)
	grapher(input_nodes,output_nodes,nodes,edges)