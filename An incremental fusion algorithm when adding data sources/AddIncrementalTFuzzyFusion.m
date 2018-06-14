clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
SourcesNumber=25600;
BasicSourceNumber=12800;
AddSourceNumber=2560*1 

Lins2=size(AllData);
NoDecisionData=AllData(:,1:Lins2(2)-1);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=NoDecisionData(:,1:column*2*BasicSourceNumber);
AddSourceData=NoDecisionData(:,column*2*BasicSourceNumber+1:end);
OldData=zeros(BasicSourceNumber,2);
TimeIncremental=zeros(Lins2(1),column);
NewData1=zeros(AddSourceNumber,2);
TFNumberData1=zeros(Lins2(1),column*4);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))'; 
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData1(:,1)=AddSourceData(i,(2*j-1):column*2:(2*j-1+(AddSourceNumber-1)*column*2))';    
            NewData1(:,2)=AddSourceData(i,(2*j):column*2:(2*j+(AddSourceNumber-1)*column*2))';
            [OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData]=AddOldTFuzzyFusionResults(OldData);
            tic;
            TFNumberData1(i,4*j-3:4*j)=AddIncrementalHuangFuzzyGranulation(OldData,NewData1,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData);
            TimeIncremental(i,j)=toc;
            i
            j
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalAdd10.xls',TotalTime, '-append')
    k
end

clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
SourcesNumber=25600;
BasicSourceNumber=12800;
AddSourceNumber=2560*2 

Lins2=size(AllData);
NoDecisionData=AllData(:,1:Lins2(2)-1);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=NoDecisionData(:,1:column*2*BasicSourceNumber);
AddSourceData=NoDecisionData(:,column*2*BasicSourceNumber+1:end);
OldData=zeros(BasicSourceNumber,2);
TimeIncremental=zeros(Lins2(1),column);
NewData1=zeros(AddSourceNumber,2);
TFNumberData1=zeros(Lins2(1),column*4);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))'; 
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData1(:,1)=AddSourceData(i,(2*j-1):column*2:(2*j-1+(AddSourceNumber-1)*column*2))';    
            NewData1(:,2)=AddSourceData(i,(2*j):column*2:(2*j+(AddSourceNumber-1)*column*2))';
            [OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData]=AddOldTFuzzyFusionResults(OldData);
            tic;
            TFNumberData1(i,4*j-3:4*j)=AddIncrementalHuangFuzzyGranulation(OldData,NewData1,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData);
            TimeIncremental(i,j)=toc;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalAdd10.xls',TotalTime, '-append')
    k
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
SourcesNumber=25600;
BasicSourceNumber=12800;
AddSourceNumber=2560*3 

Lins2=size(AllData);
NoDecisionData=AllData(:,1:Lins2(2)-1);
column=(Lins2(2)-1)/(2*SourcesNumber);
OldSourceData=NoDecisionData(:,1:column*2*BasicSourceNumber);
AddSourceData=NoDecisionData(:,column*2*BasicSourceNumber+1:end);
OldData=zeros(BasicSourceNumber,2);
TimeIncremental=zeros(Lins2(1),column);
NewData1=zeros(AddSourceNumber,2);
TFNumberData1=zeros(Lins2(1),column*4);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))';
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData1(:,1)=AddSourceData(i,(2*j-1):column*2:(2*j-1+(AddSourceNumber-1)*column*2))';   
            NewData1(:,2)=AddSourceData(i,(2*j):column*2:(2*j+(AddSourceNumber-1)*column*2))';
            [OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData]=AddOldTFuzzyFusionResults(OldData);
            tic;
            TFNumberData1(i,4*j-3:4*j)=AddIncrementalHuangFuzzyGranulation(OldData,NewData1,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData);
            TimeIncremental(i,j)=toc;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalAdd10.xls',TotalTime, '-append')
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
SourcesNumber=25600;
BasicSourceNumber=12800;
AddSourceNumber=2560*4 

Lins2=size(AllData);
NoDecisionData=AllData(:,1:Lins2(2)-1);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=NoDecisionData(:,1:column*2*BasicSourceNumber);
AddSourceData=NoDecisionData(:,column*2*BasicSourceNumber+1:end);
OldData=zeros(BasicSourceNumber,2);
TimeIncremental=zeros(Lins2(1),column);
NewData1=zeros(AddSourceNumber,2);
TFNumberData1=zeros(Lins2(1),column*4);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))'; 
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData1(:,1)=AddSourceData(i,(2*j-1):column*2:(2*j-1+(AddSourceNumber-1)*column*2))';      
            NewData1(:,2)=AddSourceData(i,(2*j):column*2:(2*j+(AddSourceNumber-1)*column*2))';
            [OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData]=AddOldTFuzzyFusionResults(OldData);
            tic;
            TFNumberData1(i,4*j-3:4*j)=AddIncrementalHuangFuzzyGranulation(OldData,NewData1,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData);
            TimeIncremental(i,j)=toc;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalAdd10.xls',TotalTime, '-append')
    k
end


clc;
clear all;
Lins1=load('C:\HYY\实验数据集\EcoliIncremental');
AllData=Lins1.EcoliIncremental;
SourcesNumber=25600;
BasicSourceNumber=12800;
AddSourceNumber=2560*5

Lins2=size(AllData);
NoDecisionData=AllData(:,1:Lins2(2)-1);
column=(Lins2(2)-1)/(2*SourcesNumber); 
OldSourceData=NoDecisionData(:,1:column*2*BasicSourceNumber);
AddSourceData=NoDecisionData(:,column*2*BasicSourceNumber+1:end);
OldData=zeros(BasicSourceNumber,2);
TimeIncremental=zeros(Lins2(1),column);
NewData1=zeros(AddSourceNumber,2);
TFNumberData1=zeros(Lins2(1),column*4);
for k=1:10
    for i=1:Lins2(1)
        for j=1:column
            OldData(:,1)=OldSourceData(i,(2*j-1):column*2:(2*j-1+(BasicSourceNumber-1)*column*2))';  
            OldData(:,2)=OldSourceData(i,(2*j):column*2:(2*j+(BasicSourceNumber-1)*column*2))';
            NewData1(:,1)=AddSourceData(i,(2*j-1):column*2:(2*j-1+(AddSourceNumber-1)*column*2))';     
            NewData1(:,2)=AddSourceData(i,(2*j):column*2:(2*j+(AddSourceNumber-1)*column*2))';
            [OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData]=AddOldTFuzzyFusionResults(OldData);
            tic;
            TFNumberData1(i,4*j-3:4*j)=AddIncrementalHuangFuzzyGranulation(OldData,NewData1,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData);
            TimeIncremental(i,j)=toc;
        end
    end
    TotalTime=sum(sum(TimeIncremental));
    dlmwrite('C:\HYY\RunTime\EcoliIncrementalAdd10.xls',TotalTime, '-append')
    k
end

