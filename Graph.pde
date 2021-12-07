class Vertex{
  //Painting Attributes
  int vertex;
  String paintingName;
  String artistName;
  String[] colors;
  String location;
  String paintingTimePeriod;
  int year;
  PImage img;
  String imgURL;

  //PSEUDOCOE: VERTEX CONSTRUCTOR
  Vertex(int vertex, String artistName, String colors, 
        String location, String paintingTimePeriod, int year, String imgURL){
      this.vertex = vertex;
      this.artistName = artistName;
      this.colors = colors;
      this.location = location;
      this.paintingTimePeriod = paintingTimePeriod;
      this.year = year;
      this.imgURL = URL;

      //reference: https://processing.org/reference/loadImage_.html
      this.img = loadimg(imgURL, "png";)
  }
}
class Graph{
  //TODO: create boolean variables to know which type of graph to make
  //(Painting Category + Relationships
  boolean culture;
  boolean timePeriod;
  boolean allPaintings;
  boolean colors;
  boolean titles;
  boolean timeLine;
  boolean locations;
  
  //Components for adjList graph
  int numVertices;
  HashMap<Integer,ArrayList<Vertex>> adjList = new HashMap<Integer,ArrayList<Vertex>>();

  //when we create new vertices, we store here in no order
  ArrayList<Vertex> vertexStorage = new ArrayList<Vertex>();
  //Enpty Constructor
  Graph(){
  }
  
  //set the graph variables
  void setGraph(boolean culture, boolean timePeriod, boolean allPaintings,
          boolean colors, boolean titles, boolean timeLine){
    this.culture = culture;
    this.timePeriod = timePeriod;
    this.allPaintings = allPaintings;
    this.colors = colors;
    this.titles = titles;
    this.timeLine = timeLine;
  } 
  void addEdge(){
  //Types of graphs we may make

  //Vertex: Time Period Edge: Color
  //Vertex: Time Period Edge: Title
  //Vertex: Time Period Edge: Year

  //Vertex: Culture Edge: Color
  //Vertex: Culture Edge: Title
  //Vertex: Culture Edge: Year

  //Vertex: All paintings Edge: Color
  //Vertex: All paintings Edge: Title
  //Vertex: All paintiings Edge: Year
  
  //buildGraph: is called after setting booleans, this function will check said
  //boolean functions and call addEdge____ for the appropriate graph construction
  void buildGraph(){
    if(colors){
      addEdgeColor();
    }
    else if(titles){
      addEdgeTitle();
    }
    else if(timeLine){
      addEdgeYear();
    }
  }
  void addEdgeColor(){
    //given vertexStorage
    if(allPaintings){
      for(int i = 0; i < numVertices; i++){
        //iterate through vertexStorage
        //grab vertex at indices hue name
        //iterate thourgh num vertices and find all vertices hues that match hue name
        //EXCLUDING THE CURRENT VERTEX
        String hue1 = vertexStorage.get(i).hue;
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String hue2 = vertexStorage.get(j).hue;
            if(hue1.equals(hue2)){
              value.add(vertexStorage.get(j));
            }
          }
        }
        adjList.put(i, value);
      }
    }
  }
  void addEdgeTitle(){
  
  }
  void addEdgeYear(){
  
  }
  
  //graphDraw: draws the graph w/ vertices + edges
  void graphDraw(){
  }
}
