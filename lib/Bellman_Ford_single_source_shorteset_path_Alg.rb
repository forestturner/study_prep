

class Graph
  def initialize()
    list.each do |v|
    
    end

  end
end
class Vertex
  def initialize(list_of_edges)
    list_of_edges.each_with_index do |e,i|
      Edge.new(e)
    end
    # list.each do |v|
      # node.each do |e|
      # end
    # end
  end
end
class Edge
  attr_accessor :start_vertex,:end_node,:weight
  def initialize(start_vertex, end_vertex, weight)
    @start_vertex =  start_vertex
    @end_vertex = end_vertex
    @weight = weight
  end
end

def Bellman_Ford()
  relax(Edge uv)
  if( (distance[v]) > (distance[u]  +  weightEdge(u,v)  )
    distance[v] = distance[u] + weightEdge(u,v)
    parent[v] = u
  end
end
