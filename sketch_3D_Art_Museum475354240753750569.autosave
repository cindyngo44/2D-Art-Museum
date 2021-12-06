import controlP5.*;

ControlP5 cp5;
RadioButton paintingCategories;
RadioButton relationships;
RadioButton algorithms;

//GLOBAL VARIBALES
boolean visualize = false; //program start/reset variable
boolean culture;
boolean timePeriod;
boolean allPaintings;
boolean colors;
boolean tagsKeyWords;
boolean locations;
boolean bfs;
boolean prims;
boolean biconnectivity;

//TEXT VARIABLES
String title = "Graph Art Museum";
String description = "           Welcome to the Harvard Art Museum! Here, you can examine the archive of art pieces in a large visual representation. Observe different patterns within cultures, time periods, or the entire collection! Choose a painting category, relationship to observe, and and algorithm to compare!";
String paintingCategoriesTitle = "Painting Categories: ";
String relationshipsTitle = "Relationships: ";
String algorithmsTitle = "Algorithms: ";
String credits = "COP3520: Cindy Ngo, Neha Kallamvalli, Jacob Mass";

void setup(){
    pixelDensity(2);
    size(1200,800);
    frameRate(60);
    
    //Control Variables
    cp5 = new ControlP5(this);
    paintingCategories = cp5.addRadioButton("checkBox")
    .setPosition(930, 200)
    .setSize(25, 25)
    .addItem("Culture", 0)//stroke
    .addItem("Time Period", 0) //color
    .addItem("All Paintings", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
     relationships = cp5.addRadioButton("checkBox1")
    .setPosition(930, 350)
    .setSize(25, 25)
    .addItem("Colors", 0)//stroke
    .addItem("Tags/Keywords", 0) //color
    .addItem("Locations", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
     algorithms = cp5.addRadioButton("checkBox2")
    .setPosition(930, 500)
    .setSize(25, 25)
    .addItem("BFS", 0)//stroke
    .addItem("Prim's Algorithm", 0) //color
    .addItem("Biconnectivity", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
    cp5.addButton("visualize")
    .setLabel("Visualize")
    .setPosition(950, 700)
    .setSize(175, 50);
    
}
void draw(){
    background(0);
    //UI GREY RECTANGLE
    noStroke();
    fill(#808080);
    rect(900, 20, 275, 750, 50, 50, 50, 50);
    
    //PROGRAM LOOP
    checkToggles(); //checks which variables are toggles true
    
    //TODO: create graph based on toggles
    if(visualize){
      
       
       //TODO: execute algorithm based on toggles
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
}
//Check toggles for Painting Categories, Relationships, Algorithms
void checkToggles(){ 
    culture = paintingCategories.getState(0);
    timePeriod = paintingCategories.getState(1);
    allPaintings  = paintingCategories.getState(2);
    
    colors = relationships.getState(0);
    tagsKeyWords = relationships.getState(1);
    locations = relationships.getState(2);
    
    bfs = algorithms.getState(0);
    prims = algorithms.getState(1);
    biconnectivity = algorithms.getState(2);
}
