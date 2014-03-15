%ControlCentor
% when you test the code,please correct the directory in next command
%load('/home/pswzyu/workspace/674/K2/Sample.mat');
function [DAG, CPT] = learn_k2_cn( Sample )

cards = max( Sample, [], 1 );

% Sample is a variable that saves our training database.
LGObj = ConstructLGObj( Sample); % construct an object

%Order = [3 4 1 2 5 8 7 10 9 6]; % Order is the ordering of the input in K2 algorithm
Order = [1:12];

u = 4; % u is the maximum edges of node in output graph.

[ DAG,K2Score ] = k2( LGObj,Order,u );
%h = view(biograph( DAG ))

% calculate the CPD
NN = size(DAG, 1);
%for step = 1:N
%    
%end

child_bnet = mk_bnet(DAG, cards);

for step = 1:NN
    child_bnet.CPD{step} = tabular_CPD(child_bnet, step);
end

child_bnet_para = learn_params(child_bnet, Sample');

CPT = {};

for step = 1:NN
    tmp = struct(child_bnet_para.CPD{step});
    CPT{step} = tmp.CPT;
end


end