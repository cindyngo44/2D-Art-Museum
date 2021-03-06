import controlP5.*;
import java.time.Duration;
import java.time.Instant;
import javafx.util.Pair;
import java.io.*;
import java.util.*;

ControlP5 cp5;
RadioButton paintingCategories;
RadioButton relationships;
RadioButton algorithms;
Textfield t;
String search;
PFont pf1;

//GLOBAL VARIBALES
boolean visualize = false; //program start/reset variable
boolean culture;
boolean timePeriod;
boolean allPaintings;
boolean colors;
boolean titles;
boolean bfs;
boolean dfs;
boolean dijkstra;

boolean prevCulture;
boolean prevTimePeriod;
boolean prevAllPaintings;
boolean prevColors;
boolean prevTitles;
boolean prevBfs;
boolean prevDfs;


//TEXT VARIABLES
String title = "Graph Art Museum";
String description = "           Welcome to the Harvard Art Museum! Here, you can examine the archive of art pieces in a large visual representation. Observe different patterns within cultures, time periods, or the entire collection! Choose a painting category, relationship to observe, and and algorithm to compare!";
String paintingCategoriesTitle = "Painting Categories: ";
String relationshipsTitle = "Relationships: ";
String algorithmsTitle = "Algorithms: ";
String credits = "COP3530: Cindy Ngo, Neha Kallamvalli, Jacob Mass";

//GRAPH VARIABLES
Graph newGraph = new Graph();
BFS runBFS;
DFS runDFS;

//IO Variables
BufferedReader br;
Table table;
int randomChoice;
int counter;

void setup(){
    //pixelDensity(2);
    size(1200,800);
    frameRate(60);
    randomChoice = int(random(7000));
    
    //Control Variables
    cp5 = new ControlP5(this);
    paintingCategories = cp5.addRadioButton("checkBox")
    .setPosition(930, 200)
    .setSize(25, 25)
    .addItem("Culture", 0)
    .addItem("Time Period", 0)
    .addItem("All Paintings", 0)
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
     relationships = cp5.addRadioButton("checkBox1")
    .setPosition(930, 350)
    .setSize(25, 25)
    .addItem("Colors", 0)
    .addItem("Titles", 0) 
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
     algorithms = cp5.addRadioButton("checkBox2")
    .setPosition(930, 500)
    .setSize(25, 25)
    .addItem("BFS", 0)
    .addItem("DFS",0)
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
    cp5.addButton("visualize")
    .setLabel("Visualize")
    .setPosition(950, 700)
    .setSize(175, 50);
    
    pf1 = createFont("Franklin Gothic Demi", 15, true);
    t = cp5.addTextfield("titleSearch")
    .setPosition(950,625)
    .setSize(200,30)
    .setLabel("Search by title")
    .setFont(pf1)
    .setAutoClear(false)
    ;
    
    loadCSV();
}
void draw(){
    background(0);
    //UI GREY RECTANGLE
    noStroke();
    fill(#808080);
    rect(900, 20, 275, 750, 50, 50, 50, 50);
    
    //PROGRAM LOOP
    checkToggles(); //checks which variables are toggles true
    
    if(visualize){
       //set graph function
       newGraph.setGraph(prevCulture, prevTimePeriod, prevAllPaintings,
                          prevColors, prevTitles);
       //build graph function
       newGraph.buildGraph();

       if(prevBfs){
           //Reference: Function Execution Time in Java: 
           //https://www.tutorialspoint.com/how-to-measure-execution-time-for-a-java-method
           float start = System.nanoTime();
           runBFS = new BFS(newGraph);
           runBFS.runAlgorithm();
           float end = System.nanoTime();  
           println("Elapsed Time in nano seconds for BFS: " + (end-start));
           
           //Will print only once
           prevBfs = false;
       }
       else if(prevDfs){
           //Reference: Function Execution Time in Java: 
           //https://www.tutorialspoint.com/how-to-measure-execution-time-for-a-java-method
           float start = System.nanoTime();
           runDFS = new DFS(newGraph);
           runDFS.runAlgorithm();
           float end = System.nanoTime();  
           println("Elapsed Time in nano seconds for DFS: " + (end-start));
           
           //Will print only once
           prevDfs = false;
       }
       if(!search.equals("")) newGraph.graphDraw();
    }
    
    //UI TEXT
    //TITLE
    fill(0);
    textSize(18);
    text(title, 955, 50);
    //DESCRIPTION
    textSize(10);
    text(description, 910, 60, 250,110);
    //PAINTING CATEGORIES
    textSize(16);
    text(paintingCategoriesTitle, 920, 190);
    //RELATIONSHIPS
    text(relationshipsTitle, 920, 340);
    //ALGORITHMS
    text(algorithmsTitle, 920, 490);
    //CREDITS
    fill(#FFFFFF);
    textSize(10);
    text(credits, 915,780);
    
}
//Program Start: Will check for toggles first, and then set the variables for which 
//paintings, relationships, and algorithms to use. Nothing will be visualized at first
void visualize(){
  visualize = true;
  
  prevCulture = culture;
  prevTimePeriod = timePeriod;
  prevAllPaintings = allPaintings;
  prevColors = colors;
  prevTitles = titles;
  prevBfs = bfs;
  prevDfs = dfs;
  
  search = cp5.get(Textfield.class, "titleSearch").getText();
  
  redraw();
}

void keyPressed() {
  if(key == ' ')
  {
    counter++;
  }
}

//Check toggles for Painting Categories, Relationships, Algorithms
void checkToggles(){ 
    culture = paintingCategories.getState(0);
    timePeriod = paintingCategories.getState(1);
    allPaintings  = paintingCategories.getState(2);
    
    colors = relationships.getState(0);
    titles = relationships.getState(1);
    
    bfs = algorithms.getState(0);
    dfs = algorithms.getState(1);
}
void loadCSV(){
  

  //loading data from csv file
  Vertex newVertex;
  table = loadTable("painting.csv", "header");
  println(table.getRowCount() + " total rows in table");


  for (TableRow row : table.rows()) {

      //assigning the attributes

    String id= row.getString("id");
    String title= row.getString("title");
    String artist = row.getString("artist");
    String culture = row.getString("culture");
    String imgUrl = row.getString("image");
    String hex1 = row.getString("hex1");
    String hex2= row.getString("hex2");
    String hex3= row.getString("hex3");
    String percent1= row.getString("percent1");
    String percent2 = row.getString("percent2");
    String percent3 = row.getString("percent3");
    String hue1= row.getString("hue1");
    String hue2= row.getString("hue2");
    String hue3= row.getString("hue3");
    String hue4 = row.getString("hue4");
    String hue5 =row.getString("hue5");
    String year= row.getString("year");

    newVertex = new Vertex(newGraph.numVertices, id, title, artist, culture, imgUrl, hex1, hex2, hex3, percent1, percent2, percent3, hue1, hue2, hue3, hue4, hue5, year);

    newGraph.numVertices++; //adding to total number of vertices
    newGraph.vertexStorage.add(newVertex); //adding the new vertex into vertexStorage
    }   
}
