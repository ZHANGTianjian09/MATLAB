function output = proximal_gradient_descent(A, b, B, x0, alpha, lambda)

    A = A/B
    y = x0; % initialize, x is a vaariable used in the circulation, y is the output
    while 1
        x = y;
  
       % r = A*x - b;
        
        grad = A.'*b-A.'*A*x; 
        
    
        temp = x + alpha * grad;
    %    g = @(x) norm(B*x,1)+(1/2)*(1/(2*alpha))*(norm(x-temp))^2;
     %   x = fmincon(g,[0.1;0.1;0.1;0.1]);
        for i = 1:length(temp)
            if temp(i) > lambda*alpha
                x(i) = temp(i)-lambda*alpha;
            elseif temp(i) < -lambda*alpha
                x(i) = temp(i)+lambda*alpha;
            else
                x(i) = 0;
            end
        end
    %    x = sign(B*x) .* max(abs(B*x) - alpha * lambda * 0.1, 0);
        

        if norm(y-x) <1e-18
            output = B\y;
            break;
        end
        y = x; %
    end
end
