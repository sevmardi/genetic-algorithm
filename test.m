function [xopt, fopt]  = test(n, eval_budget)

#n is the length of binary sequences, 
#  eval_budget is the number of function evaluations that the GA
#  is allowed to use per run (i.e., the allowed number of calls to labs.m, see below, not the number of
#  generations!), xopt is the best bitstring found by the algorithm, and fopt the accompanying best fitness.
#  For your convenience, we provide labs.m: it returns fitness of the candidate solutions.
  
  % lx lenght of subset
  lx = 5;
  v=100;
  u =0;
  
  bits = rand(1,n) > 0.5;
  % deviding the n with the subsets which will give me the pop size
  pop_size = n / lx;
  
  #disp(bits)
  #Evalute p
  for i = 1:pop_size
    pop_{i} = num2str(bits((i - 1) * lx + 1 : i * lx));
    pop_fit{i} = u + ((v-u) / ((2^lx - 1)) * bin2dec(pop_{i}));
  end
  disp("Population")
  disp(pop_)
  disp("Fit of the pop")
  disp(pop_fit)
  
  c = 1;
  
  k = 1;
  working_while_1 = true;
  while working_while_1
    for j=1:length(pop_fit)
      psel = (cell2mat(pop_fit(j)) - c) / (sum(cell2mat(pop_fit)) - (c * pop_size)); 
      #disp(psel)
      x = rand;
      if x < psel
        selected_mates{k} = cell2mat(pop_(j));
        k++;
        #disp(j)
        if k >= (pop_size + 1)
          working_while_1 = false;
          break;
        end
      end
    end  
  end

  
 disp(selected_mates)
 
 pcm = 0.6;
 s = 1;
 
 working_while_2 = true;
 
 while working_while_2
  for j=1:length(selected_mates)
   # grab random numbers 
   x = rand;
   if x < pcm
    crossover_pair{s} = cell2mat(selected_mates(j));
    if mod(s, 2) == 0
      point = randi([1,5])
      pair_1 = cell2mat(crossover_pair(s - 1));
      pair_2 = cell2mat(crossover_pair(s));
      disp(s)
      
      new_child_1 = [pair_1(1:point), pair_2(point+1:end)];
      new_child_2 = [pair_2(1:point), pair_1(point+1:end)];
      
      disp(new_child_1) 
      disp(new_child_2) 
    end
    s++;
    if s >= (pop_size + 1)
      working_while_2 = false;
      break;
     end
    end
   end
  end
  
 disp(crossover_pair)
  
end