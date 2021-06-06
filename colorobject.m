function [cd1,cd2,cd3] = colorobject(label)
%will color the given index
%supports upto 17 labels
%will contain values for the 3 color depths for each label

arr=zeros(10,3);
arr(1,1)=255;
arr(1,2)=0;
arr(1,3)=0;

arr(2,1)=0;
arr(2,2)=255;
arr(2,3)=0;

arr(3,1)=0;
arr(3,2)=0;
arr(3,3)=255;

arr(4,1)=255;
arr(4,2)=255;
arr(4,3)=0;

arr(5,1)=255;
arr(5,2)=0;
arr(5,3)=255;

arr(6,1)=0;
arr(6,2)=255;
arr(6,3)=255;

arr(7,1)=255;
arr(7,2)=255;
arr(7,3)=255;

arr(8,1)=255;
arr(8,2)=128;
arr(8,3)=0;

arr(9,1)=255;
arr(9,2)=0;
arr(9,3)=128;

arr(10,1)=128;
arr(10,2)=255;
arr(10,3)=0;

arr(11,1)=0;
arr(11,2)=255;
arr(11,3)=128;

arr(12,1)=128;
arr(12,2)=0;
arr(12,3)=255;

arr(13,1)=0;
arr(13,2)=128;
arr(13,3)=255;

arr(14,1)=128;
arr(14,2)=128;
arr(14,3)=255;

arr(15,1)=255;
arr(15,2)=128;
arr(15,3)=128;

arr(16,1)=128;
arr(16,2)=255;
arr(16,3)=128;

arr(17,1)=128;
arr(17,2)=128;
arr(17,3)=128;

if label>17
    label=mod(label,17);
    if label==0
        label=label+1;
    end
end
cd1=arr(label,1);
cd2=arr(label,2);
cd3=arr(label,3);
end

