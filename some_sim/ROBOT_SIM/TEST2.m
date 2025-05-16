% تعريف الـ IK
ik = inverseKinematics('RigidBodyTree', robot67);
weights = [1 1 1 0 0 0];  % التركيز على XYZ فقط
initialGuess = robot67.homeConfiguration;

% تحديد هدف ثابت
targetXYZ = [0.118 0.058 0.126];
targetPose = trvec2tform(targetXYZ);  % تحويل إلى مصفوفة تحويل

% رسم الشكل الأولي
figure;
ax = show(robot67, initialGuess);
hold on;
plot3(targetXYZ(1), targetXYZ(2), targetXYZ(3), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
title('Inverse Kinematics Motion to Target');
view(135, 15);

% Animation loop (تكرار المحاولة للوصول لنفس الهدف)
for t = 0:0.1:1
    % حل الـ IK في كل خطوة (تقدر تغير الهدف هنا لو حبيت تحركه)
    [configSol, solInfo] = ik('Body5', targetPose, weights, initialGuess);

    % احسب الوضعية الفعلية
    actualPose = getTransform(robot67, configSol, 'Body5');
    actualXYZ = actualPose(1:3, 4)';

    % عرض الروبوت
    show(robot67, configSol, 'PreservePlot', false, 'Frames', 'off', 'Parent', ax);
    plot3(targetXYZ(1), targetXYZ(2), targetXYZ(3), 'ro', 'MarkerSize', 10);  % الهدف
    drawnow;

    % طباعة المعلومات في كل خطوة
    disp(['Step t = ' num2str(t)]);
    disp('Target:'); disp(targetXYZ);
    disp('Actual:'); disp(actualXYZ);
end
