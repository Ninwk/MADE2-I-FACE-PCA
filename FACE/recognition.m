function recognition(mA,V,model) 
%�������ã�����ʶ��ģ�飬�����Ѿ����õ�ģ�ͣ�������һ����������ʶ��
%���룺
%           mA-��ֵ
%           V-Э���������������
%           model-ͨ��SVM��ѵ����ѵ���ó����Ѿ������õ�ģ��
%%
global imgrow;  
global imgcol;  
%%

%���������ѡ��Ҫʶ���ͼƬ
select_person_num=str2double(cell2mat(inputdlg('�ڼ�λ��')));%�ܹ�40����
select_img_num=str2double(cell2mat(inputdlg('�ڼ��ţ�')));%�ܹ�10��ͼ
%%
%��ͼƬ��Ϣ���д�����Ϊ1*10304��������
disp('��ȡѡ���ͼƬ...')  
select_facepath=strcat('photo\',num2str(select_person_num),'\',num2str(select_img_num),'.jpg');
select_img=imread(select_facepath);
select_matrix=zeros(1,imgrow*imgcol);
select_matrix(1,:)=select_img(:)';



select_matrix=(select_matrix-mA)*V;%PCA��ά��ĵ�ά��ʾ
%%
%ͼ�ι�һ��
disp('�淶��ѡ���ͼƬ...')  
[select_matrix] = scaling( select_matrix,min(select_matrix),max(select_matrix));
%[select_matrix1] = scaling( select_matrix,-1,1) ;

%%
%����ѡ���ͼƬ��accuracyֻ������ֵ��100%��ʾƥ����ȷ��0%��ʾƥ�����
disp('����ѡ���ͼƬ...')  
[select_predict_label,accuracy,decision_values]=svmpredict(select_person_num,select_matrix,model);

%%
%��ʾԭ��ͼƬ��ƥ��ͼƬ���бȽ�
disp('��ʾѡ���ͼƬ...')  
figure(2);
subplot(2,1,1);imshow(select_img);title('ԭͼ');
subplot(2,1,2);
imshow(imread(strcat('photo\',num2str(select_predict_label),'\',num2str(1),'.jpg')));
title('�ҵ���');
