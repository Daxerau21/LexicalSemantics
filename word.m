function varargout = word(varargin)
% ***************************** 1. MATLAB HEADER **************************
% WORD M-file for word.fig
%      WORD, by itself, creates a new WORD or raises the existing
%      singleton*.
%
%      H = WORD returns the handle to a new WORD or the handle to
%      the existing singleton*.
%
%      WORD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WORD.M with the given input arguments.
%
%      WORD('Property','Value',...) creates a new WORD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before word_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to word_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help word

% Last Modified by GUIDE v2.5 26-Jan-2021 06:59:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @word_OpeningFcn, ...
                   'gui_OutputFcn',  @word_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before word is made visible.
function word_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to word (see VARARGIN)

% Choose default command line output for word
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes word wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = word_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% ****************************** 2. FUNCTIONS *****************************
function f = sigmoid(z) 
 f = 1 / (1 + exp(-z));
 
function f = letterindex(letter)
 if letter == '#'
  x = 27;
 else
  x = double(letter) - 96;
 end
 f = x;

% **************************** 3. INITIALIZATION **************************
function radiobutton1_Callback(hObject, eventdata, handles)
% Initialize
handles.showlearninggraph = 0;
handles.trajectories2d = 0;
handles.trajectories3d = 0;
guidata (gcbo, handles);

% ******************************** 4.INPUT ********************************

function radiobutton2_Callback(hObject, eventdata, handles)
% Load letter rep file
letterreplist = importdata ('letterreps.txt');
[nrofrows nrofcols] = size(letterreplist);
handles.letterreplist = letterreplist;
handles.nrofletterreps = nrofrows;
handles.letterreplength = nrofcols;
set (handles.edit1, 'string', int2str (handles.nrofletterreps));
set (handles.edit2, 'string', int2str (handles.letterreplength));
guidata (gcbo, handles);

function radiobutton3_Callback(hObject, eventdata, handles)
% Load word file
wordlist = importdata ('wordlist.txt')
[nrofrows nrofcols] = size(wordlist);
handles.wordlist = wordlist;
handles.nrofwords = nrofrows;
handles.wordlength = nrofcols;
set (handles.edit3, 'string', int2str (handles.nrofwords));
guidata (gcbo, handles);

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% Nr of hidden units
str = get (hObject, 'String');
handles.nrofwordnethiddenunits = str2num (str);
guidata (gcbo, handles);

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% Nr of iterations
str = get (hObject, 'String');
handles.nrofiterations = str2num (str);
guidata (gcbo, handles);

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% Nr of cycles
str = get (hObject, 'String');
handles.nrofcycles = str2num (str);
guidata (gcbo, handles);

function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
% Learning rate
str = get (hObject, 'String');
handles.learningrate = str2num (str);
guidata (gcbo, handles);

function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton4_Callback(hObject, eventdata, handles)
% Show learning graph
handles.showlearninggraph = 1;
guidata (gcbo, handles);

% ********************************* 5. TRAIN ******************************

function radiobutton7_Callback(hObject, eventdata, handles)
% Train 
if handles.showlearninggraph == 1
 figure(1);
 axes('Position',[0.1,0.1,0.8,0.8]);
 xlim([1 handles.nrofiterations]);
 ylim([1 100]);
end

% Layer sizes
handles.nrofwordnetinputunits = (handles.letterreplength *2) + handles.nrofwordnethiddenunits;
handles.nrofwordnetoutputunits = handles.letterreplength * 2;
handles.nrofwordnetinitfeedbackunits = handles.nrofwordnethiddenunits;

% Initialize connections
for i = 1:handles.nrofwordnetinputunits
 for j = 1:handles.nrofwordnethiddenunits
  handles.wordnetconn1_2(i,j) = rand /10;   
 end
end
for i = 1:handles.nrofwordnethiddenunits
 for j = 1:handles.nrofwordnetoutputunits
  handles.wordnetconn2_3(i,j) = rand / 10;   
 end
end

% Create initial feedback vector
for i = 1:handles.nrofwordnethiddenunits
 handles.wordnetinitfeedbackunits(i) = rand / 10;
end

%Start training
handles.trainhiddenlayerlistlength = 0;
for i = 1:handles.nrofiterations
 % Initialize hidden layer for feedback at each iteration
 for j = 1:handles.nrofwordnethiddenunits
  handles.wordnethiddenunits(j) = handles.wordnetinitfeedbackunits(j);
 end
  
 %Initialize error
 totalerror = 0;   
 
 % Randomly select a word
 index = randi (handles.nrofwords);
 currentword = handles.wordlist(index);
  
 % Convert to character string
 currentword = char(currentword);
 currentwordlength = length(currentword);
 
 for j = 2:currentwordlength
  currentletter = currentword(j);
  % Lookback
  currentlookback1 = currentword(j-1);
  % Get current letter rep
  currentletterindex = letterindex(currentletter);
  currentletterrep = handles.letterreplist(currentletterindex,:);
  % Get lookback rep
  currentlookbackindex = letterindex(currentlookback1);
  currentlookbackrep = handles.letterreplist(currentlookbackindex,:);
  
  % Load input units of layer 1
  for k = 1:handles.letterreplength 
   handles.wordnetinputunits(k) = currentletterrep(k);   
  end
  for k = 1:handles.letterreplength 
   handles.wordnetinputunits(handles.letterreplength + k) = currentlookbackrep(k);   
  end
  for k = 1:handles.nrofwordnetinitfeedbackunits
   handles.wordnetinputunits((handles.letterreplength * 2) + k) = handles.wordnethiddenunits(k);
  end
  
  % Target output
  for k = 1:handles.letterreplength 
   handles.wordnettargetoutput(k) = currentletterrep(k);   
  end
  for k = 1:handles.letterreplength 
   handles.wordnettargetoutput(handles.letterreplength + k) = currentlookbackrep(k);   
  end
  
  % Train current i/o pair
  for k = 1:handles.nrofcycles
   % Feedforward propagation
   % Propagate layer 1 to layer 2
   for l = 1:handles.nrofwordnethiddenunits
    sum = 0;
    for m = 1:handles.nrofwordnetinputunits
     sum = sum + (handles.wordnetinputunits(m) * handles.wordnetconn1_2(m,l));
    end
    handles.wordnethiddenunits(l) = sigmoid(sum);
   end
    
   % Propagate layer 2 to layer 3
   for l = 1:handles.nrofwordnetoutputunits
    sum = 0;
    for m = 1:handles.nrofwordnethiddenunits
     sum = sum + (handles.wordnethiddenunits(m) * handles.wordnetconn2_3(m,l));
    end
    handles.wordnetoutputunits(l) = sigmoid(sum);
   end
   
   % Calculate layer 3 error relative to target output
   for l = 1:handles.nrofwordnetoutputunits
    error = handles.wordnettargetoutput(l) - handles.wordnetoutputunits(l);
    handles.wordnetoutputerror(l) = error * handles.wordnetoutputunits(l) * (1 - handles.wordnetoutputunits(l));
    totalerror = totalerror + abs(error);
   end
   
   % Calculate hidden layer error
   for l = 1:handles.nrofwordnethiddenunits
    error = 0;
    for m = 1:handles.nrofwordnetoutputunits
     error = error + (handles.wordnetoutputerror(m) * handles.wordnetconn2_3(l,m));   
    end
    handles.wordnethiddenerror(l) = error * handles.wordnethiddenunits(l) * (1 - handles.wordnethiddenunits(l));
    totalerror = totalerror + abs(error);
   end
   
   % Update input layer to hidden layer connections
   for l = 1:handles.nrofwordnetinputunits
    for m = 1:handles.nrofwordnethiddenunits
     error = handles.wordnethiddenerror(m);   
     delta = handles.learningrate * error * handles.wordnetinputunits(l);
     handles.wordnetconn1_2(l,m) = handles.wordnetconn1_2(l,m) + delta;   
    end
   end
   
   % Update hidden layer to output layer connections
   for l = 1:handles.nrofwordnethiddenunits
    for m = 1:handles.nrofwordnetoutputunits
     error = handles.wordnetoutputerror(m);   
     delta = handles.learningrate * error * handles.wordnethiddenunits(l);   
     handles.wordnetconn2_3(l,m) = handles.wordnetconn2_3(l,m) + delta;   
    end
   end
  end
  totalerrorvector(i) = totalerror;
 end
 if handles.showlearninggraph == 1
   scatter(i,totalerrorvector(i), '.', 'k');
   pause(0.001);
   hold on;
 end
end 
disp ('Training complete')
guidata (gcbo, handles);

% ****************************** 6. RUN ***********************************
function radiobutton8_Callback(hObject, eventdata, handles)
% Run
handles.runhiddenlayerlistlength = 0;
wordreplistlength = 0;

% Start run
for i = 1:handles.nrofwords
 % Initialize the hidden layer
 for j = 1:handles.nrofwordnethiddenunits
  handles.wordnethiddenunits(j) = handles.wordnetinitfeedbackunits(j);
 end 
 handles.runhiddenlayerlistlength = handles.runhiddenlayerlistlength + 1;
 for k = 1:handles.nrofwordnethiddenunits
  handles.runhiddenlayerlist(handles.runhiddenlayerlistlength, k) = handles.wordnethiddenunits(k); 
 end
 
 % Get next word
 wordindex = i;
 currentword = handles.wordlist(wordindex);
 % Convert to character string
 currentword = char(currentword);
 currentwordlength = length(currentword); 
 
 % Step through the selected word one letter at a time
 for j = 2:currentwordlength
  currentletter = currentword(j);
  % Lookback
  currentlookback1 = currentword(j-1);
  % Get current letter rep
  currentletterindex = letterindex(currentletter);
  currentletterrep = handles.letterreplist(currentletterindex,:);
  % Get lookback rep
  currentlookbackindex = letterindex(currentlookback1);
  currentlookbackrep = handles.letterreplist(currentlookbackindex,:);
  
  % Load input units of layer 1
  for k = 1:handles.letterreplength 
   handles.wordnetinputunits(k) = currentletterrep(k);   
  end
  for k = 1:handles.letterreplength 
   handles.wordnetinputunits(handles.letterreplength + k) = currentlookbackrep(k);   
  end
  for k = 1:handles.nrofwordnethiddenunits
   handles.wordnetinputunits((handles.letterreplength * 2) + k) = handles.wordnethiddenunits(k);
  end
    
  % Propagate to hidden layer
  for k = 1:handles.nrofwordnethiddenunits
   sum = 0;
   for l = 1:handles.nrofwordnetinputunits
    sum = sum + (handles.wordnetinputunits(l) * handles.wordnetconn1_2(l,k));
   end
   handles.wordnethiddenunits(k) = sigmoid(sum);
  end
  
  % Record hidden layer
  handles.runhiddenlayerlistlength = handles.runhiddenlayerlistlength + 1;
  for k = 1:handles.nrofwordnethiddenunits
   handles.runhiddenlayerlist(handles.runhiddenlayerlistlength,k) = handles.wordnethiddenunits(k);
  end
 end
 wordreplistlength = wordreplistlength + 1;
 for k = 1:handles.nrofwordnethiddenunits
  wordreplist(wordreplistlength,k) = handles.wordnethiddenunits(k);
 end
end
dlmwrite('wordreps.txt',wordreplist, 'delimiter', '\t', 'precision','%.3f', 'newline', 'pc');
disp ('Run complete');
guidata (gcbo, handles);

% ***************************** 7. GRAPHICS *******************************

function radiobutton5_Callback(hObject, eventdata, handles)
% Select 2-D trajectory plot
set(handles.radiobutton6, 'enable', 'off');
% Reduce dimensionality of the state layer list for display: 2D
% Set up a plot window to display reduced-dimensionality state layers
figure;
axes;
axis ([-1 1 -1 1]);
axis equal;
ax = gca;  ax.Position = [0.1 0.1 0.8 0.8];
% Reduce dimensionality
[trainhiddenlayerlist2d, eigvect, eigval, variances] = pca(handles.runhiddenlayerlist, 0, 2);
% Plot reduced-dimensionality statelist
counter = 0;
for i = 1:handles.nrofwords
 currentword = handles.wordlist(i);
 currentword = char(currentword);
 currentwordlength = length(currentword);
 counter = counter + 1;
 vfrom = trainhiddenlayerlist2d(counter,:);
 scatter (vfrom(1), vfrom(2), 'b', '+');
 hold on
 for j = 2:currentwordlength
  counter = counter + 1;
  vto = trainhiddenlayerlist2d(counter,:);
  if j == currentwordlength
   scatter (vto(1), vto(2))
   text (vto(1), vto(2), currentword, 'FontSize', 12);
  else
   scatter (vto(1), vto(2), 'k', 'o');
  end
  line([vfrom(1) vto(1)], [vfrom(2) vto(2)], 'Color', 'k');
  hold on
  vfrom = vto;
  pause
 end
end

function radiobutton6_Callback(hObject, eventdata, handles)
% Select 3-D trajectory plot
set(handles.radiobutton5, 'enable', 'off');
guidata (gcbo, handles);
% Reduce dimensionality of the state layer list for display: 3D
% Set up a plot window to display reduced-dimensionality state layers
figure;
axes;
axis ([-1 1 -1 1 -1 1]);
axis equal;
ax = gca;
ax.Position = [0.1 0.1 0.8 0.8 0.8 0.8];
% Reduce dimensionality
[trainhiddenlayerlist3d, eigvect, eigval, variances] = pca(handles.runhiddenlayerlist, 0, 3);
% Plot reduced-dimensionality statelist
counter = 0;
for i = 1:handles.nrofwords
 currentword = handles.wordlist(i);
 currentword = char(currentword);
 currentwordlength = length(currentword);
 counter = counter + 1;
 vfrom = trainhiddenlayerlist3d(counter,:);
 scatter3 (vfrom(1), vfrom(2), vfrom(3), 'b', '+');
 hold on
 for j = 2:currentwordlength
  counter = counter + 1;
  vto = trainhiddenlayerlist3d(counter,:);
  if j == currentwordlength
   scatter3 (vto(1), vto(2), vto(3))
   text (vto(1), vto(2), vto(3), currentword, 'FontSize', 12);
  else
   scatter3 (vto(1), vto(2), vto(3), 'k', 'o');
  end
  line([vfrom(1) vto(1)], [vfrom(2) vto(2)], [vfrom(3) vto(3)], 'Color', 'k');
  vfrom = vto;
  hold on
  pause
 end
end

