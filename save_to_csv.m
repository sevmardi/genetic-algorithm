function save_to_csv(bits, budget)
 for i=bits:budget
    P = 5;
    filename = sprintf('run%d.csv',i);
    csvwrite(filename, P);
 end
end

