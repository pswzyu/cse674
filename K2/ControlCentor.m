%ControlCentor
% when you test the code,please correct the directory in next command
load Sample.mat;

% Sample is a variable that saves our training database.
LGObj = ConstructLGObj( Sample); % construct an object

Order = [3 4 1 2 5 8 7 10 9 6]; % Order is the ordering of the input in K2 algorithm
%Order = [1:10];

u = 4; % u is the maximum edges of node in output graph.

[ DAG,K2Score ] = k2( LGObj,Order,u )
h = view(biograph( DAG ))