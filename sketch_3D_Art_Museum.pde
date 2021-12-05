import controlP5.*;

ControlP5 cp5;
CheckBox paintingCategories;
CheckBox relationships;
CheckBox algorithms;

//GLOBAL VARIBALES
boolean visualize = false; //program start/reset var

void setup(){
    size(960,540);
    frameRate(60);

    //Control Variables //TODO: SET UP ALL CONTROLS
    cp5 = new ControlP5(this);
    paintingCategories = cp5.addCheckBox("checkBox")
    .setPosition(250, 20)
    .setSize(20, 20)
    .addItem("Culture", 0)//stroke
    .addItem("TimePeriod", 0) //color
    .addItem("All Paintings", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(20);
    
     relationships = cp5.addCheckBox("checkBox1")
    .setPosition(250, 140)
    .setSize(20, 20)
    .addItem("Colors", 0)//stroke
    .addItem("Tags/Keywords", 0) //color
    .addItem("Locations", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(20);
    
     algorithms = cp5.addCheckBox("checkBox2")
    .setPosition(250, 260)
    .setSize(20, 20)
    .addItem("BFS", 0)//stroke
    .addItem("Prim's Algorithm", 0) //color
    .addItem("Bioconnectivity", 0)//blend
    .setItemsPerRow(1)
    .setSpacingRow(20);
    
}
void draw(){
    background(0);
    
    checkToggles(); //checks which variables are toggles true
    if(visualize){
       //TODO: create graph based on toggles
       
       //TODO: execute algorithm based on toggles
    }

}
//Program Start: Will check for toggles first, and then set the variables for which 
//paintings, relationships, and algorithms to use
void visualize(){
  visualize = true;
}
//Check toggles for Painting Categories, Relationships, Algorithms
void checkToggles(){
}
