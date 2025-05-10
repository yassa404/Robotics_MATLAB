clc;
clear;
close all;

% إعداد كاشف الوجه
faceDetector = vision.CascadeObjectDetector();

% فتح الكاميرا
cam = webcam();
frameWidth = 640;
frameHeight = 480;
cam.Resolution = '640x480';

% إعدادات المحاكاة
pan_angle = 90;   % زاوية ابتدائية
tilt_angle = 120; % زاوية ابتدائية

% إنشاء نافذة عرض
figure;
title('محاكاة تتبع الوجه و حركة Pan/Tilt');
hold on;

while true
    % التقاط صورة من الكاميرا
    img = snapshot(cam);
    img = imresize(img, [frameHeight, frameWidth]);
    
    % الكشف عن الوجه
    bbox = step(faceDetector, img);
    
    % رسم الصورة الأصلية
    imshow(img);
    hold on;

    if ~isempty(bbox)
        % استخدام أول وجه مكتشف فقط
        face = bbox(1, :);
        rectangle('Position', face, 'EdgeColor', 'g', 'LineWidth', 2);
        
        % حساب مركز الوجه
        centerX = face(1) + face(3)/2;
        centerY = face(2) + face(4)/2;
        plot(centerX, centerY, 'ro', 'MarkerSize', 10, 'LineWidth', 2);

        % حساب الزوايا الافتراضية
        target_pan = map_range(centerX, 0, frameWidth, 0, 180);
        target_tilt = map_range(centerY, 0, frameHeight, 180, 0); % عكس الاتجاه

        % تنعيم الزوايا
        pan_angle = smooth_angle(pan_angle, target_pan, 1);
        tilt_angle = smooth_angle(tilt_angle, target_tilt, 1);

        % عرض الزوايا
        title(sprintf('Pan = %.0f°, Tilt = %.0f°', pan_angle, tilt_angle));

        % رسم سهم يمثل اتجاه الكاميرا
        quiver(frameWidth/2, frameHeight, ...
            (centerX - frameWidth/2)/10, ...
            (centerY - frameHeight)/10, ...
            0, 'r', 'LineWidth', 2, 'MaxHeadSize', 3);
    else
        title('لا يوجد وجه');
    end

    drawnow;
end

% دالة تحويل القيمة من مدى لمدى
function out = map_range(val, in_min, in_max, out_min, out_max)
    out = (val - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
end

% دالة تنعيم الحركة
function next = smooth_angle(current, target, step)
    if abs(current - target) <= step
        next = target;
    elseif target > current
        next = current + step;
    else
        next = current - step;
end
end
