function [ testscaledface] = testscaling( faceMat,lTargB,uTargB )   
% lowvecԭ��ͼ�������е���Сֵ  
% upvecԭ��ͼ�������е����ֵ  
[m,n] = size(faceMat);
testscaledface = zeros(m,n);
load 1/scaling.mat
 for i=1:n
     testscaledface(:,i)=(faceMat(:,i) - lowVec(i) )/( upVec(i)- lowVec(i))*(uTargB-lTargB)+lTargB;   
 end