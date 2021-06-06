var bellman_graph=[]
var final_graph=[]
var vertices=6;
var weights=[];
var count=0;
var distance=0;
 var minDist;
function initialise(){
 for(var i=0; i<vertices;i++){
    bellman_graph[i]=createVector(random(width),random(height));
    console.log(bellman_graph[i].x + " " +bellman_graph[i].y);
  } 

 
}

function putVertex(fcolour,radius){
  var x,y;
  fill(fcolour);
  for(var i=0;i<vertices;i++){
    x=bellman_graph[i].x;
    y=bellman_graph[i].y;
    ellipse(x,y,radius);
  }
}

 

 

 

 
function connectVertex(r,g,b,lwght,path){
  stroke(r,g,b);
  strokeWeight(lwght);
  noFill();
  
  var x,y;
  beginShape();
  for (var i=0; i<vertices;i++){
    x=path[i].x;
    y=path[i].y;
    vertex(x,y);
  }
  vertex(path[0].x,path[0].y);
  endShape();
  
}

 

function mutate(path){
  var i=floor(random(vertices));
  var j=floor(random(vertices));
  
  var temp=path[i];
  path[i]=path[j];
  path[j]=temp;
}
 
function cost(path){
  const weights=new Array(path.length);
  for(var i=0;i<path.length;i++){
    weights[i]=100000
  }
  weights[0]=0;
  return weights;
  
}

 

function setup() {
  createCanvas(750, 600);
  initialise()
  weights=cost(bellman_graph);
   minDist=cost(bellman_graph)
  minPath=bellman_graph.slice();
  frameRate(10);
}

 

function draw() {
  
  background(50);
  putVertex(250,10);
  connectVertex(250,250,250,1,bellman_graph)
  mutate(bellman_graph)

   var d=cost(bellman_graph);

    for (var i = 0; i < bellman_graph.length; i++) {
      for (var j = 0; j < bellman_graph.length; j++) {
  distance=dist(bellman_graph[i].x,bellman_graph[i].y,bellman_graph[j].x,bellman_graph[j].y)
        if (distance !=0) { 
          if (weights[j] > (weights[i] + distance)) {
           
            weights[j] = weights[i] + distance;
            
           console.log(weights);
          }
          
        }
      }
       
    }
 
  if(d<minDist){
    minDist=d;
    minPath=bellman_graph.slice();  // copy of graph
    console.log(d);
    connectVertex(250,0,0,3,minPath);
    count=0
  }
  count++; 
  
  connectVertex(250,0,0,3,minPath);
  putVertex(250,10);
  
  if(count>10*vertices){
    noLoop();
    clear;
    
    putVertex(250,10);
    connectVertex(0,250,0,3,minPath)
  }

}