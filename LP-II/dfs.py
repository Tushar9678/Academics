from collections import deque

def create_graph():
    graph = {}
    num_vertices = int(input("Enter the number of vertices: "))

    for _ in range(num_vertices):
        vertex = input("Enter the vertex: ")
        neighbors = input(f"Enter the neighbors of {vertex} (comma-separated): ")
        
        neighbors_list = [n.strip() for n in neighbors.split(",")]
        graph[vertex] = neighbors_list

    return graph


def dfs_recursive(graph, node, visited=None):
    if visited is None:
        visited = set()  

    visited.add(node)  
    print(node)  

    for neighbor in graph.get(node, []):
        if neighbor not in visited:
            dfs_recursive(graph, neighbor, visited)  


def dfs_main():
    graph = create_graph()

    start_node = input("Enter the starting node for DFS traversal: ")

    print("DFS traversal order:")
    dfs_recursive(graph, start_node)


if __name__ == "__main__":
    dfs_main()
