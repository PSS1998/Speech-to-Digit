function y = find_digits(x)
    y = [];
    count_pow = [];
    count = 2;
    len = floor(size(x,1)/2000);
    for i = 3:len
        count = count + 1;
        temp = x(1+(i-1)*2000:i*2000,:);
        size(temp,1);
        F = fft(temp);
        pow = F.*conj(F);
        total_pow = sum(pow);
        count_pow = [count_pow; total_pow, count];

    end
    %findpeaks(count_pow(:,1))
    peak = findpeaks(count_pow(:,1));
    for j = 1:size(peak)
        if peak(j)<10000
            continue;
        end
        idx = count_pow(:,1)==peak(j);
        i = round(count_pow(idx,2)/2);
        temp = x(1+(i-1)*4000:i*4000,:);
        y(:,j) = temp;
        %y = [y; temp];  
    end
end




