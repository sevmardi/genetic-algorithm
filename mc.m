function [xopt, fopt] = mc(n, eval_budget)
% Monte Carlo Search for Low Autocorrelation problem
% Input:
% 	n : dimension (length) of the bitstring
%   eval_budget : the maximal number of function evaluations
%
% Author: Hao Wang

	% Do you want online plotting? If not, set to false
	is_plot = true;

	% Initialize algorithm
	xopt = rand(n, 1) > 0.5;
	fopt = labs(xopt);
  eval_count = 1;

	% Statistics
    if is_plot
	  histf = zeros(1, eval_budget);
      histf(1:eval_count) = fopt;
    end

	% Main Monte-Carlo loop
	while (eval_count < eval_budget)

		% Generate random bitstring
		a = rand(n, 1) > 0.5;
		fa = labs(a);

		% If the new bitstring is better than the one we have, replace the old one
		if (fa >= fopt)
			xopt = a;
			fopt = fa;
		end

		% Statistics maintenance and plotting
		if is_plot
			histf(eval_count+1:eval_count+1) = fopt;
			subplot(2, 1, 1)
			plot(histf(1:eval_count+1))
			subplot(2,1,2)
			bar([1:n], xopt)
			xlim([1 n])
			drawnow();
        end
        
        eval_count = eval_count + 1;
	end
end
