function f = labs(x)
% Autocorrelation of binary sequences
% Input:
% 	x : 1-d row binary vector
	n = length(x);
    y = x .* 2 - 1;
    E = zeros(1, n-1);
	for k = 1:n-1
		E(k) = (sum(y(1:n-k) .* y(1+k:n))).^2;
	end
	f = n^2 / (2 * sum(E));
end
