abstract class Algorithms{
  Graph graph;

  void runAlgorithm(){

  }
}
//TODO: Set this.graph to graph being passed in, and create each algorithm
class BFS extends Algorithms{
  //Print out in console the painting title thoruhg BFS
  void BFS(Graph graph){
    this.graph = graph;
  }

    void runAlgorithm(){

  }
}
//Cindy: we still have yet to weighted graphs working so am not sure about DiJkstra's, we are allowed to do DFS I believe
class Dijkstra extends Algorithms{
  void dijkstra(Graph graph){
    this.graph = graph;
  }

    void runAlgorithm(){

  }
}