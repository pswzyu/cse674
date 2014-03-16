function [ index ] = unusual_writing( dataset )
%UNUSUAL_WRITING Summary of this function goes here
%   Detailed explanation goes here
% the input is the dataset
% return value is the index of the most unusual writing datapoint in the
% dataset

% first get the DAG and CPT of the dataset
[DAG, CPT, child_bnet] = learn_k2_cn(dataset);
%% use the CPT to calculate the probability of one datapoint

% we are calculating the joint distribution as if we observe all the
% variables
NN = size(DAG, 1); % number of random variables
NS = size(dataset, 1); % number of samples in the datasetr
% initialize the inference engine

logprobs = zeros(NS, 1); % record log prob for each sample

for step = 1:NS
    one_sample = dataset(step,:);
    logprob = 0;
    for step2 = 1:NN
        parents = DAG(:,step2); % a column is the nodes that connects to this node
        % find all the node that is connected to this node
        parents_asst = one_sample(parents'>0);
        % get the assignments
        tmp_idx = num2cell([parents_asst, one_sample(1, step2)]);
        % this is a trick for get the assignment dynamicly
        tmp_cpt = cell2mat( CPT(1,step2) );
        logprob = logprob + log( tmp_cpt(tmp_idx{:}) );
    end
    logprobs(step,1) = logprob;
end
[~, index] = min(logprobs);

end

