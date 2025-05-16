% عدد النقاط اللي هيترسم بيها
n = 1000;

% مصفوفة لتخزين الـ XYZ
workspacePoints = zeros(n, 3);

for i = 1:n
    % عيّن وضع عشوائي لكل Joint
    config = randomConfiguration(robot67);
    
    % احسب موقع نهاية الذراع
    endEffectorPose = getTransform(robot67, config, 'Body5');
    
    % خزن الـ XYZ
    workspacePoints(i, :) = endEffectorPose(1:3, 4)';
end

% ارسم النقاط
figure;
scatter3(workspacePoints(:,1), workspacePoints(:,2), workspacePoints(:,3), '.', 'MarkerEdgeAlpha', 0.3);
hold on;
grid on;
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Estimated Workspace of robot67');

% ارسم الهدف المرغوب فيه
target = [0.118 0.058 0.126];
plot3(target(1), target(2), target(3), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
legend('Workspace Samples', 'Target Point');
