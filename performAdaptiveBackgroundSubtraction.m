function absImage = performAdaptiveBackgroundSubtraction(adaptB, abs_diff_threshold, adaptgrayscaleImage)



    diff = abs(adaptB - adaptgrayscaleImage);
% sbsImage = im2bw(diff, abs_diff_threshold);
    absImage = diff > abs_diff_threshold;
end
