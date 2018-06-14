clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
BasicSourceNumber=25600;
SourcesNumber=25600;
DelSourceNum=2560*1 

Lins2=size(AllData);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=AllData(:,1:Lins2(2)-1);
DelSourceData=OldSourceData(:,column*2*(BasicSourceNumber-DelSourceNum)+1:end);
OldData=zeros(BasicSourceNumber,2);
OldDataIndex=[1:BasicSourceNumber]';
NewData=zeros(DelSourceNum,2);
NewDataIndex=[BasicSourceNumber-DelSourceNum+1:BasicSourceNumber]';
TFNumberData=zeros(Lins2(1),column*4);
TimeIncremental=zeros(Lins2(1),column);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))';  
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData(:,1)=DelSourceData(i,(2*j-1):column*2:(2*j-1+(DelSourceNum-1)*column*2))';     
            NewData(:,2)=DelSourceData(i,(2*j):column*2:(2*j+(DelSourceNum-1)*column*2))';
            [OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,...
            LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3]=DelOldTFuzzyFusionResults(OldData);
            [TFNumberData(i,4*j-3:4*j),TotalDelFusionTime]=DelIncrementalHuangFuzzyGranulation(OldData,OldDataIndex,NewData,NewDataIndex,OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,...
            RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3);
            TimeIncremental(i,j)=TotalDelFusionTime;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalDelZZ10.xls',TotalTime, '-append')
    k
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
BasicSourceNumber=25600;
SourcesNumber=25600;
DelSourceNum=2560*2 

Lins2=size(AllData);
column=(Lins2(2)-1)/(2*SourcesNumber);
OldSourceData=AllData(:,1:Lins2(2)-1);
DelSourceData=OldSourceData(:,column*2*(BasicSourceNumber-DelSourceNum)+1:end);
OldData=zeros(BasicSourceNumber,2);
OldDataIndex=[1:BasicSourceNumber]';
NewData=zeros(DelSourceNum,2);
NewDataIndex=[BasicSourceNumber-DelSourceNum+1:BasicSourceNumber]';
TFNumberData=zeros(Lins2(1),column*4);
TimeIncremental=zeros(Lins2(1),column);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))';  
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData(:,1)=DelSourceData(i,(2*j-1):column*2:(2*j-1+(DelSourceNum-1)*column*2))';      
            NewData(:,2)=DelSourceData(i,(2*j):column*2:(2*j+(DelSourceNum-1)*column*2))';
            [OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,...
            LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3]=DelOldTFuzzyFusionResults(OldData);
            [TFNumberData(i,4*j-3:4*j),TotalDelFusionTime]=DelIncrementalHuangFuzzyGranulation(OldData,OldDataIndex,NewData,NewDataIndex,OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,...
            RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3);
            TimeIncremental(i,j)=TotalDelFusionTime;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalDelZZ10.xls',TotalTime, '-append')
    k
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
BasicSourceNumber=25600;
SourcesNumber=25600;
DelSourceNum=2560*3 

Lins2=size(AllData);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=AllData(:,1:Lins2(2)-1);
DelSourceData=OldSourceData(:,column*2*(BasicSourceNumber-DelSourceNum)+1:end);
OldData=zeros(BasicSourceNumber,2);
OldDataIndex=[1:BasicSourceNumber]';
NewData=zeros(DelSourceNum,2);
NewDataIndex=[BasicSourceNumber-DelSourceNum+1:BasicSourceNumber]';
TFNumberData=zeros(Lins2(1),column*4);
TimeIncremental=zeros(Lins2(1),column);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))';  
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData(:,1)=DelSourceData(i,(2*j-1):column*2:(2*j-1+(DelSourceNum-1)*column*2))';      
            NewData(:,2)=DelSourceData(i,(2*j):column*2:(2*j+(DelSourceNum-1)*column*2))';
            [OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,...
            LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3]=DelOldTFuzzyFusionResults(OldData);
            [TFNumberData(i,4*j-3:4*j),TotalDelFusionTime]=DelIncrementalHuangFuzzyGranulation(OldData,OldDataIndex,NewData,NewDataIndex,OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,...
            RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3);
            TimeIncremental(i,j)=TotalDelFusionTime;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalDelZZ10.xls',TotalTime, '-append')
    k
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
BasicSourceNumber=25600;
SourcesNumber=25600;
DelSourceNum=2560*4 

Lins2=size(AllData);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=AllData(:,1:Lins2(2)-1);
DelSourceData=OldSourceData(:,column*2*(BasicSourceNumber-DelSourceNum)+1:end);
OldData=zeros(BasicSourceNumber,2);
OldDataIndex=[1:BasicSourceNumber]';
NewData=zeros(DelSourceNum,2);
NewDataIndex=[BasicSourceNumber-DelSourceNum+1:BasicSourceNumber]';
TFNumberData=zeros(Lins2(1),column*4);
TimeIncremental=zeros(Lins2(1),column);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))';  
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData(:,1)=DelSourceData(i,(2*j-1):column*2:(2*j-1+(DelSourceNum-1)*column*2))';     
            NewData(:,2)=DelSourceData(i,(2*j):column*2:(2*j+(DelSourceNum-1)*column*2))';
            [OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,...
            LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3]=DelOldTFuzzyFusionResults(OldData);
            [TFNumberData(i,4*j-3:4*j),TotalDelFusionTime]=DelIncrementalHuangFuzzyGranulation(OldData,OldDataIndex,NewData,NewDataIndex,OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,...
            RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3);
            TimeIncremental(i,j)=TotalDelFusionTime;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalDelZZ10.xls',TotalTime, '-append')
    k
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
BasicSourceNumber=25600;
SourcesNumber=25600;
DelSourceNum=2560*5 

Lins2=size(AllData);
column=(Lins2(2)-1)/(2*SourcesNumber);
OldSourceData=AllData(:,1:Lins2(2)-1);
DelSourceData=OldSourceData(:,column*2*(BasicSourceNumber-DelSourceNum)+1:end);
OldData=zeros(BasicSourceNumber,2);
OldDataIndex=[1:BasicSourceNumber]';
NewData=zeros(DelSourceNum,2);
NewDataIndex=[BasicSourceNumber-DelSourceNum+1:BasicSourceNumber]';
TFNumberData=zeros(Lins2(1),column*4);
TimeIncremental=zeros(Lins2(1),column);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))'; 
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData(:,1)=DelSourceData(i,(2*j-1):column*2:(2*j-1+(DelSourceNum-1)*column*2))';     
            NewData(:,2)=DelSourceData(i,(2*j):column*2:(2*j+(DelSourceNum-1)*column*2))';
            [OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,...
            LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3]=DelOldTFuzzyFusionResults(OldData);
            [TFNumberData(i,4*j-3:4*j),TotalDelFusionTime]=DelIncrementalHuangFuzzyGranulation(OldData,OldDataIndex,NewData,NewDataIndex,OldDominantMatrix,OldSumDominantMatrix,LeftSum2,LeftSum1,...
            RightSum2,RightSum1,OldTFNumber,RightBreakPoint1Index1,RightBreakPoint1Index2,LeftBreakPoint2Index1,LeftBreakPoint3Index2,LeftBreakPoint3Index3,RightBreakPoint4Index3);
            TimeIncremental(i,j)=TotalDelFusionTime;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalDelZZ10.xls',TotalTime, '-append')
    k
end
