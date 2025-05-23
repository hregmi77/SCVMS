filename = 'Data_1ml.xlsx';
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
net1 = feedforwardnet(10);
net1 = configure(net1,x,t);
net1 = train(net1,x,t);
y2 = net1(x);
figure(2),plot(x,t,'o',x,y2,'*');
xlabel('Length');
ylabel('Volume');
title('After Training');
save Neuralnetwork_1ml net1