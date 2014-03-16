function [mean, select_sample] = most_similar(dataset)


mean = sum(dataset,1)/size(dataset,1);


[num_sample, num_feature] = size(dataset);
max_X = max(dataset,[],1);

dissimilarity = sum(abs(dataset - repmat(mean,num_sample,1))./repmat(max_X,num_sample,1), 2);

[min_value, min_index] = min(dissimilarity);


select_sample = dataset(min_index,:);


