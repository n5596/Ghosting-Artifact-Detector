function eval = metric(c_img, d, h, w)
    disp('CALCULATING THE EVALUATION METRIC');
    num = sum(c_img(:));
    a = round(h/d);
    b = round(w/d);
    denom = a*b;
    eval = num/denom;
end