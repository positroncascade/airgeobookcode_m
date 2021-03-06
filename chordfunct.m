function Chord = chordfunct(Epsilon, Funct, Parameters)
%CHORDFUNCT Spanwise variation of chord length.
%   It determines the variation of the local chord as a function of the 
%   spanwise coordinate Epsilon. It calls the specified 'Funct' with 
%   'Parameters' and the Epsilon vector as input arguments. 
%   This main function simply checks the inputs and the outputs.

% Are all the elements of Epsilon in the correct range [0,1]?

if sum(Epsilon>1)>0 || sum(Epsilon<0)>0
    error('Wing-attached coordinate value must be within [0,1].')
end

Chord = feval(Funct, Parameters, Epsilon);

% Has the function specified a chord at each station?
if length(Chord)~=length(Epsilon)
    error(['The specified chord function ',Funct,...
        ' returns an incorrect chord vector']);
end