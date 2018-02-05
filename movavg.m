clear all;
close all;

%% Create data

% Globals
window = 10;

% Filename
load Jan.csv;

% Read TRG data
year = Jan(:,1);
Maxr = Jan(:,2);
Minr = Jan(:,3);
data = Minr;

avg = zeros(length(year),2);
diff = zeros(length(year),2);

avg1 = filter(ones(1,window)/window, 1, data);
%avg1 = Jan(:,4);

%subplot(2,1,1)
plot(year,data,'b:',year,avg1,'r-')
hold on
set(gca,'XLim',[1980 2019])
legend('Min average','Moving average','Location','NW')
title('Moving avg over 10 years')
xlabel('Years') % x-axis label
ylabel('Annual RF') % y-axis label
hold off


%subplot(2,1,2)
%area(year,data-avg1,'FaceColor',[0.5 0.9 0.6]);