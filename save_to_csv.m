function save_to_csv(bits)
 budget = 5000 * bits;
 x = [];
 for i= 1:20:
    P = 5;
	ga(bits, budget)
	x = [x; labs(ans)]
    // filename = sprintf('run%d.csv',i);
    // csvwrite(filename, P);
    csvwrite("test.txt",x)
 end
end

