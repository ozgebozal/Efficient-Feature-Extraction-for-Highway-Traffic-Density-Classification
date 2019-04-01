MAIN%
nameBase='C:\Users\LENOVO\Desktop\Spring17\ee58j\proje\trafficdb\crop\crop';
load('ImageMaster.mat')
load('EvalSet.mat');
sizeTrain1=length(trainind{1,1});  % 1-4 for EACH TRAINING SET
svmTrainMatrix=[];
svmTrainGroup=[];
for p=1:1%sizeTrain1
indexCrop=trainind{1,1}(p);
path=strcat(nameBase,num2str(indexCrop));
featureDCT=dctFMD(path);
svmTrainMatrix=cat(1,svmTrainMatrix,featureDCT);
sizeCrop=size(featureDCT);
L=imagemaster{1,indexCrop}.class;
if strcmp(L,'heavy')
    label ='H';
elseif strcmp(L,'medium')
    label='M';
elseif strcmp(L,'light')
    label='L';
end
labelMat=repmat(label,sizeCrop(1),1);
svmTrainGroup=cat(1,svmTrainGroup,labelMat);
end



%%%%%%%%%%Static Features%%%%%%%%%%%%%
1 Edge histogram
featEdge1=edge_histogram('/Users/ferhatmelih/Google Drive/ee58j_term_project/crop1');



%%%%%%%%%%DYNAMIC Features%%%%%%%%%%%%%
DCT COEF
featDCT=dctFMD('/Users/ferhatmelih/Google Drive/ee58j_term_project/crop1');