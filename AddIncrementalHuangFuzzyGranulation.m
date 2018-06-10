function NewTFNumber=AddIncrementalHuangFuzzyGranulation(OldData,NewData,OldSumDominantMatrix,LeftSum2,LeftSum1,RightSum2,RightSum1,BreakPoint,OldTFNumber,OldRightAscendData,OldLeftAscendData)
NewTFNumber=zeros(1,4);
OldDataNum=size(OldData,1);
NewDataNum=size(NewData,1);
CombinedData=[OldData;NewData];
M1=IncrementalNewDominantMatrix2(CombinedData,NewDataNum);
M2=ones(NewDataNum,OldDataNum)-M1';
M3=IncrementalDominantMatrix(NewData);
NewSum1=OldSumDominantMatrix+sum(M1,2);
NewSum2=sum(M2,2)+sum(M3,2);
NewSum12=[NewSum1;NewSum2];
[S1,S2]=sort(NewSum12,'descend');
NewRank=S2;
RowSize=OldDataNum+NewDataNum;
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

Lins1=min(NewData,NewTFNumber(1,2));
Lins2=Lins1.^2;
if OldTFNumber(1,2)<=NewTFNumber(1,2)
    if BreakPoint(1,1)==0  
        NewTFNumber(1,1)=(LeftSum2+(sum(Lins2(:,2),1)-sum(Lins2(:,1),1)))/(LeftSum1+(sum(Lins1(:,2),1)-sum(Lins1(:,1),1)))-NewTFNumber(1,2);
    elseif BreakPoint(1,1)==1 
        Intermediate=min(OldData,NewTFNumber(1,2));
        Lins3=[Intermediate;Lins1];
        Lins4=Lins3.^2;
        NewTFNumber(1,1)=(LeftSum2+(sum(Lins4(:,2),1)-sum(Lins4(:,1),1)))/(LeftSum1+(sum(Lins3(:,2),1)-sum(Lins3(:,1),1)))-NewTFNumber(1,2);%ÕâÀïLeftSum2=LeftSum1=0
    else                    
        Lins3=min(OldRightAscendData(BreakPoint(1,1):OldDataNum,:),NewTFNumber(1,2));
        Lins4=Lins3.^2;
        NewTFNumber(1,1)=(LeftSum2+(sum(Lins4(:,2),1)-sum(Lins4(:,1),1))+(sum(Lins2(:,2),1)-sum(Lins2(:,1),1)))/(LeftSum1+(sum(Lins3(:,2),1)-sum(Lins3(:,1),1))+(sum(Lins1(:,2),1)-sum(Lins1(:,1),1)))-NewTFNumber(1,2);
    end
else
    if BreakPoint(1,2)==0  
        Intermediate=min(OldData,NewTFNumber(1,2));
        Lins3=[Intermediate;Lins1];
        Lins4=Lins3.^2;
        NewTFNumber(1,1)=((sum(Lins4(:,2),1)-sum(Lins4(:,1),1)))/((sum(Lins3(:,2),1)-sum(Lins3(:,1),1)))-NewTFNumber(1,2);
    elseif BreakPoint(1,2)==1
        NewTFNumber(1,1)=((sum(Lins2(:,2),1)-sum(Lins2(:,1),1)))/((sum(Lins1(:,2),1)-sum(Lins1(:,1),1)))-NewTFNumber(1,2);
    else  
        Lins3=min(OldLeftAscendData(1:BreakPoint(1,2)-1,:),NewTFNumber(1,2));
        Lins4=Lins3.^2;
        NewTFNumber(1,1)=((sum(Lins4(:,2),1)-sum(Lins4(:,1),1))+(sum(Lins2(:,2),1)-sum(Lins2(:,1),1)))/((sum(Lins3(:,2),1)-sum(Lins3(:,1),1))+(sum(Lins1(:,2),1)-sum(Lins1(:,1),1)))-NewTFNumber(1,2);
    end
end


Rins1=max(NewData,NewTFNumber(1,3));
Rins2=Rins1.^2; 
if OldTFNumber(1,3)>=NewTFNumber(1,3)
    if BreakPoint(1,3)==1  
        NewTFNumber(1,4)=(RightSum2+(sum(Rins2(:,2),1)-sum(Rins2(:,1),1)))/(RightSum1+(sum(Rins1(:,2),1)-sum(Rins1(:,1),1)))-NewTFNumber(1,3);
    elseif BreakPoint(1,3)==0 
        RIntermediate=max(OldData,NewTFNumber(1,3));
        Rins3=[RIntermediate;Rins1];
        Rins4=Rins3.^2;
        NewTFNumber(1,4)=(RightSum2+(sum(Rins4(:,2),1)-sum(Rins4(:,1),1)))/(RightSum1+(sum(Rins3(:,2),1)-sum(Rins3(:,1),1)))-NewTFNumber(1,3);
    else     
        Rins3=max(OldLeftAscendData(1:BreakPoint(1,3)-1,:),NewTFNumber(1,3));
        Rins4=Rins3.^2;
        NewTFNumber(1,4)=((sum(Rins4(:,2),1)-sum(Rins4(:,1),1))+(sum(Rins2(:,2),1)-sum(Rins2(:,1),1)))/((sum(Rins3(:,2),1)-sum(Rins3(:,1),1))+(sum(Rins1(:,2),1)-sum(Rins1(:,1),1)))-NewTFNumber(1,3);
    end
else
    if BreakPoint(1,4)==0 
        NewTFNumber(1,4)=((sum(Rins2(:,2),1)-sum(Rins2(:,1),1)))/((sum(Rins1(:,2),1)-sum(Rins1(:,1),1)))-NewTFNumber(1,3);
    elseif BreakPoint(1,4)==1 
        RIntermediate=max(OldData,NewTFNumber(1,3));
        Rins3=[RIntermediate;Rins1];
        Rins4=Rins3.^2;
        NewTFNumber(1,4)=((sum(Rins4(:,2),1)-sum(Rins4(:,1),1)))/((sum(Rins3(:,2),1)-sum(Rins3(:,1),1)))-NewTFNumber(1,3);
    else
        Rins3=max(OldRightAscendData(BreakPoint(1,2):OldDataNum,:),NewTFNumber(1,3));
        Rins4=Rins3.^2;
        NewTFNumber(1,4)=((sum(Rins4(:,2),1)-sum(Rins4(:,1),1))+(sum(Rins2(:,2),1)-sum(Rins2(:,1),1)))/((sum(Rins3(:,2),1)-sum(Rins3(:,1),1))+(sum(Rins1(:,2),1)-sum(Rins1(:,1),1)))-NewTFNumber(1,3);
    end
end

