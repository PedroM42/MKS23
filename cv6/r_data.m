clear all;
close all;
tcsv = csvread('ntc.csv');
ad = tcsv(:,1);
t = tcsv(:,2);

figure;
plot(ad,t);

figure;
t =1023*t./(10*ones(size(t))+t);
ad2 = 0:1023;
plot(t,ad,'o');

p = polyfit(t, ad, 10);

ad2 = 0:1023;
t2 = round(polyval(p, ad2), 1);
hold on, plot(ad2, t2, 'r'); 
dlmwrite('data.dlm', t2*10, ','); 