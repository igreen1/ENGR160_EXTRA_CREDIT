%%Hey Dr. Asghari
%%this file will run the two matlab programs

clc
clear all
close all

%% first ec problem
%first, lets run the first extra credit problem: matav
%the point of this is to find the averagae of a matrix
%calling the function matav will return a logic matrix
%which will be all 1 if the function is correctly executing
%look at matav.m for details

A = [1 2 3; 4 5 6; 7 8 9];

disp(matav(A))

%% second ec problem - the tangent
tangent_problem();