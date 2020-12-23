clc
clear all
syms FFS Nc N Sp Nn d;
d=0;
FFS=0;
q=1;
Pw=0; 
Nc=22*3;%Total number of colonists

    for i=1:10 %To iterate the number of bottles  
        for j=1:20  %To iterate the number of Howlers
            for Sp=5.8:0.1:8  %To iterate Static payload weight in lb
                Pw=Sp+(i*1.37568)+(j*0.279987);
                if Pw<15;% Max permissible weight of paylaod used as the limiting factor
                     d=25*(2^(1-max((Nc)/(8*j),(Nc)/(16.9*i))));  
                  FFS(q,1)=(((Nc*d)/(15))+((2*Sp))); %To store the FFS in a 2d Array
                  FFS(q,2)=i;  %To store the number of bottles in a 2d Array
                  FFS(q,3)=j; %To store the number of howlers in a 2d Array
                  FFS(q,4)=Sp; %To store the Static payload weight in a 2d Array
                  FFS(q,5)=Nc; %To store the Nubmer of colonists in a 2d Array
                  q=q+1;
               end
            end
                 
         end   
      end     
                
     for i=1:(q)  
         FFSMAX=sortrows(FFS,'descend'); %To Sort the 2d Array 
         if i<6; %To display the top 5 configurations
            fprintf('\nConfiguration %d\n',i);
            fprintf('\nFFS: %f\n',FFSMAX(i,1));
            fprintf('Bottles: %d\n',FFSMAX(i,2));
            fprintf('Howlers: %d\n',FFSMAX(i,3));
            fprintf('Static Payload: %f\n',FFSMAX(i,4));
            fprintf('No of colonists: %d\n',FFSMAX(i,5));
            
           end
     end

x=FFSMAX(:,3);
y=FFSMAX(:,2);
j=FFSMAX(:,1); 
tri = delaunay(x,y);
b=trisurf(tri,x,y,j);
title('Scoring Analysis')
xlabel('Number of Howlers')
ylabel('Number of Bottles')
zlabel('Final Flight Score')
cb=colorbar;
cb.Label.String = 'Final Flight score';
