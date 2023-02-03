%Problem1--------generate uniform iid/plot histgram/plot CDF
X = randn(1000,1);
subplot(121);
hist(X,50);
title("Histogram of Uniformly Distributed Random Numbers");
subplot(122);
cdfplot(X);
title("CDF of Uniformly Distributed Random Numbers");
% Problem2-----------Gaussian iid----N(0,1), histand CDF 
Y = randn(1000,1);
subplot(121);
hist(Y,50);
title("Histogram of Gaussian Random Numbers");
subplot(122);
cdfplot(Y);
title("CDF of Gaussian Distributed Random Numbers");
% Problem3---------------RX and Sxf
X = -2+4*rand(1,1001); 
Rx = Rx_est(X, 50);
m = 0:1:50;
subplot(121);
plot(m, Rx);
xlabel("m");
ylabel("R_X(m)");
title("Autocorrelation Function R_X(m) of the Uniform Random Process");
Sx = fft(Rx);
Sx = fftshift(Sx);
n = -25:1:25;
subplot(122);
plot(n, Sx);
xlabel("f");
ylabel("S_X(f)");
title("Power Spectrum Density (PSD) of the Uniform Random Process");
% Problem4-b
clear;
num = 10^8;
a = rand(1, num);
a(a>0.5)=1;
a(a<0.5)=-1;
X = a;
N = randn(1,num);
Y = X + N;
count = 0;
for i = 1:1:num
   if Y(i) > 0
       if X(i) == -1
           count = count + 1;
       end % if
   end % if
   if Y(i) < 0
       if X(i) == 1
           count = count + 1;
       end % if
   end % if
end % i
error = count / num; % error bit prob
% Problem 4-c
clear;
num = 10^8;
a = rand(1, num);
a(a>0.5)=1;
a(a<0.5)=-1;
X = a;
sigma = zeros(11,1);
errors = zeros(11,1);
for SNR = 0:1:10 % SNR range
   ratio = SNR / 10;
   fract_bot = 10^(ratio); % SNR linear domain
   sigma_2 = 1 / fract_bot;
   sigma(SNR+1) = sqrt(sigma_2);
   for i = 1:1:11
       N  = sigma(i) * randn(1, num);
       Y  = X + N; % received signal
       count(i) = 0;
       for j = 1:1:num
           if Y(j) > 0
               if X(j) == -1
                   count(i) = count(i) + 1;
               end % if
           end % if
           if Y(j) < 0
               if X(j) == 1
                   count(i) = count(i) + 1;
               end % if 
           end % if
       end % j
       error(i) = count(i) / num; % error bit prob
   end % i
end % SNR
s = 0:1:10;
semilogy(s, error);
xlabel("SNR[dB]");
ylabel("error percentage");
title("Percentage of Wrong Estimates (error) as a function of SNR");




