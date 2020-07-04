function y = find_digits(x)
    y = [];
    count_pow = [];
    count = 0;
    len = floor(size(x,1)/800);
    for i = 1:len
        count = count + 1;
        temp = x(1+(i-1)*800:i*800,:);
        size(temp,1);
        F = fft(temp);
        pow = F.*conj(F);
        total_pow = sum(pow);
        count_pow = [count_pow; total_pow, count];

    end
    [peak,idx] = findpeaks(count_pow(:,1),'MinPeakHeight',2500,'MinPeakDistance',3);
    index = (idx-2)/5;
    for j = 1:size(peak)
        i = index(j);
        z = 0;
        if (i+1)*4000 - size(x,1) > 0
            z = (i+1)*4000 - size(x,1) ;
        end
        if 1+(i)*4000 - 0 < 0
            z = 1+(i)*4000 ;
        end
        temp = x(1+(i)*4000-z:(i+1)*4000-z,:);
        y(:,j) = temp;
    end
end
