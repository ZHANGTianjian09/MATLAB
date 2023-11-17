clc
clear all
for i = 1:4
    load(['Q3',num2str(i)]);
    maximized_utility = shopping(C, c, m, n, v);
    fprintf('maximized utility of NO.%d dataset is %d \n',i,maximized_utility)
end

function F = shopping(C, c, m, n, v)
%solving the shopping problem with special commodity
%    parameter         explanation
%        C               budget
%        c            price vector
%        m        number of special commodity
%        n        total number of commodity
%        v            utility vector
%        F           maximized utility

%Zhang created on Nov.17
%initialize
%改状态转移函数
%先把别的东西考虑完了再考虑最后特殊物品
F = zeros(n,C+1);
F(1,1:c(1)) = 0;%这一步其实可以省，意味着只买一件物品时，如果钱比第一件物品的价格少，那只能不买了
F(1,c(1)+1:C+1) = v(1);
%首先考虑前m件商品，最优子结构：考虑前i件商品，要么只购买第i件，要么不购买第i件，选择和前i-1件一样的购买策略
for i =2:m
    for j = 1:C+1
        if j>c(i)  
            F(i,j)= max(v(i),F(i-1,j));
        else
            F(i,j)= F(i-1,j);
        end
    end
end

%模仿习题课，避免一件都不买
index = find(F(m,:)==0);
%如果一件都不买，直接给予负无穷惩罚
F(m,index) = -inf;

for i =m+1:n
    for j = 1:C+1
        if j>c(i)  
            F(i,j)= max(F(i-1,j-c(i))+v(i),F(i-1,j));
        else
            F(i,j)= F(i-1,j);
        end
    end
end
F = F(n,C+1);
end %在lxm中的function必须写end，如果是单独建m文件的话可以统一写/不写
