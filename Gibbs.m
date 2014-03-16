function sampled_data = Gibbs(data, number, burnin)

[DAG, CPT, child_bnet_para] = learn_k2_cn(data);
% view(biograph( DAG ));
feature_num = size(data,2);
sampled_data = [];
curr_state = ones(1,feature_num);
tao = number + burnin;
% Gibss sampling state, for each feature.
for t = 1:tao  
    for i = 1:feature_num
        parent_node = find(DAG(:,i)==1);
        
        % if there is no parent of current node. Then random choose from
        % cpt
        if isempty(parent_node)
            prob = CPT{1,i};
            curr_state(1,i) = deter_sample(prob);  
        else
            temp = CPT{1,i};
            parent_size = length(parent_node);
            parent_state = curr_state(parent_node);
            if parent_size == 1
                prob = temp(parent_state,:);
                curr_state(1,i) = deter_sample(prob);              
            elseif parent_size == 2
                prob = temp(parent_state(1),parent_state(2),:);
                curr_state(1,i) = deter_sample(prob);              
            elseif parent_size == 3
                prob = temp(parent_state(1),parent_state(2),parent_state(3),:);
                curr_state(1,i) = deter_sample(prob);         
            else 
                error('parent size out of number!\n')
            end
        end
    end
    sampled_data = [sampled_data;curr_state];
end
sampled_data = sampled_data(burnin+1:end, :);
end

function sample_temp = deter_sample(prob)

prob_int = zeros(size(prob));
for j = 1:length(prob)
    prob_int(j,1) = sum(prob(1:j)); 
end
for j = 1:length(prob)
    rand_num = rand;
    if prob_int(j,1) > rand_num
        sample_temp = j;
        break;
    end
end
end
