function y = int2speech(digits, N)
    num = numel(num2str(N));
    y = [];
    for i = 1:num
        d = 10^(num-i);
        r = mod(N, d);
        d = (N - r) / d;
        N = N-(10^(num-i)*d);
        temp = digits(:,d+1);
        y = [y; temp];
        temp = zeros(2000,1);
        y = [y; temp];
    end
    temp = zeros(2000,1);
    y = [temp; y];
end
