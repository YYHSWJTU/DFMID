function [OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData]=AddOldTFuzzyFusionResults(Data)

size1=size(Data);
RowSize=size1(1);
M=IncrementalDominantMatrix(Data);
NewRank=SumRank(M);


if mod(RowSize,2)==1  
    MedianOdd=(1+RowSize)/2;
    Leftmedian=Data(NewRank(MedianOdd,1),1);
    Rightmedian=Data(NewRank(MedianOdd,1),2);
else   
    MedianEven1=RowSize/2;
    MedianEven2=MedianEven1+1;
    Leftmedian=(Data(NewRank(MedianEven1,1),1)+Data(NewRank(MedianEven2,1),1))/2; 
    Rightmedian=(Data(NewRank(MedianEven1,1),2)+Data(NewRank(MedianEven2,1),2))/2; 
end


lins1=min(Data,Leftmedian); 
lins2=lins1.^2;
LeftPoint=(sum(lins2(:,2),1)-sum(lins2(:,1),1))/(sum(lins1(:,2),1)-sum(lins1(:,1),1))-Leftmedian;

lins3=max(Data,Rightmedian);  
lins4=lins3.^2;
RightPoint=(sum(lins4(:,2),1)-sum(lins4(:,1),1))/(sum(lins3(:,2),1)-sum(lins3(:,1),1))-Rightmedian; 

TFNumber(1,1)=LeftPoint;
TFNumber(1,2)=Leftmedian;
TFNumber(1,3)=Rightmedian;
TFNumber(1,4)=RightPoint;
OldSumDominantMatrix=sum(M,2);
OldTFNumber=TFNumber;
[RLinsData1, RLinsData2]=sort(Data(:,2),'ascend');
OldRightAscendData=[Data(RLinsData2,1),RLinsData1];
[LLinsData1, LLinsData2]=sort(Data(:,1),'ascend');
OldLeftAscendData=[LLinsData1,Data(LLinsData2,2)];

BreakPoint=zeros(1,4);
LinsBreak1=find(OldRightAscendData(:,2)>=TFNumber(1,2));
if isempty(LinsBreak1)==1
    BreakPoint(1,1)=0;
else
    BreakPoint(1,1)=LinsBreak1(1);
end
if BreakPoint(1,1)-1>=1 
    LeftSum2=sum(OldRightAscendData(1:BreakPoint(1,1)-1,2).^2-OldRightAscendData(1:BreakPoint(1,1)-1,1).^2);
    LeftSum1=sum(OldRightAscendData(1:BreakPoint(1,1)-1,2)-OldRightAscendData(1:BreakPoint(1,1)-1,1));
end
if BreakPoint(1,1)-1<1 
   LeftSum2=0;
   LeftSum1=0;
end
if BreakPoint(1,1)==0 
    LeftSum2=sum(OldRightAscendData(:,2).^2-OldRightAscendData(:,1).^2);
    LeftSum1=sum(OldRightAscendData(:,2)-OldRightAscendData(:,1));
end

LinsBreak2=find(OldLeftAscendData(:,1)>=TFNumber(1,2));
if isempty(LinsBreak2)==1
    BreakPoint(1,2)=0;
else
    BreakPoint(1,2)=LinsBreak2(1);
end

LinsBreak3=find(OldLeftAscendData(:,1)>=TFNumber(1,3));
if isempty(LinsBreak3)==1
    BreakPoint(1,3)=0;
else
    BreakPoint(1,3)=LinsBreak3(1);
end
if BreakPoint(1,3)-1>=1  
    RightSum2=sum(OldLeftAscendData(BreakPoint(1,3):size1(1),2).^2-OldLeftAscendData(BreakPoint(1,3):size1(1),1).^2);
    RightSum1=sum(OldLeftAscendData(BreakPoint(1,3):size1(1),2)-OldLeftAscendData(BreakPoint(1,3):size1(1),1));
end
if BreakPoint(1,3)==1  
    RightSum2=sum(OldLeftAscendData(BreakPoint(1,3):size1(1),2).^2-OldLeftAscendData(BreakPoint(1,3):size1(1),1).^2);
    RightSum1=sum(OldLeftAscendData(BreakPoint(1,3):size1(1),2)-OldLeftAscendData(BreakPoint(1,3):size1(1),1));
end
if BreakPoint(1,3)==0 
    RightSum2=0;
    RightSum1=0;
end

LinsBreak4=find(OldRightAscendData(:,2)>=TFNumber(1,3));
if isempty(LinsBreak4)==1
    BreakPoint(1,4)=0; 
else
    BreakPoint(1,4)=LinsBreak4(1);
end
    

    
    







