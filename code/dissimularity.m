function d = dissimilarity(X,Y,max_X)

num_feature = size(X);

for i = 1: num_feature

	d = abs(X(i)-Y(i))/max_X(i);

end

d = d/num_feature;

end
