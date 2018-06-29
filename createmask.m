function I_mask = createmask(img, d)
    lp_img = imgaussfilt(img);
    I_edges = edge(rgb2gray(lp_img), 'Canny');
    [h, w, s] = size(img);
    
    I_mask = zeros(round(h/d), round(w/d));

    for i = 1:d:h-d+1
        for j = 1:d:w-d+1
            patch = I_edges(i:i+d-1, j:j+d-1);
            value = sum(patch(:));
            if value >= d
                I_mask(floor(i/d)+1, floor(j/d)+1) = 1;
            end
        end
    end
end