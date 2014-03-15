data = print1';
nsamples = 7000;
ns = max(data', [], 1);
dags = learn_struct_mcmc(data, ns, 'nsamples', nsamples, 'burnin', 1000  );

scores = score_dags(data, ns, dags, 'scoring_fn', 'bic');

post  = normalise(exp(scores));