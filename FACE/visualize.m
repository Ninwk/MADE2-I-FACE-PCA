function visualize(V)  
global imgrow;  
global imgcol;  

img=zeros(imgrow,imgcol) ;
for i=1:20 
    img(:)=V(:,i);  
    subplot(5,4,i);  
    imshow(img,[])
end  