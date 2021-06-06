function [img] = sixconn(img,tresh)
bi=im2bw(img,tresh);
[x y z]=size(bi);
tmp=padarray(bi, [1 1]);
img = uint8( bi(:,:,[1 1 1]) * 255 );%converting original to rgb
%imshow(img,[]);
count=2;
tmp=int16(tmp);
for i=2:x+1
    for j=2:y+1
        a=i-1;b=j-1;%for convieninece in indexing
        if tmp(i,j)~=0 %checking top 3 indexes in noth-west direction, and label them accordingly
            if tmp(a,b)~=0
                tmp(i,j)=tmp(a,b);
            elseif tmp(i,b)~=0
                tmp(i,j)=tmp(i,b);
            elseif tmp(a,j)~=0
                tmp(i,j)=tmp(a,j);
            else
                tmp(i,j)=count;
                count=count+1;
            end
        end
    end
end
change=true;
while change==true %while an index value changed labels
    change=false;
    for i=2:x+1
        for j=2:y+1
            a=i-1;b=j-1;c=i+1;d=j+1;%for convieninece in indexing
            arr=[0 0 0 0 0 0];%contains 6 surrounding labels, takes the minimum one
            if tmp(i,j)~=0
                arr(1)=tmp(i,b);
                arr(2)=tmp(a,b);
                arr(3)=tmp(a,j);
                arr(4)=tmp(i,d);
                arr(5)=tmp(c,d);
                arr(6)=tmp(c,j);
                min=max(arr);
                for n=1:6
                    if min>arr(n) && arr(n)~=0 %if value is not  0 and smaller than minimum value
                        min=arr(n);
                        change=true; %change in labeling detected, thus loop will run atleast once more
                    end
                end
               if change==true % ifchange in labeling detected, change the values of connected indexes
                    for n=1:6
                        if arr(n)~=0
                            arr(n)=min;
                        end
                    end
                    tmp(i,b)=arr(1);
                    tmp(a,b)=arr(2);
                    tmp(a,j)=arr(3);
                    tmp(i,d)=arr(4);
                    tmp(c,d)=arr(5);
                    tmp(c,j)=arr(6);
               end
                
            end
        end
    end

end

arr=zeros(count,1);%to help keep track of all labels


label=1;
%giving proper labels
for i=2:x+1
    for j=2:y+1
        if tmp(i,j)~=0
            if arr(tmp(i,j))==0
                arr(tmp(i,j))=label;
                tmp(i,j)=label;
                label=label+1;
            else
                tmp(i,j)=arr(tmp(i,j));
            end
        end
    end
end
%marking objects using labels
for i=1:x
    for j=1:y
        a=i+1;
        b=j+1;
        if img(i,j,1)~=uint8(0)
            label=tmp(a,b);
            [cd1,cd2,cd3]=colorobject(label);
            img(i,j,1)=uint8(cd1);
            img(i,j,2)=uint8(cd2);
            img(i,j,3)=uint8(cd3);
        end
    end
end

end

