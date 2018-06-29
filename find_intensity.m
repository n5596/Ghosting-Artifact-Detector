function in_array =  find_intensity(cmp_e, cmp_pdel, cmp_p)
    n = size(cmp_e, 1);
    in_array = zeros(2*n, 1);
    
    a = 1;
    for i = 1:n
        ce = cmp_e{i,:};
        cpdel = cmp_pdel{i,:};
        cp = cmp_p{i,:};
        [u, l] = edgemask(ce, cpdel); 
        
        u_intensity = intensityvals(u, cp);
        l_intensity = intensityvals(l, cp);
        in_array(a) = u_intensity;
        in_array(a+1) = l_intensity;
        a = a+2;
    end
end