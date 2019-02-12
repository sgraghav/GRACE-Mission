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
var=clm2sc(klm, 'max_lm', 60);
cs=sc2cs(var);

sctriplot(var,60);
