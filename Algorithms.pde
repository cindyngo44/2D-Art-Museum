abstract class Algorithms{
  Graph graph;

  void runAlgorithm(){

  }
}
//TODO: Set this.graph to graph being passed in, and create each algorithm
//Output: Painting names in console + how long the algorithm took to run
//Reference: Function Execution Time in Java: https://www.tutorialspoint.com/how-to-measure-execution-time-for-a-java-method
class BFS extends Algorithms{
  //Print out in console the painting title thoruhg BFS
  void BFS(Graph graph){
    this.graph = graph;
  }

    void runAlgorithm(){
      
/*
      boolean nodes[] = new boolean[adjList.size()];       //initialize boolean array for holding the data
        int a = 0;

      Queue<Integer> queue = new ArrayList();;
 
        nodes[n]=true;                  
        queue.add(n);                   //root node is added to the top of the queue
 
        while (queue.size() != 0)
        {
            n = queue.poll();             //remove the top element of the queue
            System.out.print(n+" ");           //print the top element of the queue
 
            for (int i = 0; i < adj[n].size(); i++)  //iterate through the linked list and push all neighbors into queue
            {
                a = adj[n].get(i);
                if (!nodes[a])                    //only insert nodes into queue if they have not been explored already
                {
                    nodes[a] = true;
                    queue.add(a);
                }
            }  
        }*/
        

  }
  
}
class DFS extends Algorithms{
    void DFS(Graph graph){
      this.graph = graph;
    }
}
class Dijkstra extends Algorithms{
  void dijkstra(Graph graph){
    this.graph = graph;
  }

    void runAlgorithm(){

  }
}
