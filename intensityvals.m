function avg = intensityvals(matrix, image)
    image = double(image);
    
    in(:,:,1) = matrix .* image(:,:,1);
    in(:,:,2) = matrix .* image(:,:,2);
    in(:,:,3) = matrix .* image(:,:,3);
%     gray = rgb2gray(image);
%     in = matrix .* double(gray);
    pixelsum = sum(in(:));
    count = nnz(in);
    if count == 0
        avg = 0;
    else
        avg = pixelsum/count;
    end
end