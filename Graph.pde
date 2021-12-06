class Vertex{
  //TODO (Cindy): Create the Vertex/Node class of the different painting attributes
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
}
