function prob = distribution(dataset)

[num_instance, num_feature ] = size(dataset);

prob = zeros(max(max(dataset)), num_feature);






for i = 1: num_feature
    feature_max = max(dataset(:,i));
    for j = 1: feature_max
        temp = length(find(dataset(:,i) == j));
        prob(j,i) = temp/num_instance;
    end
    
end