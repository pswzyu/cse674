function [mean, select_sample] = most_similar(dataset)


mean = sum(dataset,1)/size(dataset,1);


[num_sample, num_feature] = size(dataset);
max_X = max(dataset,[],1);

for i = 1: num_feature

    d = abs(dataset(:,i)- mean(i))/max_X(i);

end

d = d/num_feature;

