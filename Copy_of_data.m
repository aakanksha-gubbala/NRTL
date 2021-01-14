
%%%% Dummy values

% A(i,j) 
    % BuOAc  AcOH   Water
A = [0,     0.200, 0.200;      %BuOAc
	 0.200, 0,     0.100;      %AcOH
	 0.200, 0.100, 0   ];      %Water


% B(i,j) 
    % BuOAc     AcOH      Water
B = [0,       -5000.00,  500.000;      %BuOAc
	 -300.000, 0,        4000.00;      %AcOH
	 2000.000, -2000.0, 0      ];      %Water
 
 
save("Copy_of_data.mat")