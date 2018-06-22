clearvars, close all; clc;

% PENTING
% sesuaikan folder tempat data hasil audiometri dan filename sbg nama file-nya.
folder = '/home/abudzar/Documents/po-cong/audiometri/';
filename = 'Nanda.txt';
showPlot = 0;   % 1 = showplot
pattern = {'Ear', 'Frequency (Hz)', 'turnpointMean', 'Listener:'};
data = [];
tline = ' ';
listener = [];
addpath(genpath(folder));

fid = fopen(filename);
counter = 1;
while ischar(tline)
    tline = fgetl(fid);

    if isempty(strfind(tline,pattern{1})) == 0
        data{counter,1} = tline(6:end);
    end

    if isempty(strfind(tline,pattern{2})) == 0
        data{counter,2} = str2num(tline(18:end));
    end

    if isempty(strfind(tline,pattern{3})) == 0
        data{counter,3} = str2num(tline(17:end-15));
        counter = counter + 1;
    end

    if isempty(strfind(tline,pattern{4})) == 0 & isempty(listener) == 1
        listener = tline(16:end)
    end

end

data = sortrows(data)

if showPlot == 1
    figure;
else
    figure('visible','off');
end

plot([data{1:7,2}],[data{1:7,3}],'linewidth',2); hold all;
plot([data{8:14,2}],[data{8:14,3}],'linewidth',2);
set(gca, 'XScale', 'log')
titleName = sprintf('Audiogram %s', listener)
title(titleName);
xlabel('Frequency (Hz)')
ylabel('SPL (dB)')
grid on;
% ylim([-20 80])
legend('Left Ear','Right Ear')
set(gcf,'PaperUnits','inches','PaperPosition',[0 0 9 6])
print([folder titleName '.jpg'],'-djpeg','-r100');