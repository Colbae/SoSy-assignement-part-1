import matplotlib.pyplot as plt
import networkx as nx

def plot_network_graph(file_pairs, output_filename, fig_size):
    G = nx.Graph()

    for file1, file2, count in file_pairs:
        G.add_edge(file1, file2, weight=count)

    plt.figure(figsize=fig_size)
    pos = nx.circular_layout(G)
    nx.draw(G, pos, with_labels=True, node_size=700, node_color='lightblue', font_size=10, font_weight='bold', edge_color='gray')

    edge_labels = nx.get_edge_attributes(G, 'weight')
    nx.draw_networkx_edge_labels(G, pos, edge_labels=edge_labels)

    plt.title("Logical Coupling Network Graph")
    plt.savefig(output_filename, dpi=300, bbox_inches='tight')
    plt.show()