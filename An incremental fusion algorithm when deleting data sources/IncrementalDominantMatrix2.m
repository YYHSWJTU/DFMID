function M=IncrementalDominantMatrix2(data)
[k1,k2]=size(data);
M=zeros(k1,k1);
for i=1:k1
    for j=i+1:k1
        if data(i,2)<=data(j,1)
            M(i,j)=0;
            M(j,i)=1-M(i,j);
        end
        if data(i,1)<=data(j,1) && data(j,1)<=data(i,2) && data(i,2)<=data(j,2)
            M(i,j)=(data(i,2)-data(j,1))^2/(2*(data(i,2)-data(i,1))*(data(j,2)-data(j,1)));
            M(j,i)=1-M(i,j);
        end
        if data(i,1)<=data(j,1) && data(j,1)<=data(j,2) && data(j,2)<=data(i,2)
           M(i,j)=(2*data(i,2)-data(j,2)-data(j,1))/(2*(data(i,2)-data(i,1)));
           M(j,i)=1-M(i,j);
        end
        if data(j,1)<=data(i,1) && data(i,1)<=data(i,2) && data(i,2)<=data(j,2)
            M(i,j)=(data(i,1)+data(i,2)-2*data(j,1))/(2*(data(j,2)-data(j,1)));
            M(j,i)=1-M(i,j);
        end
        if data(j,1)<=data(i,1) && data(i,1)<=data(j,2) && data(j,2)<=data(i,2)
            M(i,j)=1-(data(j,2)-data(i,1))^2/(2*(data(i,2)-data(i,1))*(data(j,2)-data(j,1)));
            M(j,i)=1-M(i,j);
        end
        if data(j,2)<=data(i,1)
             M(i,j)=1;
             M(j,i)=1-M(i,j);
        end
    end
end