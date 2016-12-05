# Running with Bunnies
# ====================
#
# You and your rescued bunny prisoners need to get out of this collapsing death trap of a space station - and fast! Unfortunately, some of the bunnies have been weakened by their long imprisonment and can't run very fast. Their friends are trying to help them, but this escape would go a lot faster if you also pitched in. The defensive bulkhead doors have begun to close, and if you don't make it through in time, you'll be trapped! You need to grab as many bunnies as you can and get through the bulkheads before they close.
#
# The time it takes to move from your starting point to all of the bunnies and to the bulkhead will be given to you in a square matrix of integers. Each row will tell you the time it takes to get to the start, first bunny, second bunny, ..., last bunny, and the bulkhead in that order. The order of the rows follows the same pattern (start, each bunny, bulkhead). The bunnies can jump into your arms, so picking them up is instantaneous, and arriving at the bulkhead at the same time as it seals still allows for a successful, if dramatic, escape. (Don't worry, any bunnies you don't pick up will be able to escape with you since they no longer have to carry the ones you did pick up.) You can revisit different spots if you wish, and moving to the bulkhead doesn't mean you have to immediately leave - you can move to and from the bulkhead to pick up additional bunnies if time permits.
#
# In addition to spending time traveling between bunnies, some paths interact with the space station's security checkpoints and add time back to the clock. Adding time to the clock will delay the closing of the bulkhead doors, and if the time goes back up to 0 or a positive number after the doors have already closed, it triggers the bulkhead to reopen. Therefore, it might be possible to walk in a circle and keep gaining time: that is, each time a path is traversed, the same amount of time is used or added.
#
# Write a function of the form answer(times, time_limit) to calculate the most bunnies you can pick up and which bunnies they are, while still escaping through the bulkhead before the doors close for good. If there are multiple sets of bunnies of the same size, return the set of bunnies with the lowest prisoner IDs (as indexes) in sorted order. The bunnies are represented as a sorted list by prisoner ID, with the first bunny being 0. There are at most 5 bunnies, and time_limit is a non-negative integer that is at most 999.
#
# For instance, in the case of
# [
#   [0, 2, 2, 2, -1],  # 0 = Start
#   [9, 0, 2, 2, -1],  # 1 = Bunny 0
#   [9, 3, 0, 2, -1],  # 2 = Bunny 1
#   [9, 3, 2, 0, -1],  # 3 = Bunny 2
#   [9, 3, 2, 2,  0],  # 4 = Bulkhead
# ]
# and a time limit of 1, the five inner array rows designate the starting point, bunny 0, bunny 1, bunny 2, and the bulkhead door exit respectively. You could take the path:
#
# Start End Delta Time Status
#     -   0     -    1 Bulkhead initially open
#     0   4    -1    2
#     4   2     2    0
#     2   4    -1    1
#     4   3     2   -1 Bulkhead closes
#     3   4    -1    0 Bulkhead reopens; you and the bunnies exit
#
# With this solution, you would pick up bunnies 1 and 2. This is the best combination for this space station hallway, so the answer is [1, 2].
#
# Languages
# =========
#
# To provide a Python solution, edit solution.py
# To provide a Java solution, edit solution.java
#
# Test cases
# ==========
#
# Inputs:
#     (int) times = [[0, 1, 1, 1, 1], [1, 0, 1, 1, 1], [1, 1, 0, 1, 1], [1, 1, 1, 0, 1], [1, 1, 1, 1, 0]]
#     (int) time_limit = 3
# Output:
#     (int list) [0, 1]
#
# Inputs:
#     (int) times = [[0, 2, 2, 2, -1], [9, 0, 2, 2, -1], [9, 3, 0, 2, -1], [9, 3, 2, 0, -1], [9, 3, 2, 2, 0]]
#     (int) time_limit = 1
# Output:
#     (int list) [1, 2]
#
#
#

# [
#   [0, 2, 2, 2, -1],  # 0 = Start
#   [9, 0, 2, 2, -1],  # 1 = Bunny 0
#   [9, 3, 0, 2, -1],  # 2 = Bunny 1
#   [9, 3, 2, 0, -1],  # 3 = Bunny 2
#   [9, 3, 2, 2,  0],  # 4 = Bulkhead
# ]
class Graph
  attr_accessor :graph
  def initialize()
    @graph = []
    list.each_with_index do |v,i|
      @graph.push(Vertex.new(v,i)) # [0, 2, 2, 2, -1]
    end
  end
end

class Vertex
  attr_accessor :edges
  def initialize(list_of_edges, s)
    @edges = []
    list_of_edges.each_with_index do |w,e|
      @edges.push(Edge.new(s,e,w))
    end
  end
end

class Edge
  attr_accessor :s,:e,:w
  def initialize(s, e, w)
    @s = s
    @e = e
    @w = w
  end
end

# def Bellman_Ford()
#   relax(Edge uv)
#   if( (distance[v]) > (distance[u]  +  weightEdge(u,v)  )
#     distance[v] = distance[u] + weightEdge(u,v)
#     parent[v] = u
#   end
# end

def bellman_test()

  graph =  [
    [0, 2, 2, 2, -1],  # 0 = Start
    [9, 0, 2, 2, -1],  # 1 = Bunny 0
    [9, 3, 0, 2, -1],  # 2 = Bunny 1
    [9, 3, 2, 0, -1],  # 3 = Bunny 2
    [9, 3, 2, 2,  0],  # 4 = Bulkhead
  ]

  # Start End Delta Time Status
  #     -   0     -    1 Bulkhead initially open
  #     0   4    -1    2
  #     4   2     2    0
  #     2   4    -1    1
  #     4   3     2   -1 Bulkhead closes
  #     3   4    -1    0 Bulkhead reopens; you and the bunnies exit


  # graph = [
  #   [0, 1, 1, 1, 1],
  #   [1, 0, 1, 1, 1],
  #   [1, 1, 0, 1, 1],
  #   [1, 1, 1, 0, 1],
  #   [1, 1, 1, 1, 0]
  # ]
  vertices =[]
  edges = []
  graph.each_with_index do |v,s|
    vertices.push(Vertex.new(v,s))
    v.each_with_index do |w, e|
      edges.push(Edge.new(s,e,w))
    end
  end
  source = 4
  p bellmanFord(vertices,edges,source)
end

def bellmanFord(vertices,edges,source)
  distance = Array.new()
  predecessor = Array.new()

  vertices.each_with_index do |v,i|
    distance[i] = 1.0/0.0
    predecessor[i] = nil
  end

  distance[source] = 0

  (1..vertices.length - 1).each do |v|
    edges.each do |e|
      if distance[e.s] + e.w < distance[e.e]
        distance[e.e] = distance[e.s] + e.w
        predecessor[e.e] = e.s
      end
    end
  end

  edges.each do |e|
    if distance[e.s] + e.w < distance[e.e]
      raise "Graph contains a negative-weight cycle"
    end
    return [distance,predecessor]
  end

end

# bellman_test()



# function BellmanFord(list vertices, list edges, vertex source)
#    ::distance[],predecessor[]
#
#    // This implementation takes in a graph, represented as
#    // lists of vertices and edges, and fills two arrays
#    // (distance and predecessor) with shortest-path
#    // (less cost/distance/metric) information
#
#    // Step 1: initialize graph
#    for each vertex v in vertices:
#        distance[v] := inf             // At the beginning , all vertices have a weight of infinity
#        predecessor[v] := null         // And a null predecessor
#
#    distance[source] := 0              // Except for the Source, where the Weight is zero
#
#    // Step 2: relax edges repeatedly
#    for i from 1 to size(vertices)-1:
#        for each edge (u, v) with weight w in edges:
#            if distance[u] + w < distance[v]:
#                distance[v] := distance[u] + w
#                predecessor[v] := u
#
#    // Step 3: check for negative-weight cycles
#    for each edge (u, v) with weight w in edges:
#        if distance[u] + w < distance[v]:
#            error "Graph contains a negative-weight cycle"
#    return distance[], predecessor[]




# let dist be a


    # {\displaystyle |V|\times |V|}

# {\displaystyle |V|\times |V|} array of minimum distances initialized to


    # {\displaystyle \infty }

# \infty  (infinity)
# let next be a


    # {\displaystyle |V|\times |V|}

# {\displaystyle |V|\times |V|} array of vertex indices initialized to null




def floydWarshallWithPathReconstruction(vertices,edges,u,v)
  dist = Array.new(5) {Array.new(5)}
  next_ = Array.new(5) {Array.new(5)}
  # p dist
  (0 .. vertices.length - 1).each do |v1|
    (0 .. vertices.length - 1).each do |v2|
      # p v1
      # p v2
      # p dist[0][0]
      dist[v1][v2] = 1.0/0.0
      next_[v1][v2] = nil
    end
  end

  edges.each do |e|
    dist[e.s][e.e] = e.w  # the weight of the edge (u,v)
    next_[e.s][e.e] = e.e
  end
  # p dist
  # p vertices
  vertices.each_with_index do |v1,k|
    vertices.each_with_index do |v2,i|
      vertices.each_with_index do |v3,j|
        # p [v1,k]
        # p [v2,i]
        # p [v3,j]
        # p dist
        p dist[i][k]
        p dist[k][j]
        p dist[i][j]
        p ((dist[i][k] + dist[k][j]) < dist[i][j])
        if ((dist[i][k] + dist[k][j]) < dist[i][j])
          dist[i][j] = [dist[i][k], dist[k][j]].max
          next_[i][j] = next_[i][k]
        end
      end
    end
  end
  return path(u,v,next_)
end

def path(u,v,next_)
  if next_[u][v] == nil
    return []
  end
  path = [u]
  while u != v
    u = next_[u][v]
    path.push(u)
  end
  return path
end



def Floyd_Warshall_test()
  graph =  [
    [0, 2, 2, 2, -1],  # 0 = Start
    [9, 0, 2, 2, -1],  # 1 = Bunny 0
    [9, 3, 0, 2, -1],  # 2 = Bunny 1
    [9, 3, 2, 0, -1],  # 3 = Bunny 2
    [9, 3, 2, 2,  0],  # 4 = Bulkhead
  ]

  # Start End Delta Time Status
  #     -   0     -    1 Bulkhead initially open
  #     0   4    -1    2
  #     4   2     2    0
  #     2   4    -1    1
  #     4   3     2   -1 Bulkhead closes
  #     3   4    -1    0 Bulkhead reopens; you and the bunnies exit


  # graph = [
  #   [0, 1, 1, 1, 1],
  #   [1, 0, 1, 1, 1],
  #   [1, 1, 0, 1, 1],
  #   [1, 1, 1, 0, 1],
  #   [1, 1, 1, 1, 0]
  # ]
  vertices =[]
  edges = []
  graph.each_with_index do |v,s|
    vertices.push(Vertex.new(v,s))
    v.each_with_index do |w, e|
      edges.push(Edge.new(s,e,w))
    end
  end
  u = 0
  v = 4

  p floydWarshallWithPathReconstruction(vertices,edges,u,v)
  # p path(u,v)
end

Floyd_Warshall_test()

  #  for k from 1 to |V| // standard Floyd-Warshall implementation
      # for i from 1 to |V|
        #  for j from 1 to |V|

# procedure Path(u, v)
  #  if next[u][v] = null then
      #  return []
  #  path = [u]
  #  while u ≠ v
      #  u ← next[u][v]
      #  path.append(u)
  #  return path
