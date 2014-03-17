clear all
load DataCursive34Print1234.mat
mean_cursive3 = mean(cursive3);
mean_cursive4 = mean(cursive4);

mean_print1 = mean(print1);
mean_print2 = mean(print2);
mean_print3 = mean(print3);
mean_print4 = mean(print4);

[prob_print1, entropy_print1] = entropy(print1);
[prob_print2, entropy_print2] = entropy(print2);
[prob_print3, entropy_print3] = entropy(print3);
[prob_print4, entropy_print4] = entropy(print4);

[prob_cursive3, entropy_cursive3] = entropy(cursive3);
[prob_cursive4, entropy_cursive4] = entropy(cursive4);


sampled_print1 = Gibbs(print1, 2000, 4000);
sampled_print2 = Gibbs(print2, 2000, 4000);
sampled_print3 = Gibbs(print3, 2000, 4000);
sampled_print4 = Gibbs(print4, 2000, 4000);

sampled_cursive3 = Gibbs(cursive3, 2000, 4000);
sampled_cursive4 = Gibbs(cursive4, 2000, 4000);

mean_sprint1 = mean(sampled_print1);
mean_sprint2 = mean(sampled_print2);
mean_sprint3 = mean(sampled_print3);
mean_sprint4 = mean(sampled_print4);

mean_scursive3 = mean(sampled_cursive3);
mean_scursive4 = mean(sampled_cursive4);



[prob_sampleprint1, entropy_sampleprint1] = entropy(sampled_print1);
[prob_sampleprint2, entropy_sampleprint2] = entropy(sampled_print2);
[prob_sampleprint3, entropy_sampleprint3] = entropy(sampled_print3);
[prob_sampleprint4, entropy_sampleprint4] = entropy(sampled_print4);



