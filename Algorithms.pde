abstract class Algorithms {
  Graph graph;

  void runAlgorithm() {
  }
}
class BFS extends Algorithms {
  //Print out in console the painting title through BFS
  BFS(Graph graph) {
    this.graph = graph;
  }
  void runAlgorithm() {
    // a boolean array that notes if the node has been visited
    boolean visited[] = new boolean[graph.vertexStorage.size()];
    // a queue data structure is used becaus eit is a BFS
    Queue<Integer> q = new ArrayDeque();
    for (int i = 0; i < graph.numVertices; i++)
    {
      if (visited[i] != true) // if it has not been visited
      {
        q.add(i);
        visited[i]= true;
      } else //if it has already been visited
      {
        continue;
      }

      while (!q.isEmpty())
      {
        //dequeue and print title of first element in queue
        i = q.poll();
        String currTitle = graph.vertexStorage.get(i).title;
        //if (!currTitle.equals("unknown")) println(currTitle);

        for (int num = 0; num< graph.adjList.get(i).size(); num++ )
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
class DFS extends Algorithms {
  boolean[] visited;
  DFS(Graph graph) {
    this.graph = graph;
    visited = new boolean[graph.numVertices];
  }
  //runAlgorithm runs the recursive DFS function with the same source vertex (painting[0])
  void runAlgorithm() {
    DFSRecur(0, visited);
  }
  void DFSRecur(int source, boolean[] visited) {      
    //sets the visited vertext to be true
    visited[source] = true;
    //prints the title
    String currTitle = graph.vertexStorage.get(source).title;
    if (!currTitle.equals("unknown")) println(currTitle);

    //Iterates thorugh the ArrayList of edges attached to that vertex
    Iterator<Vertex> iter = graph.adjList.get(source).iterator();
    while (iter.hasNext()) {
      Vertex n = iter.next();
      int index = 0;
      //Find corresponding index in vertexStorage to the Vertex n
      for (int i = 0; i < graph.numVertices; i++) {
        if (n.title == graph.vertexStorage.get(i).title) {
          //once found it breaks and sets index to be used next
          index = i;
          break;
        }
      }
      // if n is not visited, then we can run the recursive on the next vertex
      if (!visited[index]) {
        DFSRecur(index, visited);
      }
    }
  }
}