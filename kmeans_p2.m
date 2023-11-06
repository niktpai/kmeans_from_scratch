clear all; close all; clc;
% Loading datasets
kmtest = readtable('kmtest.csv');
iris = readtable('iris.csv');
kmtest = table2array(kmtest);
iris = table2array(iris(:,1:4));
% Part 1b: Clustering with K-means algorithm for kmtest dataset.
X = zscore(kmtest);
figure; plot(X(:,1),X(:,2),'k*','MarkerSize',5)
title("Original data set")
% For k = 2
k = 2;
GT = [];
for i = 0:size(X,1)-1
GT = [GT; mod(i,k)];
end
for iter = 1:2
   ctr0 = mean(X(GT==0,:));
   ctr1 = mean(X(GT==1,:));
   ctrs = [ctr0;ctr1];
  
   r=2;
   dist0 = (abs(X(:,1)-ctr0(1)).^2 + abs(X(:,2)-ctr0(2)).^2 ).^(1/r);
   dist1 = (abs(X(:,1)-ctr1(1)).^2 + abs(X(:,2)-ctr1(2)).^2 ).^(1/r);
  
   GT = dist0 > dist1;
end
figure, hold on;
plot(X(:,1),X(:,2),'k.');
plot(X(GT==0,1),X(GT==0,2),'bx');
plot(X(GT==1,1),X(GT==1,2),'ro');
plot(ctrs(:,1),ctrs(:,2),'k+','LineWidth',4,'MarkerSize',20);
txt = sprintf("For k=%g clusters",k);
title(txt)
% For k = 3
k = 3;
GT = [];
for i = 0:size(X,1)-1
GT = [GT; mod(i,k)];
end
 
for iter = 1:10
   ctr0 = mean(X(GT==0,:));
   ctr1 = mean(X(GT==1,:));
   ctr2 = mean(X(GT==2,:));
   ctrs = [ctr0;ctr1;ctr2];
   r=2;
   dist0 = (abs(X(:,1)-ctr0(1)).^2 + abs(X(:,2)-ctr0(2)).^2 ).^(1/r);
   dist1 = (abs(X(:,1)-ctr1(1)).^2 + abs(X(:,2)-ctr1(2)).^2 ).^(1/r);
   dist2 = (abs(X(:,1)-ctr2(1)).^2 + abs(X(:,2)-ctr2(2)).^2 ).^(1/r);
  
   dists = [dist0,dist1,dist2];
   mins = min(dists,[],2);
  
   GT = [];
   for i = 1:size(X,1)
       if dist0(i) == mins(i)
           group = 0;
       end
       if dist1(i) == mins(i)
           group = 1;
       end
       if dist2(i) == mins(i)
           group = 2;
       end
       GT = [GT; group];
   end
end
figure, hold on;
plot(X(:,1),X(:,2),'k.');
plot(X(GT==0,1),X(GT==0,2),'bx');
plot(X(GT==1,1),X(GT==1,2),'ro');
plot(X(GT==2,1),X(GT==2,2),'g*');
plot(ctrs(:,1),ctrs(:,2),'k+','LineWidth',4,'MarkerSize',20);
txt = sprintf("For k=%g clusters",k);
title(txt)
% For k = 4
k = 4;
GT = [];
for i = 0:size(X,1)-1
GT = [GT; mod(i,k)];
end
ctr0 = X(randi(size(X,1)),:);
ctr1 = X(randi(size(X,1)),:);
ctr2 = X(randi(size(X,1)),:);
ctr3 = X(randi(size(X,1)),:);
for iter = 1:50
 
   r=2;
   dist0 = (abs(X(:,1)-ctr0(1)).^2 + abs(X(:,2)-ctr0(2)).^2 ).^(1/r);
   dist1 = (abs(X(:,1)-ctr1(1)).^2 + abs(X(:,2)-ctr1(2)).^2 ).^(1/r);
   dist2 = (abs(X(:,1)-ctr2(1)).^2 + abs(X(:,2)-ctr2(2)).^2 ).^(1/r);
   dist3 = (abs(X(:,1)-ctr3(1)).^2 + abs(X(:,2)-ctr3(2)).^2 ).^(1/r);
  
   dists = [dist0,dist1,dist2, dist3];
   mins = min(dists,[],2);
  
   GT = [];
   for i = 1:size(X,1)
       if dist0(i) == mins(i)
           group = 0;
       end
       if dist1(i) == mins(i)
           group = 1;
       end
       if dist2(i) == mins(i)
           group = 2;
       end
       if dist3(i) == mins(i)
           group = 3;
       end
       GT = [GT; group];
   end
   ctr0 = mean(X(GT==0,:),1);
   ctr1 = mean(X(GT==1,:),1);
   ctr2 = mean(X(GT==2,:),1);
   ctr3 = mean(X(GT==3,:),1);
  
  
end
ctrs = [ctr0;ctr1;ctr2;ctr3];
figure, hold on;
plot(X(:,1),X(:,2),'k.');
plot(X(GT==0,1),X(GT==0,2),'bx');
plot(X(GT==1,1),X(GT==1,2),'ro');
plot(X(GT==2,1),X(GT==2,2),'g*');
plot(X(GT==3,1),X(GT==3,2),'c.');
plot(ctrs(:,1),ctrs(:,2),'k+','LineWidth',4,'MarkerSize',20);
txt = sprintf("For k=%g clusters",k);
title(txt)
% for k = 5
k = 5;
GT = [];
for i = 0:size(X,1)-1
GT = [GT; mod(i,k)];
end
ctr0 = X(randi(size(X,1)),:);
ctr1 = X(randi(size(X,1)),:);
ctr2 = X(randi(size(X,1)),:);
ctr3 = X(randi(size(X,1)),:);
ctr4 = X(randi(size(X,1)),:);
for iter = 1:50
 
   r=2;
   dist0 = (abs(X(:,1)-ctr0(1)).^2 + abs(X(:,2)-ctr0(2)).^2 ).^(1/r);
   dist1 = (abs(X(:,1)-ctr1(1)).^2 + abs(X(:,2)-ctr1(2)).^2 ).^(1/r);
   dist2 = (abs(X(:,1)-ctr2(1)).^2 + abs(X(:,2)-ctr2(2)).^2 ).^(1/r);
   dist3 = (abs(X(:,1)-ctr3(1)).^2 + abs(X(:,2)-ctr3(2)).^2 ).^(1/r);
   dist4 = (abs(X(:,1)-ctr4(1)).^2 + abs(X(:,2)-ctr4(2)).^2 ).^(1/r);
  
   dists = [dist0,dist1,dist2, dist3, dist4];
   mins = min(dists,[],2);
  
   GT = [];
   for i = 1:size(X,1)
       if dist0(i) == mins(i)
           group = 0;
       end
       if dist1(i) == mins(i)
           group = 1;
       end
       if dist2(i) == mins(i)
           group = 2;
       end
       if dist3(i) == mins(i)
           group = 3;
       end
       if dist4(i) == mins(i)
           group = 4;
       end
       GT = [GT; group];
   end
   ctr0 = mean(X(GT==0,:),1);
   ctr1 = mean(X(GT==1,:),1);
   ctr2 = mean(X(GT==2,:),1);
   ctr3 = mean(X(GT==3,:),1);
   ctr4 = mean(X(GT==4,:),1);
  
end
ctrs = [ctr0;ctr1;ctr2;ctr3;ctr4];
figure, hold on;
plot(X(:,1),X(:,2),'k.');
plot(X(GT==0,1),X(GT==0,2),'bx');
plot(X(GT==1,1),X(GT==1,2),'ro');
plot(X(GT==2,1),X(GT==2,2),'g*');
plot(X(GT==3,1),X(GT==3,2),'c.');
plot(X(GT==4,1),X(GT==4,2),'m^');
plot(ctrs(:,1),ctrs(:,2),'k+','LineWidth',4,'MarkerSize',20);
txt = sprintf("For k=%g clusters",k);
title(txt)
