function y = speech2int(digits, speech)
    x = find_digits(speech);
    y = 0;
    for i = 1:size(x,2)
        temp = x(:,i);
        diff = [];
        for j = 1:10
            [r,lags] = xcorr(temp,digits(:,j));
            idx = find(r==max(r));
            temp_digit = circshift(digits(:,j),lags(:,idx));
            R = corr2(temp_digit,temp);
            diff = [diff; R];
        end
        diff;
        max(diff);
        idx = find(diff==max(diff))-1;
        y = y + 10^(size(x,2)-i)*idx;
    end
end
