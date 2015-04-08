

import networkx as nx
import matplotlib.pyplot as plt

G = nx.Graph()
fin = open('onto.e');
for line in fin:
  words = line.strip().split(' ')
  G.add_edge(eval(words[0]),eval(words[1]))


for edge in (list(nx.bfs_edges(G, 915))):
  print edge[0], edge[1]
