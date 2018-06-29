function [cmp_e, cmp_pdel, cmp_p] = component(cc, e, pdel, d, p)
    n = cc.NumObjects;
    for i = 1:n
        array = cc.PixelIdxList{1,i};
        [c, r] = ind2sub([d, d], array);
        top_val = min(r);
        bottom_val = max(r);
        right_val = min(c);
        left_val = max(c);
        e_crop = e(right_val:left_val, top_val:bottom_val);
        pdel_crop = pdel(right_val:left_val, top_val:bottom_val);
        p_crop = p(right_val:left_val, top_val:bottom_val,:);
        cmp_e{i,:} = e_crop;
        cmp_pdel{i,:} = pdel_crop;
        cmp_p{i,:} = p_crop;
    end
end