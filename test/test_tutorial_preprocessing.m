function test_tutorial_preprocessing

% TEST test_tutorial_preprocessing
% TEST ft_definetrial ft_preprocessing ft_read_header ft_read_event


current = cd('/home/common/matlab/fieldtrip/data');


cfg                         = [];
  cfg.dataset                 = 'Subject01.ds';
  cfg.trialdef.eventtype      = 'backpanel trigger';
  cfg.trialdef.eventvalue     = 3; % the value of the stimulus trigger for fully incongruent (FIC).
  cfg.trialdef.prestim        = 1; % in seconds
  cfg.trialdef.poststim       = 2; % in seconds
 
  cfg = ft_definetrial(cfg);


  cfg.channel    = {'MEG' 'EOG'};
cfg.continuous = 'yes';
dataFIC = ft_preprocessing(cfg);


cfg                         = [];
cfg.dataset                 = 'Subject01.ds';
cfg.trialdef.eventtype      = 'backpanel trigger';  
cfg.trialdef.eventvalue     = 5; % the value of the stimulus trigger for initially congruent (IC).
cfg.trialdef.prestim        = 1; % in seconds
cfg.trialdef.poststim       = 2; % in seconds

cfg = ft_definetrial(cfg);

cfg.channel    = {'MEG' 'EOG'};
cfg.continuous = 'yes';
dataIC = ft_preprocessing(cfg);

cfg                         = [];
cfg.dataset                 = 'Subject01.ds';
cfg.trialdef.eventtype      = 'backpanel trigger';
cfg.trialdef.eventvalue     = 9; % the value of the stimulus trigger for fully congruent (FC).
cfg.trialdef.prestim        = 1; % in seconds
cfg.trialdef.poststim       = 2; % in seconds
  
cfg = ft_definetrial(cfg);

cfg.channel    = {'MEG' 'EOG'};
cfg.continuous = 'yes';
dataFC = ft_preprocessing(cfg);

% 
% 
% cfg = [];
% cfg.dataset  = 'Subject01.ds'; 
% cfg.trialfun = 'mytrialfun'; % ft_definetrial will call your function and pass on the cfg
% cfg.trialdef.eventtype  = 'backpanel trigger';
% cfg.trialdef.eventvalue = [3 5 9]; % read all conditions at once
% cfg.trialdef.prestim    = 1; % in seconds
% cfg.trialdef.poststim   = 2; % in seconds
% % 
% cfg = ft_definetrial(cfg);
% % 
% cfg.channel = {'MEG' 'STIM'};
% dataMytrialfun = ft_preprocessing(cfg);
cd(current);
end
