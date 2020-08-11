%改动时间1/6 23:00
clc,clear  ,close all
global imgrow;  
global imgcol;  
imgrow=256;  
imgcol=256;  
disp('读取训练数据...')
disp('......') 
%进入ReadFaces 函数，加载文件夹数据
[FaceContainer,faceLabel]=ReadFaces(9, 10, 0);
                        
t1=clock();
%[train_faceContainer,train_label] = ReadFace(10,0);

disp('训练数据PCA降维...') 
disp('......') 
%PCA降维
[pcaA ,V]=fastPCA(FaceContainer,20);

disp('显示主成脸...') 
%visualize_pc(V1)
disp('......') 
figure
visualize(V);


disp('训练数据归一化...');
disp('.........') 
[ scaledface] = scaling( pcaA,-1,1 );
 
disp('SVM样本训练...')  
disp('训练数据显示中...');
disp('.........') 
model = svmtrain(faceLabel,scaledface,'-t 0 ');

disp('训练数据显示完毕...');

t2=clock();
time=etime(t2,t1)
mA=mean(FaceContainer); 
disp('读取测试数据...')  

[test_faceContainer,test_label]=ReadFaces(9, 10, 1);

disp('测试数据pca降维...') 
disp('.......') 
load '1/PCA.mat'
testData = (test_faceContainer - repmat(meanVec,90,1)) * V;
%visualize(V1);
m=size(test_faceContainer,1);  
%for i=1:m  
%    test_faceContainer(i,:)=test_faceContainer(i,:)-mA;  
%end  
%testData=test_faceContainer*V;

disp('测试数据归一化...')  
disp('.......')  
scaled_testData = testscaling( testData,-1,1);

%imshow(scaled_testData)
disp('SVM样本分类预测...')
disp('......')  
[predict_label,accuracy,prob_estimates]=svmpredict(test_label,scaled_testData,model);

recognition(mA,V,model) 
