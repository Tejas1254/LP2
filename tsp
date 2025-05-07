def tsp_nearest_neighbor(graph, start):
    n = len(graph)
    visited = [False] * n
    path = [start]
    total_cost = 0
    current = start - 1   
    visited[current] = True

    for _ in range(n - 1):
        next_city = None
        min_dist = float('inf')
        for city in range(n):
            if not visited[city] and graph[current][city] < min_dist:
                min_dist = graph[current][city]
                next_city = city
        path.append(next_city + 1)   
        total_cost += min_dist
        visited[next_city] = True
        current = next_city

    total_cost += graph[current][start - 1]
    path.append(start)

    return path, total_cost


n = int(input("Enter number of cities: "))
graph = []

print("Enter distance matrix row by row (use space between numbers):")
for i in range(n):
    row = list(map(int, input(f"Row {i + 1}: ").split()))
    graph.append(row)

start_city = int(input(f"Enter starting city (1 to {n}): "))
path, cost = tsp_nearest_neighbor(graph, start_city)

print("TSP Path:", " -> ".join(map(str, path)))
print("Total cost:", cost)



