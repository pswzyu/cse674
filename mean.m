function [mean_vec] = mean(dataset)

[num_instance, num_feature ] = size(dataset);
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

prob = prob / num_instance;

mean_vec = zeros(1, num_feature);
for i = 1:size(unique_data,1)
    mean_vec = mean_vec + prob(i).*unique_data(i,:);
end