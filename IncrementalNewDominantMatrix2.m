function M1=IncrementalNewDominantMatrix2(CombinedData,NewDataNum)

k1=size(CombinedData,1)-NewDataNum;
k2=NewDataNum;
M1=zeros(k1,k2);
for i=1:k1
    for j=1:k2
        NewJ=j+k1;
        if CombinedData(i,2)<=CombinedData(NewJ,1)
            M1(i,j)=0;
        end
        if CombinedData(i,1)<=CombinedData(NewJ,1) && CombinedData(NewJ,1)<=CombinedData(i,2) && CombinedData(i,2)<=CombinedData(NewJ,2)
            M1(i,j)=(CombinedData(i,2)-CombinedData(NewJ,1))^2/(2*(CombinedData(i,2)-CombinedData(i,1))*(CombinedData(NewJ,2)-CombinedData(NewJ,1)));
        end
        if CombinedData(i,1)<=CombinedData(NewJ,1) && CombinedData(NewJ,1)<=CombinedData(NewJ,2) && CombinedData(NewJ,2)<=CombinedData(i,2)
           M1(i,j)=(2*CombinedData(i,2)-CombinedData(NewJ,2)-CombinedData(NewJ,1))/(2*(CombinedData(i,2)-CombinedData(i,1)));
        end
        if CombinedData(NewJ,1)<=CombinedData(i,1) && CombinedData(i,1)<=CombinedData(i,2) && CombinedData(i,2)<=CombinedData(NewJ,2)
            M1(i,j)=(CombinedData(i,1)+CombinedData(i,2)-2*CombinedData(NewJ,1))/(2*(CombinedData(NewJ,2)-CombinedData(NewJ,1)));
        end
        if CombinedData(NewJ,1)<=CombinedData(i,1) && CombinedData(i,1)<=CombinedData(NewJ,2) && CombinedData(NewJ,2)<=CombinedData(i,2)
            M1(i,j)=1-(CombinedData(NewJ,2)-CombinedData(i,1))^2/(2*(CombinedData(i,2)-CombinedData(i,1))*(CombinedData(NewJ,2)-CombinedData(NewJ,1)));
        end
        if CombinedData(NewJ,2)<=CombinedData(i,1)
             M1(i,j)=1;
        end
    end
end


