%kΪ�ؽ�������ά
function rebuid(y,k)
 
%����ƽ������meanVec�����ɷ�����V
load 1/PCA.mat
 
temp = meanVec;
for i = 1:k    
    xi = (y - meanVec) * V(:,i);%ĳ����y�ڵ�iά��ͶӰֵ
    yi =  xi * V(:,i)';%ĳ����y�ڵ�iά������ֵ
    temp = temp + yi ;%�Ը�����ͶӰ������ά����������һ��ʸ����ӣ��õ�������������һ������ֵ
end
%��ʾ�ؽ�����
I = zeros(112,92);
I(:) = temp';
imshow(I,[]);