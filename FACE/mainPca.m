%�Ķ�ʱ��1/6 23:00
clc,clear  ,close all
global imgrow;  
global imgcol;  
imgrow=256;  
imgcol=256;  
disp('��ȡѵ������...')
disp('......') 
%����ReadFaces �����������ļ�������
[FaceContainer,faceLabel]=ReadFaces(9, 10, 0);
                        
t1=clock();
%[train_faceContainer,train_label] = ReadFace(10,0);

disp('ѵ������PCA��ά...') 
disp('......') 
%PCA��ά
[pcaA ,V]=fastPCA(FaceContainer,20);

disp('��ʾ������...') 
%visualize_pc(V1)
disp('......') 
figure
visualize(V);


disp('ѵ�����ݹ�һ��...');
disp('.........') 
[ scaledface] = scaling( pcaA,-1,1 );
 
disp('SVM����ѵ��...')  
disp('ѵ��������ʾ��...');
disp('.........') 
model = svmtrain(faceLabel,scaledface,'-t 0 ');

disp('ѵ��������ʾ���...');

t2=clock();
time=etime(t2,t1)
mA=mean(FaceContainer); 
disp('��ȡ��������...')  

[test_faceContainer,test_label]=ReadFaces(9, 10, 1);

disp('��������pca��ά...') 
disp('.......') 
load '1/PCA.mat'
testData = (test_faceContainer - repmat(meanVec,90,1)) * V;
%visualize(V1);
m=size(test_faceContainer,1);  
%for i=1:m  
%    test_faceContainer(i,:)=test_faceContainer(i,:)-mA;  
%end  
%testData=test_faceContainer*V;

disp('�������ݹ�һ��...')  
disp('.......')  
scaled_testData = testscaling( testData,-1,1);

%imshow(scaled_testData)
disp('SVM��������Ԥ��...')
disp('......')  
[predict_label,accuracy,prob_estimates]=svmpredict(test_label,scaled_testData,model);

recognition(mA,V,model) 
