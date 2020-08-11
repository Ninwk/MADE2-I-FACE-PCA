function [ scaledface] = scaling( faceMat,lTarget,uTarget )  
%faceMat��Ҫ���й淶����ͼ�����ݣ�  
[m,n]=size(faceMat);  %40*20
scaledface=zeros(m,n); 
 

lowVec=min( faceMat );
upVec=max( faceMat )   ;
 for i=1:m
     
     scaledface(i,:)=(faceMat(i,:) - lowVec )./( upVec- lowVec)*(uTarget-lTarget)+lTarget;
 end
 save('1/scaling.mat','upVec','lowVec');
 
 