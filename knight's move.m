%load W56Q3.mat;
% 计算成本矩阵
cost_matrix = zeros(100, 100);

for i = 1:100
    for j = 1:100
        target_x = 0.05 + 0.1 * floor((j-1)/10);
        target_y = 0.05 + 0.1 * mod(j-1,10);
        cost_matrix(i,j)=sqrt((F(i, 1) - target_x)^2 + (F(i, 2) - target_y)^2);
    end
end

% 使用匈牙利算法找到最优匹配
[cost,destination_distribution] = hungarian(cost_matrix);

disp(['minimum_distance =', num2str(cost)]);
destination_distribution;
scatter(F(:,1),F(:,2),5,'b','filled')
hold on;
scatter(destination(:,1),destination(:,2),3,'g')
hold on;
for i = 1:100
    line([F(destination_distribution(i),1),destination(i,1)],[F(destination_distribution(i),2),destination(i,2)],'Color', 'r');
end
