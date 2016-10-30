from Queue import Queue


class Graph(object):
    """A minimal graph using adjacency lists."""

    def __init__(self, nodes=[], edges=[]):
        self.nodes = nodes
        self.adjacency_list = {n: [tail for (head, tail) in edges if head == n] for n in nodes}

    def successors(self, node):
        """Return a list of successors."""
        return self.adjacency_list[node]

    def predecessor(self, node):
        """Return a list of predecessors."""
        # shown for completeness. If this function is called often, this is the wrong data structure.
        return [head for head in self.nodes if node in self.successors(head)]

    def add_node(self, node):
        self.nodes.append(node)
        self.adjacency_list[node] = [] 

    def add_edge(self, edge):
        self.adjacency_list[edge[0]].append(edge[1])
        self.adjacency_list[edge[1]].append(edge[0])


def bfs(graph, start):
    remaining_nodes = Queue()
    visited = set()

    def visit(node):
        print(node)
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

def create_spanning_tree(graph, start):
    remaining_nodes = Queue()
    visited = set()
    spanning_tree = Graph([start], [])

    def visit(node):
        visited.add(node)
        
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)
                spanning_tree.add_node(tail)
                spanning_tree.add_edge((node, tail))

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

    return spanning_tree

def find_distances(graph, start):
    remaining_nodes = Queue()
    visited = set()

    distances = {start: 0}

    def visit(node):
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                remaining_nodes.put(tail)
                distances[tail] = distances[node] + 1 # NOTE: this isn't necessarily the SHORTEST distance

    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)

    return distances

g = Graph(['a', 'b', 'c', 'd', 'e'], [('a', 'b'), ('a', 'c'), ('b', 'd'), ('b', 'e'), ('e', 'a')])
bfs(g, 'a')
print create_spanning_tree(g, 'a').adjacency_list
print find_distances(g, 'a')
