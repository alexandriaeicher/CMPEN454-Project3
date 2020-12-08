function sfdImage = performSimpleFrameDifferenceing(BtSub1, grayscaleImage, abs_diff_threshold)
    % B(0) = I(0);
    % …
    % loop time t
    % I(t) = next frame;
    % diff = abs[B(t-1) – I(t)];
    % M(t) = threshold(diff,l);
    % …
    % B(t) = I(t);
    % end

     diff = abs(BtSub1 - grayscaleImage);
     sfdImage = diff > abs_diff_threshold;
end