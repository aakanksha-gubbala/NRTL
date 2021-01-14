% ln gamma_i = sum_j (tau_ji G_ji x_j) / sum_l (G_li x_l)  
%            + sum_j ((x_j G_ij / sum_l (G_lj x_l)) (tau_ij - sum_r (x_r tau_rj G_rj)/ sum_l (G_lj x_l)))
% tau_ij = A_ij + B_ij / T
% G_ji = exp(-alpha_ji tau_ji)

% ln gamma_i = sum1 / sum2 + sum5 [= (sum3 (tau_ij - sum4 / sum2))]

function gamma = NRTL(x, T)
    % Enter x as a 1x3 matrix and T is a single variable
    
    load("Copy_of_data.mat")

           % BuOAc  AcOH   Water
    alpha = [0.000, 0.300, 0.300;  %BuOAc
             0.300, 0.000, 0.300;  %AcOH
             0.300, 0.300, 0.000]; %Water

    tau = A + B ./ T;
    G = exp(-alpha .* tau);

    % sum1 = sum_j (tau_ji G_ji x_j)
    sum1 = zeros(1, 3);

    for i = 1:3
        sum1(i) = x * (tau(:, i) .* G(:, i));
    end

    % sum2 = sum_l (G_li x_l)  
    sum2 = zeros(1, 3);

    for i = 1:3
        sum2(i) = x * G(:, i);
    end

    % sum6 = sum_j ((x_j G_ij / sum_l (G_lj x_l)) (tau_ij - sum_r (x_r tau_rj G_rj)/ sum_l (G_lj x_l)))
    sum6 = zeros(1, 3);

    for i = 1:3
        for j = 1:3
           sum6(i) = (G(i, j) * x(j) ./ (x * G(:, j))) * (tau(i, j) - sum1(i) / (x * G(:, j)));
        end
    end

    gamma = exp(sum1 ./ sum2 + sum6);
end