va = importdata('matlab_data.txt')

figure(1)

y = histfit(a,50)
hold on
xlabel('Average Fault Tolerance (276 samples)')
y(1).FaceColor = [0 0 1] %histogram bars are blue
y(2).Color = [1 0 0] %distribution curve is red

text(18,16,sprintf('median: %f',median(a)))
text(18,15,sprintf('std   : %f',std(a)))
