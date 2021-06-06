# Distance_Vector_Algorithm
Distance vector algorithm is a routing protocol used in computer networking

The main idea of Distance Vector algorithm is to find the path from a source router to destination router using Bellman ford algorithm.<br>
This algorithm is nothing but an extension of Link-State (Djiskras) algorithm. <br>
<hr style=\"border:0.5px solid gray\"> </hr>

<br>
## Working: 
<li>The algorithm first performs edge relaxation for all the edges (V-1 times). <br>
<li>All the routers exchange their routing tables continuously after equal intervals of time. <br>
<li>Using the Bellman equation, the router decides whether the path computed by itself has minimum weights or the path taken from the routing tables of other routers has minimum weight. <br>
<li>Accordingly, it updates its routing table and sends this new updated routing table to the other routers. <br>
  
<hr style=\"border:0.5px solid gray\"> </hr>
<br>
## Implementations Done: 

<br>
Python Code:
![image](https://user-images.githubusercontent.com/52622845/120930720-16252480-c70c-11eb-9040-d6473e084772.png)

<br>
MATLAB APP:
![image](https://user-images.githubusercontent.com/52622845/120930792-7025ea00-c70c-11eb-99eb-61840cc419be.png)

<br>
JavaScript Simulation:
![image](https://user-images.githubusercontent.com/52622845/120930799-74ea9e00-c70c-11eb-8ccb-a199ed4dccf6.png)

<br>
Cisco Packet Tracer:
![image](https://user-images.githubusercontent.com/52622845/120930802-7916bb80-c70c-11eb-9a39-9fb09f5b0a84.png)



