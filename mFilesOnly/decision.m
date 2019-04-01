function out=decision(model,X)

for i=1:3
    d=svmPredict(model(i),X)
    dec(i)=sum(d);
end
dec
[value,index]=max(dec);

out={},
if index==1
    out='h'
elseif index==2
    out='m'
elseif index==3
    out='l'
    
end