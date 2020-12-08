function [pfdImage, Ht] = performPersistentFrameDifferencing(BtSub1, HtSub1, grayscaleImage, abs_diff_threshold, gamma_parameter)

% B(0) = I(0);
% H(0) = 0;
% loop time t
% I(t) = next frame;
% diff = abs[B(t-1) – I(t)];
% M(t) = threshold(diff,l);
% tmp = max[H(t-1)-g,0)];
% H(t) = max[255*M(t),tmp)];
% …
% B(t) = I(t);
% end

diff = abs(BtSub1 - grayscaleImage);
Mt = diff > abs_diff_threshold;

tmp = max(HtSub1-gamma_parameter, 0);
Ht = max(255*Mt, tmp);
pfdImage = Ht / 255;

end