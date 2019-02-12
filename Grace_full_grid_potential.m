

[theta,lambda]= meshgrid(-pi/2:pi/180:pi/2,-pi:pi/180:pi);
s=size(theta,1);
n=size(theta,2);

  
       
       r=6500000;
       GM=3.9851156*(10^14);
       R=6400000;
     
     
addpath(genpath('/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/'));
fname = '/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/ITSG Data/ITSG-Grace2016_n60_2017-06.gfc';
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

        for i=1:(n-1)
            for j=1:(s-1)
                f(i,j) = 0;
            end
        end
        for i=1:(s)
            display('i=');
            disp(i)
            for j=1:(n)
                f(i,j)=0;
               
                 for l=0:6
                     disp('l=')
                     disp(l);
                     tmp=0;
        
                      isotf=(R/r)^(l+1);
        
                     for m=0:l
                         disp('m=')
                         disp(m);
                         p__lm= plm(l,m,theta(i,j));
         
                         q=find((klm(:,1)==l) & (klm(:,2)==m));
                         %display(i);
                         tmp= tmp + (p__lm*(klm(q,3)*cos(m*lambda(i,j)) + klm(q,4)*sin(m*lambda(i,j)))) ;
                     end
                        f(i,j) = f(i,j) + isotf*(tmp) ;
                 end  
                    f(i,j)=eta*f(i,j);
                    %fprintf("f(i,j)");
                    %display(f(i,j));
            end
        end
        display(f(:,3));
        
                
        surf(theta,lambda,f)
        %test_2
        %[X,Y] = meshgrid(-pi/2:pi/180:pi/2,-pi:pi/180:pi);
%Z = f;
%surf(X,Y,Z)