function mapI_TI = QryonTestBi( W, testImgCat, testTxtCat )

% metricPath = '.\Cosine_Scale\';
% 
% dataPath = '..\..\2. 实验数据集\wikipedia_dataset';
% load([dataPath '\raw_features']);
% [trainTxt trainImg trainCat] = textread([dataPath '\trainset_txt_img_cat.list'], '%s %s %d');
% [testTxt testImg testCat] = textread([dataPath '\testset_txt_img_cat.list'], '%s %s %d');

%load([metricPath 'Laplacian.mat']);
%load([metricPath 'Similarity.mat']);
%W = 1./(1+exp(-1*W));
%query = W(tr_n+1:tr_n+te_n,tr_n+1:tr_n+te_n);
query = W;
ImgQuery = query;
TxtQuery = query';

[Y,ImgQuery] = sort(ImgQuery,2,'descend');
[Y,TxtQuery] = sort(TxtQuery,2,'descend');


%% ----------evaluation-------------
% image query text
catImgNum = zeros(length(testImgCat),1);
for i = 1:length(testImgCat)
    catImgNum(i) = sum(testTxtCat==testImgCat(i));
end
% text query image
catTxtNum = zeros(length(testTxtCat),1);
for i = 1:length(testTxtCat)
    catTxtNum(i) = sum(testImgCat==testTxtCat(i));
end

[mapI_TI,mapICategory] = evaluateMAP_fast_general(ImgQuery,testImgCat,testTxtCat,catImgNum);
disp([num2str(mapI_TI)]);

%draw the pr curve
%[mapI,prIQ,catMAPIQ] = evaluateMAPBi(ImgQuery,testImgCat, testTxtCat);
mapI = -1;
prIQ = -1;
catMAPIQ = -1;
mapT = -1;
prTQ = -1;
catMAPTQ = -1;
%[mapT,prTQ,catMAPTQ] = evaluateMAPBi(TxtQuery,testTxtCat, testImgCat);
end
