function val = classify_pixel(intensity)
    n = size(intensity, 1);
    val = 0;
    aa = [1 1];
    bb = [1];
    
    for i = 1:n
        for j = i+1:n
            for k = j+1:n
                m1 = [intensity(i) intensity(j)];
                m2 = [intensity(k)];
                disp([m1 m2]);
%                 lambda1 = m1\m2;
                lambda1 = lsqlin(m1,m2,[],[],aa,bb,0,1);
%                 lambda1 = linsolve(m1,m2);

                if sum(lambda1(:)) == 1
                    val = 1;
                    break;
                end
                m3 = [intensity(i) intensity(k)];
                m4 = [intensity(j)];
                disp([m3 m4]);
%                 lambda2 = m3\m4;
                lambda2 = lsqlin(m3,m4,[],[],aa,bb,0,1);
%                 lambda2 = linsolve(m3,m4);
                  
                if sum(lambda2(:)) == 1
                    val = 1;
                    break;
                end
                m5 = [intensity(j) intensity(k)];
                m6 = [intensity(i)];
                disp([m5 m6]);
%                 lambda3 = m5\m6;
                lambda3 = lsqlin(m5,m6,[],[],aa,bb,0,1);
%                 lambda3 = linsolve(m5,m6);

                if sum(lambda3(:)) == 1
                    val = 1;
                    break;
                end
                if lambda1(1)>1 || lambda1(2)>1 ||lambda2(1)>1 || lambda2(2)>1 || lambda3(1)>1 || lambda3(2)>1
                    disp('messing up');
                    disp([lambda1 lambda2 lambda3]);
                end
            end
            if val == 1
                break;
            end
        end
        if val == 1
            break;
        end
    end
end