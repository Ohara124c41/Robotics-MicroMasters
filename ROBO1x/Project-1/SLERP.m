function [ q_int ] = quat_slerp( q0, q1, steps )
%QUAT_SLERP Perform SLERP between two quaternions and return the intermediate quaternions
%   Usage: [ q_int ] = quat_slerp( q0, q1, steps )
%   Inputs:
%       q0 is the quaternion representing the starting orientation, 1x4 matrix
%       q1 is the quaternion representing the final orientation, 1x4 matrix
%       steps is the number of intermediate quaternions required to be returned, integer value
%       The first step is q0, and the last step is q1
%   Output:
%       q_int contains q0, steps-2 intermediate quaternions, q1
%       q_int is a (steps x 4) matrix

    %% Your code goes here
    %% Ohara124c41
    q_int = zeros(steps, 4);


    
omega = acos(q0 * q1');
 
if (omega > pi/2);
    q1 = -q1
    omega = acos(dot(q0,q1)) %If the dot product is less than zero, you flip the sign on q0 and dot product
end
q_int(1,:) = q0;
q_int(steps,:) = q1;
v = 1:(steps - 1);
v = v';
v = v / (steps - 1);
t = v;
q_int(2:steps,:) = sin((1 - t) * omega) / sin(omega) * q0 + sin(t * omega) / sin(omega) * q1; 
    
    
    
end