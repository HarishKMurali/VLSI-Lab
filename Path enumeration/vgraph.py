import networkx as nx
import matplotlib.pyplot as plt
import v_parser

''' 
in_n: input nodes; 
out_n: output nodes; 
nodes: gates; 
edges: wire connections
'''

def grapher(in_n, out_n, nodes, edges):

	# in_n, out_n, nodes, edges = verilog_parser.parser(file_)     

	G=nx.DiGraph()#graph creation
	G.add_nodes_from(in_n)
	G.add_nodes_from(out_n)
	G.add_nodes_from(nodes)

	colour_map = []
	size = []
	line_size = []
	for node in G:
		if node in in_n:
			colour_map.append('magenta')
		elif node in out_n:
			colour_map.append('yellow')
		else:
			colour_map.append('cyan')
		size.append(300*len(node))

	for i in edges:
		for j in i[2]:
			G.add_edge(i[1], j, weight=6)

	nx.draw(G, with_labels=True, node_color=colour_map, node_size=size, arrowsize=20, pos=nx.spring_layout(G, k=7))
	# plt.savefig("path_graph1.png")
	#plt.show()
	print("\nAll paths from input to output:\n")
	for i in in_n:
		for j in out_n:
			for path in nx.all_simple_paths(G, source=i, target=j):
				for k in range(len(path)-1):
					print(path[k],end="->")
				print(path[len(path)-1])
	plt.show()
