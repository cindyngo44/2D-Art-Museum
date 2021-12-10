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

  float x;
  float y;

  Vertex(int vertexNum, String id, String title, String artist, String culture, String imgUrl, String hex1, String hex2, String hex3, String percent1, String percent2, String percent3, 
    String hue1, String hue2, String hue3, String hue4, String hue5, String year) {
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
  }
}
class Graph {
  boolean culture;
  boolean timePeriod;
  boolean allPaintings;
  boolean colors;
  boolean titles;
  boolean locations;

  //Components for adjList graph
  int numVertices;
  HashMap<Integer, ArrayList<Vertex>> adjList = new HashMap<Integer, ArrayList<Vertex>>();

  //when we create new vertices, we store here in no order
  ArrayList<Vertex> vertexStorage = new ArrayList<Vertex>();
  //Empty Constructor
  Graph() {
    numVertices = 0;
  }

  //set the graph variables
  void setGraph(boolean culture, boolean timePeriod, boolean allPaintings, 
    boolean colors, boolean titles) {
    this.culture = culture;
    this.timePeriod = timePeriod;
    this.allPaintings = allPaintings;
    this.colors = colors;
    this.titles = titles;
  } 
  //buildGraph: is called after setting booleans, this function will check said
  //boolean functions and call addEdge____ for the appropriate graph construction
  void buildGraph() {
    if (colors) {
      addEdgeColor();
    } else if (titles) {
      addEdgeTitle();
    }
  }

  void addEdgeColor() {
    //given vertexStorage
    if (allPaintings) {
      for (int i = 0; i < numVertices; i++) {
        //iterate through vertexStorage
        //grab vertex at indices hue name
        //iterate thourgh num vertices and find all vertices hues that match hue name
        //EXCLUDING THE CURRENT VERTEX
        Vertex currVertex = vertexStorage.get(i);
        ArrayList<String> hues = new ArrayList<String>();
        hues.add(currVertex.hue1);
        hues.add(currVertex.hue2);
        hues.add(currVertex.hue3);

        ArrayList<Vertex> value = new ArrayList();
        for (int j = 0; j < numVertices; j++) {
          if (j !=i) {
            Vertex compareVertex = vertexStorage.get(j);
            ArrayList<String> compareHues = new ArrayList<String>();
            compareHues.add(compareVertex.hue1);
            compareHues.add(compareVertex.hue2);
            compareHues.add(compareVertex.hue3);

            if (hues.get(0).equals(compareHues.get(0)))
            {
              value.add(compareVertex);
            }
          }
          adjList.put(i, value);
        }
      }
    }
    //Similar to allPaintings but also accounting for culture strings matching
    else if (culture) {
      for (int i = 0; i < numVertices; i++) {
        String culture1 = vertexStorage.get(i).culture;
        String hue = vertexStorage.get(i).hue1;
        ArrayList<Vertex> value = new ArrayList();
        for (int j = 0; j < numVertices; j++) {
          if (j !=i) {
            String culture2 = vertexStorage.get(j).culture;
            String hue2 = vertexStorage.get(j).hue1;
            if (hue.equals(hue2) && culture1.equals(culture2)) {
              value.add(vertexStorage.get(j));
            }
          }
        }
        adjList.put(i, value);
      }
    } else if (timePeriod) {
      // min and max refer to the minimum year and maximum year in a century
      int min = 0;
      int max = 0;
      for (int i = 0; i < numVertices; i++) {
        String year1 = vertexStorage.get(i).year;
        //find the length of year1
        // if the length is 1, we know it's the 1st century (0-100)
        if (year1.length() == 1)
        {
          min = 0;
          max= 100;
        }
        // if the length is 2, we know it's the 1st century (0-100)
        else if (year1.length() ==2)
        {
          min = 0;
          max= 100;
        }
        // if the length is 3, we can find the century depending
        else if (year1.length() ==3)
        {
          String firstChar = year1.substring(0, 1);
          firstChar += "00";
          min = Integer.valueOf(firstChar);
          max= min + 100;
        }
        // if the length is 4, we can find the century depending
        else if (year1.length() ==4)
        {
          String firstChar = year1.substring(0, 1);
          firstChar += "000";
          min = Integer.valueOf(firstChar);

          max= min + 1000;
        } else
        {
          break;
        }    
        //parsing through vertexStorage and seeing which paintings are in the same century
        ArrayList<Vertex> value = new ArrayList();
        for (int j = 0; j < numVertices; j++) {
          if (j !=i) {
            String year2 = vertexStorage.get(j).year;
            if (!year2.equals("unknown"))
            {
              int year2Int = Integer.valueOf(year2);
              if (year2Int < max && year2Int >= min) {
                value.add(vertexStorage.get(j));
              }
            } else
            {
              break;
            }
          }
        }
        adjList.put(i, value); //add it to adjList
      }
    }
  }
  void addEdgeTitle() {
    //PSEUDOCODE: Comparing Titles that match keywords
    //maybe change the painting name to be String[] nameArray = split(painting Title, " ");
    for (int i = 0; i < numVertices; i++) {
      //iterate through vertexStorage
      //EXCLUDING THE CURRENT VERTEX
      Vertex currVertex = vertexStorage.get(i);
      String title = currVertex.title;
      String[] words = title.split(" ");

      ArrayList<Vertex> value = new ArrayList();
      for (int j = 0; j < numVertices; j++) {
        if (j !=i) {
          Vertex compareVertex = vertexStorage.get(j);
          String[] compareWords = compareVertex.title.split(" ");

          boolean match = false;
          //we need to see if any Strings in words and compareWords match
          for (int k = 0; k < words.length; k++)
          {
            for (int l = 0; l < compareWords.length; l++)
            {
              if (words[k].equals(compareWords[l]) && !words[k].equals("unknown"))
              {
                match = true;
              }
            }
          }
          if (match) value.add(compareVertex);
        }
        adjList.put(i, value);
      }
    }
  }
  //DEBUG FOR RELATIONSHIP: COLOR
  void printAdjList() {
    println(adjList.size());
    for (int i = 0; i < adjList.size(); i++) {
      println("Adjacency List of Vertex: " + i);
      for (int j = 0; j < adjList.get(i).size(); j++) {
        println(" -> "+adjList.get(i).get(j).hue1);
      }
    }
  }
  //graphDraw: draws the graph w/ vertices + edges
  void graphDraw() {
    //first, find the vertex with title stored in variable search
    Vertex center = findCenter();
    if (center != null)
    {
      center.x = 450;
      center.y = 400;

      pushMatrix();
      translate(450, 400);

      //draw center node
      fill(255);
      if(!center.imgUrl.equals("unknown") && !center.imgUrl.equals(""))
      {
      PImage webImg = loadImage(center.imgUrl, "png");
                while (webImg.width > 300 || webImg.height > 300)
          {
            webImg.resize(webImg.width/2, webImg.height/2);
          }

      strokeWeight(1);
      stroke(255);
      float radius = 300;

      //draw each node attached to center node
      ArrayList<Vertex> adjacent = adjList.get(center.vertexNum);
      for (int i = 0; i < adjacent.size(); i++)
      {
        println(adjacent.get(i).title);
      }
      int numAdjacent = adjacent.size();
      println(numAdjacent);
      //LIMIT EDGES SHOWN
      int times;
      if(numAdjacent < 10)
      {
        counter = 0;
        times = numAdjacent;
      }
      else
      {
        times = (counter+1)*10;
      }
      for (int i = 10*counter; i < times; i++)
      {
        Vertex adj = adjacent.get(i);
        if (!adj.imgUrl.equals("unknown") && !adj.imgUrl.equals(""))
        {
          pushMatrix();
          float angle = (TWO_PI / float(times-(counter*10)));
          line(0, 0, radius * cos(i*angle), radius * sin(i*angle));
          pushMatrix();
          translate(radius * cos(i*angle), radius * sin(i*angle));
          PImage webImg2 = loadImage(adj.imgUrl, "png");
          while (webImg2.width > 200 || webImg2.height > 200)
          {
            webImg2.resize(webImg.width/2, webImg.height/2);
          }
          image(webImg2, -webImg2.width/2, -webImg2.height/2);
          popMatrix();
          popMatrix();
        }
      }
      image(webImg, -webImg.width/2, -webImg.height/2);
      popMatrix();
      }
      else println("bad URL");
    }
  }

  Vertex findCenter()
  {
    println("Looking for " + search);
    //search through all vertices
    for (int i = 0; i < vertexStorage.size(); i++)
    {
      Vertex currVertex = vertexStorage.get(i);
      if (currVertex.title.equals(search)) 
      {
        println("found!");
        return currVertex;
      }
    }
    println("Not found");

    Vertex random = vertexStorage.get(randomChoice);
    println(random.title);
    return random;
  }
}
