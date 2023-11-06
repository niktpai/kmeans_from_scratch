clear all; close all; clc;
% Loading datasets
kmtest = readtable('kmtest.csv');
iris = readtable('iris.csv');
kmtest = table2array(kmtest);
iris = table2array(iris(:,1:4));
% Part 2a: Clustering with K-means algorithm for iris dataset.
X = iris(:,3:4);
figure; plot(X(:,1),X(:,2),'k*','MarkerSize',5)
title("Original data set")
k = 3;
GT = [];
for i = 0:size(X,1)-1
GT = [GT; mod(i,k)];
end
for run = 1:5
   ctr0 = X(randi(size(X,1)),:);
   ctr1 = X(randi(size(X,1)),:);
   ctr2 = X(randi(size(X,1)),:);
   for iter = 1:10
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
   ctr0 = mean(X(GT==0,:),1);
   ctr1 = mean(X(GT==1,:),1);
   ctr2 = mean(X(GT==2,:),1);
   ctrs = [ctr0;ctr1;ctr2];
   figure, hold on;
   plot(X(:,1),X(:,2),'k.');
   plot(X(GT==0,1),X(GT==0,2),'bx');
   plot(X(GT==1,1),X(GT==1,2),'ro');
   plot(X(GT==2,1),X(GT==2,2),'g*');
   plot(ctrs(:,1),ctrs(:,2),'k+','LineWidth',4,'MarkerSize',20);
   txt = sprintf("Run %g",run);
   title(txt)
  
end

