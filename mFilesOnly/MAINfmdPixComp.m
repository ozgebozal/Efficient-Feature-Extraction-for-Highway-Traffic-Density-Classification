%MAIN%
nameBase='/Users/ferhatmelih/Google Drive/ee58j_term_project/crop/crop';
load('ImageMaster.mat')
load('EvalSet.mat');
sizeTrain1=length(trainind{1,1});  % 1-4 for EACH TRAINING SET
svmTrainMatrix=[];
svmTrainGroup=[];
for p=1:sizeTrain1
indexCrop=trainind{1,1}(p);
path=strcat(nameBase,num2str(indexCrop));
featureDCT=pixelComparison(path);
svmTrainMatrix=cat(1,svmTrainMatrix,featureDCT);
sizeCrop=size(featureDCT);
L=imagemaster{1,indexCrop}.class;
if strcmp(L,'heavy')
    label =4;
elseif strcmp(L,'medium')
    label=3;
elseif strcmp(L,'light')
    label=2;
end
labelMat=repmat(label,sizeCrop(1),1);
svmTrainGroup=cat(1,svmTrainGroup,labelMat);
end

disp('selam')
svmTrainGroupH=svmTrainGroup;
svmTrainGroupH(svmTrainGroupH==4)=1;
svmTrainGroupH(svmTrainGroupH==3)=0;
svmTrainGroupH(svmTrainGroupH==2)=0;
svmTrainGroupM=svmTrainGroup;
svmTrainGroupM(svmTrainGroupH==3)=1;
svmTrainGroupM(svmTrainGroupM==4)=0;
svmTrainGroupM(svmTrainGroupM==2)=0;
svmTrainGroupL=svmTrainGroup;
svmTrainGroupL(svmTrainGroupH==2)=1;
svmTrainGroupL(svmTrainGroupL==4)=0;
svmTrainGroupL(svmTrainGroupL==3)=0;

% MaxIter=Inf;
x1 = [1 2 1]; x2 = [0 4 -1]; sigma = 2;
% C=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
% sigma=[0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
svm_model_h=svmTrain(svmTrainMatrix,svmTrainGroupH,0.03,@(x1, x2) gaussianKernel(x1, x2,2));
svm_model_m=svmTrain(svmTrainMatrix,svmTrainGroupM,0.03,@(x1, x2) gaussianKernel(x1, x2,2));
svm_model_l=svmTrain(svmTrainMatrix,svmTrainGroupL,0.03,@(x1, x2) gaussianKernel(x1, x2,2));

modelDCT(1)=svm_model_h;
modelDCT(2)=svm_model_m;
modelDCT(3)=svm_model_l;

%%%%%%%%%%%Static Features%%%%%%%%%%%%%
%1 Edge histogram
%featEdge1=edge_histogram('/Users/ferhatmelih/Google Drive/ee58j_term_project/crop1');



%%%%%%%%%%%DYNAMIC Features%%%%%%%%%%%%%
%DCT COEF
%featDCT=dctFMD('/Users/ferhatmelih/Google Drive/ee58j_term_project/crop1');