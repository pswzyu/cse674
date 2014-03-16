function [prob , entropy] = entropy(dataset)

[num_instance, num_feature ] = size(dataset);

%% Computing probability of each feature type
prob = zeros(max(max(dataset)), num_feature);

for i = 1: num_feature
    feature_max = max(dataset(:,i));
    for j = 1: feature_max
        temp = length(find(dataset(:,i) == j));
        prob(j,i) = temp/num_instance;
    end
    
end


%% Computing Entropy
entropy = zeros(1,num_feature);

log_prob = log(prob);
log_prob(prob==0) = log(eps);

for i = 1: num_feature
    for j = 1: num_instance

        entropy(1,i) = entropy(1,i) + log_prob(dataset(j,i),i);

    end
end

entropy = -entropy/num_instance;