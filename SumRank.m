function NewRank=SumRank(M)
SUM1=sum(M,2);
[S1,S2]=sort(SUM1,'descend');
NewRank=S2;