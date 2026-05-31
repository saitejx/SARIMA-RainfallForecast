clc;
clear;
close all;

%% Read Data

filename = 'hyderabad_yearmonth_rainfall.xlsx';

T = readtable(filename,'VariableNamingRule','preserve');

dates = datetime(T.("Year-Month"),...
    'InputFormat','yyyy-MM');

rainfall = T.("Rainfall (mm)");

%% Remove Missing Values

validIdx = ~isnan(rainfall);

dates = dates(validIdx);
rainfall = rainfall(validIdx);

%% Plot Historical Data

figure;
plot(dates,rainfall,'LineWidth',1.5);
grid on;
title('Historical Hyderabad Rainfall');
xlabel('Year');
ylabel('Rainfall (mm)');

%% SARIMA Model

model = arima(...
    'D',1,...
    'MALags',1,...
    'ARLags',1,...
    'Seasonality',12,...
    'SARLags',1,...
    'SMALags',1);

disp('Estimating SARIMA model...');

EstModel = estimate(model,rainfall);

%% Forecast Until Dec-2027

lastDate = dates(end);

endDate = datetime(2027,12,1);

forecastMonths = 12*(year(endDate)-year(lastDate)) + ...
                 (month(endDate)-month(lastDate));

[YF,YMSE] = forecast(...
    EstModel,...
    forecastMonths,...
    'Y0',rainfall);

%% Future Dates

futureDates = (lastDate + calmonths(1)):...
              calmonths(1):...
              endDate;

futureDates = futureDates';

%% Separate Years

idx2026 = year(futureDates)==2026;
idx2027 = year(futureDates)==2027;

dates2026 = futureDates(idx2026);
rain2026 = YF(idx2026);

dates2027 = futureDates(idx2027);
rain2027 = YF(idx2027);

%% Create Tables

Table2026 = table(...
    dates2026,...
    rain2026,...
    'VariableNames',...
    {'Date','PredictedRainfall_mm'});

Table2027 = table(...
    dates2027,...
    rain2027,...
    'VariableNames',...
    {'Date','PredictedRainfall_mm'});

%% Save Excel File

outputFile = 'Hyderabad_Rainfall_Forecast.xlsx';

writetable(Table2026,...
    outputFile,...
    'Sheet','2026_Predictions');

writetable(Table2027,...
    outputFile,...
    'Sheet','2027_Predictions');

disp('Excel file saved successfully.');

%% Figure 1 : 2026 Forecast

figure;

plot(dates2026,...
     rain2026,...
     '-o',...
     'LineWidth',2);

grid on;

title('Hyderabad Rainfall Forecast - 2026');
xlabel('Month');
ylabel('Rainfall (mm)');

%% Figure 2 : 2027 Forecast

figure;

plot(dates2027,...
     rain2027,...
     '-o',...
     'LineWidth',2);

grid on;

title('Hyderabad Rainfall Forecast - 2027');
xlabel('Month');
ylabel('Rainfall (mm)');

%% Exponential Smoothing

alpha = 0.3;

expSmooth = zeros(size(rain2027));

expSmooth(1) = rain2027(1);

for i = 2:length(rain2027)

    expSmooth(i) = ...
        alpha*rain2027(i) + ...
        (1-alpha)*expSmooth(i-1);

end

%% 7-Month Moving Average

movingAvg7 = movmean(rain2027,7);

%% Figure 3 : Comparison

figure;

plot(dates2027,...
     rain2027,...
     '-o',...
     'LineWidth',2);

hold on;

plot(dates2027,...
     expSmooth,...
     '-s',...
     'LineWidth',2);

plot(dates2027,...
     movingAvg7,...
     '-d',...
     'LineWidth',2);

grid on;

title('2027 Forecast Comparison');
xlabel('Month');
ylabel('Rainfall (mm)');

legend('SARIMA Forecast',...
       'Exponential Smoothing',...
       '7-Month Moving Average',...
       'Location','best');