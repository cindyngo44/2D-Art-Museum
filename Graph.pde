class Vertex{
  //TODO (Cindy): Create the Vertex/Node class of the different painting attributes
  int vertex;
  String paintingName;
  String colors;
  String location;
}
class Graph{
  //TODO: create boolean variables to know which type of graph to make
  //(Painting Category + Relationships
  boolean culture;
  boolean timePeriod;
  boolean allPaintings;
  boolean colors;
  boolean keyWords;
  boolean locations;
  
  //Components for adjList graph
  int numVertices;
  ArrayList<Vertex> adjList = new ArrayList<Vertex>();
  
  //TODO: Constructur, taking in the different booleans 
  //Build off of what type of relationship
  Graph(boolean culture, boolean timePeriod, boolean allPaintings,
          boolean colors, boolean keyWords, boolean locations){
    this.culture = culture;
    this.timePeriod = timePeriod;
    this.allPaintings = allPaintings;
    this.colors = colors;
    this.keyWords = keyWords;
    this.locations = locations;
  }
  
  void addEdge(){
  
  }
}
