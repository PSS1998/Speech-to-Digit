function y = speech2int(digits, speech)
    x = find_digits(speech);
    y = 0;
    for i = 1:size(x,2)
        temp = x(:,i);
        diff = [];
        for j = 1:10
            R = corr2(temp,digits(:,j));
            diff = [diff; R];
        end
        diff;
        max(diff)
        idx = find(diff==max(diff))-1;
        y = y + 10^(size(x,2)-i)*idx;
    end
    %sound(x(:,3),8000);
    %figure(1)
    %plot(x(:,3))
    %figure(2)
    %plot(digits(:,2))
end