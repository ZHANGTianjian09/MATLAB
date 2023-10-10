%idea 1 projection
%first form a uniform distribution on circle
%vpa(64/3*pi,16) 67
Nsp = 1e6;
r = sqrt(4*rand(Nsp,1));
cita = 2*pi*rand(Nsp,1);
x = r.*cos(cita);
y = r.*sin(cita);
%plot(x,y, 'r.') %examine its a uniform distribution
f = 2*(sin(x)+y.^2).*sqrt(1+(x.^2+y.^2)./(4-(x.^2+y.^2)));
est1 = sum(f)/Nsp* 4*pi


%idea2 direct method 
nums_points = 1e6; % 点数量
radius = 2;
loc = zeros(nums_points, 3);
for ii = 1 : nums_points
    phi = acos(-1.0 + (2.0 * ii - 1.0) / nums_points);
    theta = sqrt(nums_points * pi) * phi;
    loc(ii, 1) = radius * cos(theta) * sin(phi);
    loc(ii, 2) = radius * sin(theta) * sin(phi);
    loc(ii, 3) = radius * cos(phi);
end
x = loc(:, 1);
y = loc(:,2);
z = loc(:,3);
 
g = sin(x)+y.^2+log(sqrt(z.^2+1)-z);
est2 = sum(g)/nums_points * 4*pi*4

%compare
err_proj = vpa(abs(est1-64/3*pi),16)
err_dire = vpa(abs(est2-64/3*pi),16)


