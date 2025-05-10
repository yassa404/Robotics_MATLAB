% target position
targetPose = trvec2tform([0.118 0.058 0.126]);

% إنشاء الـ IK solver
ik = inverseKinematics('RigidBodyTree', robot67);
weights = [1 1 1 0 0 0]; % position only
initialGuess = robot67.homeConfiguration;

[configSol, solInfo] = ik('Body5', targetPose, weights, initialGuess);

% تحقق من الناتج
endEffectorPose = getTransform(robot67, configSol, 'Body5');

% طباعة الفرق بين الهدف والناتج
disp("Target:");
disp(targetPose(1:3,4)');
disp("Actual:");
disp(endEffectorPose(1:3,4)');
