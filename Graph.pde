class Vertex {
    //Painting Attributes
    int vertexNum;
    String id;
    String title;
    String artist;
    String culture;
    String imgUrl;
    String hex1;
    String hex2;
    String hex3;
    String percent1;
    String percent2;
    String percent3;
    String hue1;
    String hue2;
    String hue3;
    String hue4;
    String hue5;
    String year;
    ArrayList<String> hues;
    PImage img;

    Vertex(int vertexNum, String id, String title, String artist, String culture, String imgUrl, String hex1, String hex2, String hex3, String percent1, String percent2, String percent3,
    String hue1, String hue2, String hue3, String hue4, String hue5, String year){
        this.vertexNum= vertexNum;
        this.id = id;
        this.title= title;
        this.artist= artist;
        this.culture= culture;
        this.imgUrl = imgUrl;
        this.hex1= hex1;
        this.hex2= hex2;
        this.hex3=hex3;
        this.hue1= hue1;
        this.hue2= hue2;
        this.hue3=hue3;
        this.hue4= hue4;
        this.hue5=hue5;
        this.percent1=percent1;
        this.percent2= percent2;
        this.percent3=percent3;
        hues = new ArrayList<String>();
        hues.add(hue1);
        hues.add(hue2);
        hues.add(hue3);
        hues.add(hue4);
        hues.add(hue5);
        this.year=year;    
        
        //reference: https://processing.org/reference/loadImage_.html
        //this.img = loadImage(imgURL, "png";)

    }

}

/*class GraphWeighted{
  //IMPLEMENTED FOR WEIGHTED HEXCODE
  boolean hexCode;

  int numVertices;
  HashMap<Integer,ArrayList<Pair<Vertex,Integer>>> adjList = new HashMap<Integer,ArrayList<Pair<Vertex,Integer>>>();

  ArrayList<Vertex> vertexStorage = new ArrayList<Vertex>();

  void setGraph(boolean hexCode)
  {
    this.hexCode = hexCode;
  }

  void buildGraph() {
    if(hexCode)
    {
      addEdgeColorWeighted();
    }
  }

  void addEdgeColorWeighted() {
    if(allPaintings)
    {
        for(int i = 0; i < numVertices; i++)
        { //for each vertex
          String hex = vertexStorage.get(i).hex1;
          //hex has the no.1 hex in the vertex
          int[] rgbValues = hexToRGB(hex);
          //RBG is an array of ints with the 3 RGB values, 0-255
          //now, compare with each other vertex:
          for(int j =0; j < numVertices; j++)
          {
            if(j!=i)//exclude self loop
            {
              String hexCompare = vertexStorage.get(i).hex1;
              int[] rgbCompare = hexToRGB(hexCompare);
              int rgbDifference = 0;
              for(int k = 0; k < 3; k++)
              {
                  int channelDifference = rgbValues[k] - rbgDifference[k];
                  channelDifference = Math.abs(channelDifference);
                  rgbDifference += channelDifference;
              }
              ArrayList<Pair<Vertex,Integer>> edges = new ArrayList<Pair<Vertex,Integer>>();
              //SET ARBITRARY COLOR DIFFERENCE FOR AN EDGE
              int differenceLimit = 100;
              //add the color difference as a weighted edge,
              //cutting off at our arbitrary limit
              if(rgbDifference < differenceLimit)
              {
                edges.add(new Pair<Vertex,Integer>(vertexStorage.get(j),rbgDifference));
              }
            }
          }
          adjList.put(i,edges);
        }
    }
  }

  int[] hexToRGB(String hex)
  {
    //Goal: take in hex string and return int[] with RGB values
    //RGBHexes has R,G,and B hexes as strings
    String[] rgbHexes = {hex.substring(1,3),hex.substring(3,5),hex.substring(5)};
    int[3] rgbValues;
    for(int i = 0; i < 3; i++)
    {
      //turn each hex into RBG value (0-255)
      String hex = rgbHexes[i];
      int value = Integer.parseInt(hex,16);
      rgbValues[i] = value;
    }
    return rgbValues;
  }
}*/

class Graph{
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
  //Empty Constructor
  Graph(){
    numVertices = 0;
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
        String hue = vertexStorage.get(i).hue1;
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String hue2 = vertexStorage.get(j).hue1;
            if(hue.equals(hue2)){
              value.add(vertexStorage.get(j));
            }
          }
        }
        adjList.put(i, value);
      }
    }
    //Similar to allPaintings but also accounting for culture strings matching
    else if(culture){
        for(int i = 0; i < numVertices; i++){
        String culture1 = vertexStorage.get(i).culture;
        String hue = vertexStorage.get(i).hue1;
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String culture2 = vertexStorage.get(j).culture;
            String hue2 = vertexStorage.get(j).hue1;
            if(hue.equals(hue2) && culture1.equals(culture2)){
              value.add(vertexStorage.get(j));
            }
          }
        }
        adjList.put(i, value);
      }
    }
    else if(timePeriod){
      int min = 0;
      int max = 0;
      for(int i = 0; i < numVertices; i++){
        String year1 = vertexStorage.get(i).year;
        if (year1.length() == 1)
        {
          min = 0;
          max= 100;
        }
        else if (year1.length() ==2)
        {
          min = 0;
          max= 100;
        }
        else if (year1.length() ==3)
        {
          String firstChar = year1.substring(0,1);
          firstChar += "00";
          min = Integer.valueOf(firstChar);
          max= min + 100;        
        }
         else if (year1.length() ==4)
        {
          String firstChar = year1.substring(0,1);
          firstChar += "000";
          min = Integer.valueOf(firstChar);

          max= min + 1000;
        }
        else
        {
          break;
        }    
        ArrayList<Vertex> value = new ArrayList();
        for(int j = 0; j < numVertices; j++){
          if(j !=i){
            String year2 = vertexStorage.get(j).year;
            if (!year2.equals("unknown"))
            {
              int year2Int = Integer.valueOf(year2);
              if(year2Int < max && year2Int >= min){
                value.add(vertexStorage.get(j));
              }
            }
            else
            {
              break;
            }
          }
        }
        adjList.put(i, value);
      }
    }
  }
  void addEdgeTitle(){
    //PSEUDOCODE: Comparing Titles that match keywords
    //maybe change the painting name to be String[] nameArray = split(painting Title, " ");
  
  }
  void addEdgeYear(){
  
  }
 //DEBUG
  void printAdjList(){
    println(adjList.size());
    for(int i = 0; i < adjList.size(); i++){
      println("Adjacency List of Vertex: " + i);
      for (int j = 0; j < adjList.get(i).size(); j++) {
         println(" -> "+adjList.get(i).get(j).hue1);
      }
    }
  }
  //graphDraw: draws the graph w/ vertices + edges
  void graphDraw(){
  }
}
