addpath(genpath('/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/'));

% fname = '/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/ITSG Data/ITSG-Grace2016_n60_2002-04.gfc';
% fid=fopen(fname, 'r+');
% 
% i=1;
% while 1
%     line_one=fgets(fid);
%     if ischar(line_one)
%         line = strread(line_one, '%s');
%         if isempty(line)
%             continue;
%         elseif strcmp(line{1}, 'gfc')
%              klm(i,1:4)=[str2num(line{2}) str2num(line{3}) str2num(line{4}) str2num(line{5})];
%              i=i+1;
%         end
%     elseif isempty(line_one)
%         continue;
%     else
%         break;
%     end
% end
% 
% fclose(fid);
% var=clm2sc(klm, 'max_lm', 60);
% cs=sc2cs(var);


%gfc=readitsg('/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/SHBundle/ITSG Data', 'gfc')
%save('/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/Tasks/ITGS DATA.mat', 'gfc');
load('/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/Tasks/ITGS DATA.mat');
mn=getgracemean(gfc, [2002 04], [2017 06]);

filepath='/media/vaibhav/Vaibhav/Documents/IIT Kanpur/Project/Tasks/ITSG Data.txt';
% file=fopen(filepath, 'w');
% save(filepath, 'mn');
% example=matfile(filepath);
% c=example.mn;
%xlswrite(filepath,mn)
%dlmwrite(filepath,mn,'delimiter',' ')
% fclose(filepath)

for k = 90:101
name=gshs_(gfc{k,9}-mn, 'sub_WGS84', false, ...
                                    'gridsize', 360, ...
                                    'grid', 'block');
h=mapfield(name, 'block', '0');
xlabel('degree');
ylabel('co-lattitude');
t = datetime(2010,k-89,01);
m = month(t,'name');
title(['Disturbing Potential for ', m{1}]);
%caxis
caxis([-.2,.2])
end