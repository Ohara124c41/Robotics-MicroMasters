% In this script, you need to convert the quaternion to a rotation matrix
% Your final solution for the rotation matrix must be stored in R
% The quaternion for Qs + Qx i + Qy j + Qz k, is represented in matrix form as [Qs, Qx, Qy, Qz]

task2_solution = zeros(3*20, 3);

% Test code for 20 different quaternions
for i = 1:20

    quat = genQuaternion(); % Generates a random quaternion
    % quat is a 1x4 matrix of the form [Qs, Qx, Qy, Qz]
    Qs = quat(1);
    Qx = quat(2);
    Qy = quat(3);
    Qz = quat(4);
    %% Your code starts here
    Q = zeros(3,3);
    Q = [-2*Qy^2-2*Qz^2,2*Qx*Qy-2*Qz*Qs,2*Qx*Qz+2*Qy*Qs;
         2*Qx*Qy+2*Qz*Qs,-2*Qx^2-2*Qz^2,2*Qy*Qz-2*Qx*Qs;
         2*Qx*Qz-2*Qy*Qs,2*Qy*Qz+2*Qx*Qs,-2*Qx^2-2*Qy^2]
    
    
    % Your solution for R must be a 3x3 matrix
    R = eye(3);
    R = R+Q;

    %% Your code ends here
    
    %% Storing answer for auto-grading
    if ~isequal(size(R), [3 3])
        error('R must be a 3x3 matrix')
    end
    
    task2_solution(((i-1)*3)+1:((i-1)*3)+3, :) = R;
end
