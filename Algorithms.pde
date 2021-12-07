abstract class Algorithms{
  Graph graph;
}
//TODO: Set this.graph to graph being passed in, and create each algorithm
class BFS extends Algorithms{
  //Print out in console the painting title thoruhg BFS
  void BFS(Graph graph){
    this.graph = graph;
  }
}
class Dijkstra extends Algorithms{
  void dijkstra(Graph graph){
    this.graph = graph;
  }
}