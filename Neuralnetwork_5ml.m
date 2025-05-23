filename = 'Data_5ml.xlsx';
[ndata, text, rawdata] = xlsread(filename);
rawdata = cell2mat(rawdata);
x = rawdata(:,1);
x = transpose(x);
t = rawdata(:,2);
t = transpose(t);
figure(1),plot(x,t,'o');
xlabel('Length');
ylabel('Volume');
title('Before Training');
net5 = feedforwardnet(10);
net5 = configure(net5,x,t);
net5 = train(net5,x,t);
y2 = net5(x);
figure(2),plot(x,t,'o',x,y2,'*');
xlabel('Length');
ylabel('Volume');
title('After Training');
save Neuralnetwork_5ml net5