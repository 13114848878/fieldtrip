function test_bug1129

% TEST: test_bug1129 ft_preprocessing ft_preproc_bandpassfilter
% ft_preproc_bandstopfilter ft_preproc_lowpassfilter
% ft_preproc_highpassfilter

% change filter order for 'fir' (fir1) filter type, rather than 25 by
% default, instead to be based on Fs, low-frequency, and data-length

%% low-level functions on random data
close all
for N=199:201
  x1 = randn(1,N);
  
  % % % FT default if call 'fir' (order 25)
  y4 = ft_preproc_bandpassfilter(x1, 1000, [15 25],25,'fir');
  y7 = ft_preproc_bandpassfilter(x1, 1000, [15 25],100,'fir');
  y8 = ft_preproc_bandpassfilter(x1, 1000, [15 25],200,'fir');
  y9 = ft_preproc_bandpassfilter(x1, 1000, [15 25],[],'fir');
  % figure;plot(linspace(0,1000,N),abs(fft(y4)));axis([0 40 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y7)),'r');axis([0 40 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y8)),'g');axis([0 40 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 40 0 inf])
  
  y4 = ft_preproc_bandstopfilter(x1, 1000, [15 25],25,'fir');
  y7 = ft_preproc_bandstopfilter(x1, 1000, [15 25],100,'fir');
  y8 = ft_preproc_bandstopfilter(x1, 1000, [15 25],200,'fir');
  y9 = ft_preproc_bandstopfilter(x1, 1000, [15 25],[],'fir');
  % figure;plot(linspace(0,1000,N),abs(fft(y4)));axis([0 40 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y7)),'r');axis([0 100 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y8)),'g');axis([0 100 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 100 0 inf])
  %
  y4 = ft_preproc_highpassfilter(x1, 1000, [15],25,'fir');
  y7 = ft_preproc_highpassfilter(x1, 1000, [15],100,'fir');
  y8 = ft_preproc_highpassfilter(x1, 1000, [15],200,'fir');
  y9 = ft_preproc_highpassfilter(x1, 1000, [15],[],'fir');
  % figure;plot(linspace(0,1000,N),abs(fft(y4)));axis([0 40 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y7)),'r');axis([0 100 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y8)),'g');axis([0 100 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 100 0 inf])
  %
  y4 = ft_preproc_lowpassfilter(x1, 1000, [15],25,'fir');
  y7 = ft_preproc_lowpassfilter(x1, 1000, [15],100,'fir');
  y8 = ft_preproc_lowpassfilter(x1, 1000, [15],200,'fir');
  y9 = ft_preproc_lowpassfilter(x1, 1000, [15],[],'fir');
  % figure;plot(linspace(0,1000,N),abs(fft(y4)));axis([0 40 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y7)),'r');axis([0 100 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y8)),'g');axis([0 100 0 inf])
  % hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 100 0 inf])
end

for N=[199 432 1000] % test 'firls' option
  x1 = randn(1,N);
  y9 = ft_preproc_bandpassfilter(x1, 1000, [15 25],[],'fir');
  y19 = ft_preproc_bandpassfilter(x1, 1000, [15 25],[],'firls');
%   figure;plot(linspace(0,1000,N),abs(fft(y19)));axis([0 40 0 inf])
%   hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 40 0 inf])

  x1 = randn(1,N);
  y9 = ft_preproc_bandstopfilter(x1, 1000, [25 15],[],'fir');
  y19 = ft_preproc_bandstopfilter(x1, 1000, [25 15],[],'firls');
%   figure;plot(linspace(0,1000,N),abs(fft(y19)));axis([0 100 0 inf])
%   hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 100 0 inf])

  x1 = randn(1,N);
  y9 = ft_preproc_lowpassfilter(x1, 1000, [15],[],'fir');
  y19 = ft_preproc_lowpassfilter(x1, 1000, [15],[],'firls');
%   figure;plot(linspace(0,1000,N),abs(fft(y19)));axis([0 100 0 inf])
%   hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 100 0 inf])
  
  x1 = randn(1,N);
  y9 = ft_preproc_highpassfilter(x1, 1000, [15],[],'fir');
  y19 = ft_preproc_highpassfilter(x1, 1000, [15],[],'firls');
%   figure;plot(linspace(0,1000,N),abs(fft(y19)));axis([0 100 0 inf])
%   hold on;plot(linspace(0,1000,N),abs(fft(y9)),'m');axis([0 100 0 inf])

end

%% high-level ft_preprocessing
load test_bug1129

cfg=[];
cfg.bpfreq=[8 12];
cfg.bpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.bpfreq=[8 12];
cfg.bpfilter='yes';
cfg.bpfilttype='fir';
cfg.bpfiltord=2000;
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.bpfilttype='fir';
cfg.bpfreq=[8 12];
cfg.bpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.bsfilttype='firls';
cfg.bsfreq=[8 12];
cfg.bsfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.bsfilttype='fir';
cfg.bsfreq=[8 12];
cfg.bsfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.lpfilttype='fir';
cfg.lpfreq=[8];
cfg.lpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.hpfilttype='fir';
cfg.hpfreq=[8];
cfg.hpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.bpfreq=[8 12];
cfg.bpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.bsfreq=[8 12];
cfg.bsfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.lpfreq=[8];
cfg.lpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

cfg=[];
cfg.hpfreq=[8];
cfg.hpfilter='yes';
rawfilt=ft_preprocessing(cfg,raw3);

% assert(isequalwithequalnans(data, datanew));


