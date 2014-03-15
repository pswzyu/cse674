data = print1';
nsamples = 7000;
ns = max(data', [], 1);

dag = learn_struct_K2( data , ns, [1:12], 'max_fan_in', 5, 'scoring_fn', 'bic', 'params', []);