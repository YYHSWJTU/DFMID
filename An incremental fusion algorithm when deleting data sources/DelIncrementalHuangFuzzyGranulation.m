function [NewTFNumber,TotalDelFusionTime]=DelIncrementalHuangFuzzyGranulation(OldData,OldDataIndex,NewData,NewDataIndex,OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,...
RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3)
ComputingTime=zeros(3,1);
NewTFNumber=zeros(1,4);
OldDataNum=size(OldData,1);
NewDataNum=size(NewData,1);
ResIndex=setdiff(OldDataIndex,NewDataIndex);
tic
NewSum=OldSumDominantMatrix(ResIndex,1)-sum(OldDominantMatrix(ResIndex,NewDataIndex),2);
[S1,S2]=sort(NewSum,'descend');
NewRank=S2;
CombinedData=OldData(ResIndex,:);
RowSize=size(CombinedData,1);
if mod(RowSize,2)==1  
    MedianOdd=(1+RowSize)/2;
    Leftmedian=CombinedData(NewRank(MedianOdd,1),1);
    Rightmedian=CombinedData(NewRank(MedianOdd,1),2);
else   
    MedianEven1=RowSize/2;
    MedianEven2=MedianEven1+1;
    Leftmedian=(CombinedData(NewRank(MedianEven1,1),1)+CombinedData(NewRank(MedianEven2,1),1))/2; 
    Rightmedian=(CombinedData(NewRank(MedianEven1,1),2)+CombinedData(NewRank(MedianEven2,1),2))/2; 
end
NewTFNumber(1,2)=Leftmedian;
NewTFNumber(1,3)=Rightmedian;
ComputingTime(1,1)=toc;


IntermediateIndex1=intersect(NewDataIndex, RightBreakPoint1Index1);
IntermediateIndex2=setdiff(RightBreakPoint1Index2,NewDataIndex);
IntermediateIndex3=setdiff(LeftBreakPoint2Index1,NewDataIndex);

tic;
if isempty(IntermediateIndex1)==1
    Lins1=0;
    Lins1Square=0;
else
    Lins1=sum(OldData(IntermediateIndex1,2)-OldData(IntermediateIndex1,1));
    Lins1Square=sum(OldData(IntermediateIndex1,2).^2-OldData(IntermediateIndex1,1).^2);
end


if isempty(IntermediateIndex2)==1
    Lins2=0;
    Lins2Square=0;
else
   IntermediateVariable1=min(OldData(IntermediateIndex2,:),NewTFNumber(1,2)); 
   Lins2=sum(IntermediateVariable1(:,2)-IntermediateVariable1(:,1));
   Lins2Square=sum(IntermediateVariable1(:,2).^2-IntermediateVariable1(:,1).^2);
end


if isempty(IntermediateIndex3)==1
    Lins3=0;
else
    IntermediateVariable2=min(OldData(IntermediateIndex3,:),NewTFNumber(1,2)); 
    Lins3Sum1=sum(IntermediateVariable2(:,2)-IntermediateVariable2(:,1));
    Lins3Sum1Square=sum(IntermediateVariable2(:,2).^2-IntermediateVariable2(:,1).^2);
    Lins3=Lins3Sum1Square/Lins3Sum1; 
end
    
if OldTFNumber(1,2)<=NewTFNumber(1,2)
    NewTFNumber(1,1)=(LeftSum2-Lins1Square+Lins2Square)/(LeftSum1-Lins1+Lins2)-NewTFNumber(1,2); 
else
    NewTFNumber(1,1)=Lins3-NewTFNumber(1,2);
end
ComputingTime(2,1)=toc;


RIntermediateIndex1=intersect(NewDataIndex, LeftBreakPoint3Index3);
RIntermediateIndex2=setdiff(LeftBreakPoint3Index2,NewDataIndex);
RIntermediateIndex3=setdiff(RightBreakPoint4Index3,NewDataIndex);

tic
if isempty(RIntermediateIndex1)==1
    Rins1=0;
    Rins1Square=0;
else
    Rins1=sum(OldData(RIntermediateIndex1,2)-OldData(RIntermediateIndex1,1));
    Rins1Square=sum(OldData(RIntermediateIndex1,2).^2-OldData(RIntermediateIndex1,1).^2);
end

if isempty(RIntermediateIndex2)==1
    Rins2=0;
    Rins2Square=0;
else
    RIntermediateVariable1=max(OldData(RIntermediateIndex2,:),NewTFNumber(1,3));
    Rins2=sum(RIntermediateVariable1(:,2)-RIntermediateVariable1(:,1));
    Rins2Square=sum(RIntermediateVariable1(:,2).^2-RIntermediateVariable1(:,1).^2);
end

if isempty(RIntermediateIndex3)==1
    Rins3=0;
else
    RIntermediateVariable2=max(OldData(RIntermediateIndex3,:),NewTFNumber(1,3));
    Rins3Sum1=sum(RIntermediateVariable2(:,2)-RIntermediateVariable2(:,1));
    Rins3Sum2=sum(RIntermediateVariable2(:,2).^2-RIntermediateVariable2(:,1).^2);
    Rins3=Rins3Sum2/Rins3Sum1;
end
    
if OldTFNumber(1,3)>=NewTFNumber(1,3) 
    NewTFNumber(1,4)=(RightSum2-Rins1Square+Rins2Square)/(RightSum1-Rins1+Rins2)-NewTFNumber(1,3);
else
    NewTFNumber(1,4)=Rins3-NewTFNumber(1,3);
end
ComputingTime(3,1)=toc;
TotalDelFusionTime=sum(ComputingTime);



