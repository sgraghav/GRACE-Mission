theta=0;


lambda=0;
r=6500000;
GM=3.9851156*(10^14);
R=6400000;


addpath('/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/SHbundle-master/');
fname = '/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/SHbundle-master/examples/data/example.icgem';
fid=fopen(fname, 'r+');

i=1;
while 1
    line_one=fgets(fid);
    if ischar(line_one)
        line = strread(line_one, '%s');
        if isempty(line)
            continue;
        elseif strcmp(line{1}, 'gfc')
             klm(i,1:4)=[str2num(line{2}) str2num(line{3}) str2num(line{4}) str2num(line{5})];
             i=i+1;
        end
    elseif isempty(line_one)
        continue;
    else
        break;
    end
end

fclose(fid);
eta=GM/R;

f=0;
for l=0:10
    tmp=0;
    
    isotf=(R/r)^(l+1);
    
    for m=0:l
        
        p__lm= plm(l,m,theta);
        
        i=find((klm(:,1)==l) & (klm(:,2)==m));
        %disp(i);
        tmp= tmp + (p__lm*(klm(i,3)*cos(m*lambda) + klm(i,4)*sin(m*lambda))) ;
    end
    f=f+isotf*tmp ;
end

f=eta*f;
display(f);

