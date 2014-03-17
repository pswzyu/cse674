function [prob , entropy] = entropy(dataset)

[num_instance, num_feature ] = size(dataset);

%% Computing probability of each sample
[unique_data] = unique(dataset, 'rows');
prob = zeros(size(unique_data,1),1);

for i = 1:num_instance
    for j = 1:size(unique_data)
        if unique_data(j,:) == dataset(i,:)
            ind = j;
            break;
        end
    end
    prob(ind,1) = prob(ind,1)+1;
end

%% Computing Entropy
entropy = 0;
for i = 1:size(prob,1)
    entropy = entropy + log(prob(i,1));
end
entropy = - entropy / num_instance;