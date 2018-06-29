function [upper, lower] = edgemask(edges, pdel)
    [h, w] = size(pdel);
    mask = zeros(h,w);

    for i = h:-1:1
        for j = w:-1:1
            if edges(i,j) == 1
                mask(i+1:h, j) = 1;
            end
        end
    end
    lower = mask.*pdel;
    upper = (1-mask).*pdel;
end