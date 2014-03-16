function kl_diverg = KL_divergence(dataset1,dataset2)

%% Compute Entropy of dataset1 and dataset2

[prob1 , entropy1] = entropy(dataset1);
[prob2 , entropy2] = entropy(dataset2);

%% Compute KL divergence based on entropy

kl_diverg = entropy2-entropy1;
