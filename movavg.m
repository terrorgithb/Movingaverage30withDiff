clear all;
close all;

%% Create data

% Globals
window = 7;

% Filename
load data.csv;

% Read TRG data
year = data(:,1);
IMDr = data(:,2);
GKVKr = data(:,3);

%avg = zeros(length(year),2);
avg1 = zeros(length(year),2);
diff = zeros(length(year),2);

%avg(:,1) = smooth(year,IMDr,5,'moving');
%avg(:,2) = smooth(year,GKVKr,5,'moving');
avg1(:,1) = filter(ones(1,window)/window, 1, flip(IMDr));
avg1(:,2) = filter(ones(1,window)/window, 1, flip(GKVKr));

%subplot(2,1,1)
plot(year,flip(avg1(:,1)),'b-',year,flip(avg1(:,2)),'r-',year,IMDr,'b:',year,GKVKr,'r:')
set(gca,'XLim',[1972 2015])
legend('IMD avg','GKVK avg','IMD raw','GKVK raw','Location','NW')
title('Moving avg over 5 years')

%subplot(2,1,2)
%area(year,avg1(:,1)-avg1(:,2),'FaceColor',[0.5 0.9 0.6])
%set(gca,'XLim',[1972 2015])
%title('difference')