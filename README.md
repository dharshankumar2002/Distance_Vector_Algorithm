# Distance_Vector_Algorithm
Distance vector algorithm is a routing protocol used in computer networking

The main idea of Distance Vector algorithm is to find the path from a source router to destination router using Bellman ford algorithm.<br>
This algorithm is nothing but an extension of Link-State (Djiskras) algorithm. <br>
<hr style=\"border:0.5px solid gray\"> </hr>


#### Working: 
<li>The algorithm first performs edge relaxation for all the edges (V-1 times). <br>
<li>All the routers exchange their routing tables continuously after equal intervals of time. <br>
<li>Using the Bellman equation, the router decides whether the path computed by itself has minimum weights or the path taken from the routing tables of other routers has minimum weight. <br>
<li>Accordingly, it updates its routing table and sends this new updated routing table to the other routers. <br>
  
<hr style=\"border:0.5px solid gray\"> </hr>

#### MATLAB App:
<br>
<p align="left">
  <img src="./Matlab App/2.png" width="500" alt="MATLAB app">
</p>

