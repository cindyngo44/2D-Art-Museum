import controlP5.*;

ControlP5 cp5;
CheckBox paintingCategories;
CheckBox relationships;
CheckBox algorithms;

//GLOBAL VARIBALES
boolean visualize = false; //program start/reset var
boolean culture;
boolean timePeriod;
boolean allPaintings;
boolean colors;
boolean tagsKeyWords;
boolean locations;
boolean bfs;
boolean prims;
boolean biconnectivity;

void setup(){
    size(1200,800);
    frameRate(60);
    
    //Control Variables
    cp5 = new ControlP5(this);
    paintingCategories = cp5.addCheckBox("checkBox")
    .setPosition(930, 200)
    .setSize(25, 25)
    .addItem("Culture", 0)//stroke
    .addItem("Time Period", 0) //color
    .addItem("All Paintings", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
     relationships = cp5.addCheckBox("checkBox1")
    .setPosition(930, 350)
    .setSize(25, 25)
    .addItem("Colors", 0)//stroke
    .addItem("Tags/Keywords", 0) //color
    .addItem("Locations", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(10);
    
     algorithms = cp5.addCheckBox("checkBox2")
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
    //writing as if 2D for now
    noStroke();
    fill(#808080);
    rect(900, 20, 275, 750, 50, 50, 50, 50);
    
    checkToggles(); //checks which variables are toggles true
    if(visualize){
       //TODO: create graph based on toggles
       
       //TODO: execute algorithm based on toggles
    }

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
//Mouse Controls (if 3D)
void mouseDragged() {
  if (cp5.isMouseOver()) {
    return;
  } else {

    /*newCamera.updateLocations();
    camera();
    perspective();*/
  }
}
