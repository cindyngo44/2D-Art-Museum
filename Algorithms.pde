abstract class Algorithms{
  Graph graph;

  void runAlgorithm(){

  }
}
class BFS extends Algorithms{
  //Print out in console the painting title thoruhg BFS
  BFS(Graph graph){
    this.graph = graph;
  }
    void runAlgorithm(){
      boolean visited[] = new boolean[graph.vertexStorage.size()];
      Queue<Integer> q = new ArrayDeque();
      for (int i = 0; i < graph.numVertices ; i++)
      {
        if(visited[i] != true)
        {
        q.add(i);
        visited[i]= true;
        }
        else
        {
          continue;
        }
      
        while(!q.isEmpty())
        {
          i = q.poll();
          println(graph.vertexStorage.get(i).title  + " ");

           for (int num = 0 ; num< graph.adjList.get(i).size(); num++ )
            {
                int temp = graph.vertexStorage.get(num).vertexNum;
                if (!visited[temp])
                {
                    // mark it as discovered and enqueue it
                    visited[temp] = true;
                    q.add(temp);
                }
            }
        }
      } 
    }
}
class DFS extends Algorithms{
    boolean[] visited;
    DFS(Graph graph){
      this.graph = graph;
      visited = new boolean[graph.numVertices];
    }
    //runAlgorithm runs the recursive DFS function with the same source vertex (painting[0])
    void runAlgorithm(){
      DFSRecur(0, visited);
    }
    void DFSRecur(int source, boolean[] visited){      
      //sets the visited vertext to be true
      visited[source] = true;
      //prints the title
      println(graph.vertexStorage.get(source).title);

      //Iterates thorugh the ArrayList of edges attached to that vertex
      Iterator<Vertex> iter = graph.adjList.get(source).iterator();
      while(iter.hasNext()){
        Vertex n = iter.next();
        int index = 0;
        //Find corresponding index in vertexStorage to the Vertex n
        for(int i = 0; i < graph.numVertices; i++){
          if(n.title == graph.vertexStorage.get(i).title){
            //once found it breaks and sets index to be used next
            index = i;
            break;
          }
        }
        // if n is not visited, then we can run the recursive on the next vertex
        if(!visited[index]){
          DFSRecur(index, visited);
        }
      }
    }
}
class Dijkstra extends Algorithms{
  Dijkstra(Graph graph){
    this.graph = graph;
  }

    void runAlgorithm(){

  }
}
