function [c_img, loc_img] = classify_image(img, d, mask)
    disp('CLASSIFYING THE IMAGE');
    L = [-1 -1 -1; -1 8 -1; -1 -1 -1];
    L = L*-1;
    laplacian = fspecial('laplacian');
    [h, w, s] = size(img);
    c_img = zeros(h,w);
    
%     image = imgaussfilt(img);
    image = img;
    loc_img = img;
    flag = 0;
    
    for i = 1:d:h-d+1
        for j = 1:d:w-d+1
            if mask(floor(i/d)+1, floor(j/d)+1) == 0
                continue;
            end
            p = image(i:i+d-1, j:j+d-1, :);
            e = edge(rgb2gray(p), 'Canny');
            pdel = imfilter(e, L); %pdel considers diagonal neighbours while ps does not
            ps = imfilter(e, laplacian);
            cc = bwconncomp(pdel);
            
            if cc.NumObjects == 0
                continue;
            end
            [cmp_e, cmp_pdel, cmp_p] = component(cc, e ,pdel, d, p);
            intensity = find_intensity(cmp_e, cmp_pdel, cmp_p);
            c_img(i,j) = classify_pixel(intensity);
%             
%             if sum(e(:)) > 60
%                 flag=1;
%                 break;
%             end       
            if c_img(i,j) == 1
                flag = 1;
                disp('yasss');
                loc_img = insertShape(loc_img, 'Rectangle', [j i d d], 'LineWidth', 3);
%                 break;
            end
        end
%         if flag==1
%             break;
%         end
    end
end