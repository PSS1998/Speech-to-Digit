[y,Fs] = audioread('speech.wav');
y = y(:,1);
%sound(y,Fs);
ynew = resample(y,1,6);
audiowrite('speech1.wav', ynew, Fs/6);
[y,Fs] = audioread('speech1.wav');
%sound(y,Fs);

digits = find_digits(y);
%size(digits)
%sound(digits(:,6),8000);
%plot(digits(:,6))

N = 810195526;
result = int2speech(digits, N);
%size(result)
%audiowrite('speech2.wav', result, 8000);
%sound(result,8000);
sz = size(result);
noise = randn(sz);
w = (max(result) - min(result))/(max(noise) - min(noise))/7;
noise = noise*w;
F = fft(noise);
pow = F.*conj(F);
total_pow1 = sum(pow);
F = fft(result);
pow = F.*conj(F);
total_pow2 = sum(pow);
snr = total_pow2/total_pow1;
result = result+noise;
%sound(result,8000);
%audiowrite('speech3.wav', result, 8000);

[y,Fs] = audioread('speech3.wav');
%y = y(:,1);
%[p,q] = rat(8000 / Fs);
%ynew = resample(y,p,q);
result = speech2int(digits, y);
result
