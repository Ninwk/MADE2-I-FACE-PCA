function [FaceContainer,faceLabel]=ReadFaces(nFacesPerPerson, nPerson, bTest)
% ����ORL�������ָ����Ŀ������ǰǰ����(ѵ��)
%
% ���룺nFacesPerPerson --- ÿ������Ҫ�������������Ĭ��ֵΪ 5
%       nPerson --- ��Ҫ�����������Ĭ��Ϊȫ�� 40 ����
%       bTest --- bool�͵Ĳ�����Ĭ��Ϊ0����ʾ����ѵ��������ǰ5�ţ������Ϊ1����ʾ���������������5�ţ�
%
% �����FaceContainer --- ����������������nPerson * 10304 �� 2 ά����ÿ�ж�Ӧһ����������



img=imread('photo\1\1.jpg');%Ϊ����ߴ��ȶ���һ��
[imgRow,imgCol]=size(img);





FaceContainer = zeros(nFacesPerPerson*nPerson, imgRow*imgCol);
faceLabel = zeros(nFacesPerPerson*nPerson, 1);

% ����ѵ������
for i=1:nPerson
    i1=mod(i,10); % ��λ
    i0=char(i/10);
   if bTest == 0 % ����ѵ������
        strPath='photo\';
   else
        strPath='photo\';
   end
    if( i0~=0 )
        strPath=strcat(strPath,'0'+i0);
    end
    strPath=strcat(strPath,'0'+i1);
    strPath=strcat(strPath,'/');
    tempStrPath=strPath;
    for j=1:nFacesPerPerson
        strPath=tempStrPath;
        
        if bTest == 0 % ����ѵ������
            strPath = strcat(strPath, '0'+j);
        else
            strPath = strcat(strPath, num2str(10+j));
        end
        
        strPath=strcat(strPath,'.jpg');
        img=imread(strPath);
        if bTest==1
            %imshow(img)
        end
        
        %�Ѷ����ͼ���д洢Ϊ������������������������faceContainer�Ķ�Ӧ����
        FaceContainer((i-1)*nFacesPerPerson+j,     :   ) = img(:)';
        faceLabel((i-1)*nFacesPerPerson+j) = i;
        
    end % j
end % i



% ����������������
save('1/FaceMat.mat', 'FaceContainer')




