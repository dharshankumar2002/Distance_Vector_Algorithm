clc;
clear all;
close all;


node=input('No. of Nodes: ');

% initialize the edge weights matrix
% 0 -> for same node
% randam number of 0 to 9 -> for different node
for i=1:node   
    for j=i:node       
        if(i==j)
    matrix(i,j)=0;
        else
            matrix(i,j)=randi(9,1);
            matrix(j,i)=matrix(i,j);
        end
    end
end
disp(matrix);

% Displaying graph for matrix
view(biograph(triu(matrix),[],'showarrows','off','ShowWeights','on','EdgeTextColor',[0 0 1]));

% matrix showing 123...
 i=1;
 x=1;
 mat1=triu(matrix);
 for i=1:node
     for j=1:node
         if(mat1(i,j)~=0)
             mat(i,j)=x;
             mat(j,i)=mat(i,j);
             x=x+1;      
         end
     end
 end
 
% fill initial matrix go(to,via,from)
% (via = to)
for from=1:node
    for via=1:node
        for to=1:node
            % source & destination should not be same node
            if(from~=via&&from~=to)
                % if destination node is neighbour node
                % soucre & destination should not be same node
                if(via==to&&matrix(from,to)~=0)
                    go(to,via,from)=matrix(from,to);
                else
                % if destination node is not neighbour, 
                % for now, temporarily assign high cost (Ex: 100)
                    go(to,via,from)=100;
                end
            else
                % if node can't be reached (or) edge not there
                % then assign inifity weight
                    go(to,via,from)=inf;
            end           
        end
    end
end
disp(go)

i=0;
while(i<2)
for from=1:node
    for to=1:node
        % source & destination should not be same node
        if(from~=to)
            if(matrix(from,to)~=0)%calculate neighbour node
                % again traverse through all nodes
                for x=1:node
                    for y=1:node 
                        % Egde relaxation:
                        % From weight of 100 changes to minimum possible wieght
                        temp(x,y)=matrix(from,to)+min(go(y,:,to));
                        if(temp(x,y)<go(y,to,from)&&go(y,to,from)<inf)
                            go(y,to,from)=temp(x,y);
                        end                      
                    end
                end
            end
        end
    end
end
i=i+1;
end
disp(go);

% Loop will start again if user need to see the min efficient path of 
% another source and destination nodes
choice='y';
while(choice=='y')
source=input('Source node: ');
dest=input('Destination node: ');
trace(1)=source;
j=2;
while(source~=dest)
% finds 'via which node' gives the minimum path
[row,col]=find(go(dest,:,source)==min(go(dest,:,source)));
trace(j)=col;
% that intermediate node will be setted as source node
% to continue next iteration and check for next intermediate node
source=col;
j=j+1;
end
k=1:j-1;
disp(trace(k));

% Assigning colour for our path - (for both edges & nodes)
bg=biograph(triu(matrix),[],'showarrows','off','ShowWeights','on','EdgeTextColor',[0 0 1]);
for i=1:j-1
%rgb colour assignment
set(bg.nodes(trace(i)), 'color', [1 0 0]); % red - destination
set(bg.nodes(trace(1)),'color',[0 1 0]); % green - source
if(i<j-1)
set(bg.edges(mat(trace(i+1),trace(i))),'linecolor',[1 0 0]); % red - all intermediate edges
end
end
view(bg);

choice=input('Do you want to check path for another source & destination node? (y/n):','s');
end

 