% This is an example of parrun-reduce 
% uing Clusterjob for cells with structure in them
% Copyright 2015 Hatef Monajemi (monajemi@stanford.edu) 

close all
clear all
clc



L = [1/8,2/8,3/8,4,5, 7e-1/8]

% Always initiate your outputs
% otherwise reduce will not work

output.myStructCell = cell(6,5);
output.myCharCell = cell(6,5);
output.myMatrix = zeros(6,5);


for i = 1:length(L)
for j = 1:5

    l = L(i);
    mystruct.i = l;
    mystruct.j = j;

    output.myMatrix(i,j) = i+j;
    output.myStructCell{i,j} = mystruct;
    output.myCharCell{i,j}   = 'i,j';

% save results
filename='Results.mat';
savestr   = sprintf('save ''%s'' output', filename);
eval(savestr);
fprintf('CREATED OUTPUT FILE %s EXPERIMENT COMPLETE\n',filename);

  end
end











