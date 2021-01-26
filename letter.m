function varargout = letter(varargin)

% ******************************** 1. MATLAB HEADER ***********************
% LETTER M-file for letter.fig
%      LETTER, by itself, creates a new LETTER or raises the existing
%      singleton*.
%
%      H = LETTER returns the handle to a new LETTER or the handle to
%      the existing singleton*.
%
%      LETTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LETTER.M with the given input arguments.
%
%      LETTER('Property','Value',...) creates a new LETTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before letter_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to letter_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help letter

% Last Modified by GUIDE v2.5 11-Nov-2020 15:36:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @letter_OpeningFcn, ...
                   'gui_OutputFcn',  @letter_OutputFcn, ...
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


% --- Executes just before letter is made visible.
function letter_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to letter (see VARARGIN)

% Choose default command line output for letter
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes letter wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = letter_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% ***************************** 2. FUNCTIONS ******************************
function f = sigmoid(z) 
 f = 1 / (1 + exp(-z));
 
% **************************** 3. INITIALIZATION **************************

function radiobutton1_Callback(hObject, eventdata, handles)
% Initialize
handles.showgraph = 0;
guidata (gcbo, handles);

% ********************************* 4. INPUT ******************************

function radiobutton2_Callback(hObject, eventdata, handles)
% Load letter vectors
handles.lettercodes = importdata('lettercodes.txt');
% Find nr of vectors and vector length
[handles.nroflettercodes handles.lettercodelength] = size(handles.lettercodes);
% Load alphabet for use in plots
handles.letterlist = importdata('alphabet.txt');
% Echo to user interface
set (handles.edit1, 'string', int2str (handles.nroflettercodes));
set (handles.edit6, 'string', int2str (handles.lettercodelength));
% Set network parameters
handles.nrofletternetinputunits = handles.lettercodelength;
handles.nrofletternetoutputunits = handles.lettercodelength;
% Save
guidata (gcbo, handles);

function edit1_Callback(hObject, eventdata, handles)
function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
str = get (hObject, 'String');
handles.nrofletternethiddenunits = str2num (str);
guidata (gcbo, handles);

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
str = get (hObject, 'String');
handles.nrofiterations = str2num (str);
guidata (gcbo, handles);

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
str = get (hObject, 'String');
handles.nrofcycles = str2num (str);
guidata (gcbo, handles);

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
str = get (hObject, 'String');
handles.learningrate = str2num (str);
guidata (gcbo, handles);

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton3_Callback(hObject, eventdata, handles)
% Show learning error graph
handles.showgraph = 1;
guidata (gcbo, handles);

% ********************************* 5. TRAIN ******************************

function radiobutton6_Callback(hObject, eventdata, handles)
% Train letter network
if handles.showgraph == 1
 % Set figure parameters
 figure(1);
 axes('Position',[0.1,0.1,0.8,0.8]);
 xlim([1 handles.nrofiterations]);
 ylim([1 100]);
end

% Initialize layer1 - layer2 connections to random values
for i = 1:handles.nrofletternetinputunits
 for j = 1:handles.nrofletternethiddenunits
  handles.letternetconn1_2(i,j) = rand / 10;
 end
end

% Initialize layer2 - layer3 connections to random values
for i = 1:handles.nrofletternethiddenunits
 for j = 1:handles.nrofletternetoutputunits
  handles.letternetconn2_3(i,j) = rand / 10;
 end
end

% Initialize hidden layer list length
handles.trainhiddenlayerlistlength = 0;

%Start training
for i = 1:handles.nrofiterations
 % Initialize error counter
 totalerror = 0;   
 % Randomly select a vector
 index = randi(handles.nroflettercodes);
 % Get current input vector from letter code list
 for j = 1:handles.lettercodelength
  currentlettervector(j) = handles.lettercodes(index,j);
 end
 
 %Load vector into input layer
 for j = 1:handles.lettercodelength
  handles.letternetinputunits(j) = currentlettervector(j);
 end
  
 for j = 1:handles.nrofcycles
  % Propagate input activations to hidden units
  for k = 1:handles.nrofletternethiddenunits
   sum = 0;
   for l = 1:handles.nrofletternetinputunits
    sum = sum + (handles.letternetinputunits(l) * handles.letternetconn1_2(l,k));
   end
   handles.letternethiddenunits(k) = sigmoid(sum);
  end
  % Propagate hidden activations to output units
  for k = 1:handles.nrofletternetoutputunits
   sum = 0;
   for l = 1:handles.nrofletternethiddenunits
    sum = sum + (handles.letternethiddenunits(l) * handles.letternetconn2_3(l,k));
   end
   handles.letternetoutputunits(k) = sigmoid(sum);
  end
  
   % Get target output. This is the same as the input because the net is
   % autoassociative
  for j = 1:handles.lettercodelength
   handles.letternettargetoutput(j) = currentlettervector(j);
  end
  
  % Calculate output layer error relative to target output
  for k = 1:handles.nrofletternetoutputunits
   targetoutput = handles.letternettargetoutput(k);
   actualoutput = handles.letternetoutputunits(k);
   error = targetoutput - actualoutput;
   handles.letternetoutputerror(k) = error *(actualoutput * (1 - actualoutput));
   totalerror = totalerror + abs(error);
  end
  
  % Calculate hidden layer error
  for k = 1:handles.nrofletternethiddenunits
   actualoutput = handles.letternethiddenunits(k);
   error = 0;
   for l = 1:handles.nrofletternetoutputunits
    error = error + (handles.letternetoutputerror(l) * handles.letternetconn2_3(k,l));   
   end
   handles.letternethiddenerror(k) = error * actualoutput * (1 - actualoutput);
  end
  
  % Update input layer to hidden layer connections
  for k = 1:handles.nrofletternetinputunits
   for l = 1:handles.nrofletternethiddenunits
    error = handles.letternethiddenerror(l);   
    delta = handles.learningrate * error * handles.letternetinputunits(k);
    handles.letternetconn1_2(k,l) = handles.letternetconn1_2(k,l) + delta;   
   end
  end
  
  % Update hidden layer to output layer connections
  for k = 1:handles.nrofletternethiddenunits
   for l = 1:handles.nrofletternetoutputunits
    error = handles.letternetoutputerror(l);   
    delta = handles.learningrate * error * handles.letternethiddenunits(k);   
    handles.letternetconn2_3(k,l) = handles.letternetconn2_3(k,l) + delta;   
   end
  end
 end
 
 % Save hidden layer
 handles.trainhiddenlayerlistlength = handles.trainhiddenlayerlistlength + 1;
 for j = 1:handles.nrofletternethiddenunits
  handles.trainhiddenlayerlist(handles.trainhiddenlayerlistlength, j) = handles.letternethiddenunits(j);
 end
 if handles.showgraph == 1
  % Update total error vector
  scatter(i,totalerror, '.', 'k');
  pause(0.001);
  hold on;
 end
end
disp('Training complete');
guidata (gcbo, handles);

% ********************************** 6. RUN *******************************

function radiobutton7_Callback(hObject, eventdata, handles)
% Initialize hidden layer list length
handles.runhiddenlayerlistlength = 0;

% Generate letter representations
for i = 1:handles.nroflettercodes
 % Select next letter
 currentletter = handles.lettercodes(i,:);
 
 % Load input units of layer 1
 for k = 1:handles.nrofletternetinputunits 
  handles.letternetinputunits(k) = currentletter(k);   
 end
 % Propagate layer 1 to layer 2
 for k = 1:handles.nrofletternethiddenunits
  sum = 0;
  for l = 1:handles.nrofletternetinputunits
   sum = sum + (handles.letternetinputunits(l) * handles.letternetconn1_2(l,k));
  end
  handles.letternethiddenunits(k) = sigmoid(sum);
 end
 % Propagate layer 2 to layer 3
 for k = 1:handles.nrofletternetoutputunits
  sum = 0;
  for l = 1:handles.nrofletternethiddenunits
   sum = sum + (handles.letternethiddenunits(l) * handles.letternetconn2_3(l,k));
  end
  handles.letternetoutputunits(k) = sigmoid(sum);
 end
 % Save hidden layer
 for j = 1:handles.nrofletternethiddenunits
  handles.runhiddenlayerlist(i,j) = handles.letternethiddenunits(j);
 end
end
disp('Run complete')
% Write letter representations to file
dlmwrite('letterreps.txt',handles.runhiddenlayerlist, 'delimiter', '\t', 'precision','%.3f', 'newline', 'pc');
guidata (gcbo, handles);

% ***************************** 7. GRAPHICS *******************************

function radiobutton4_Callback(hObject, eventdata, handles)
% Select 2-D trajectory plot
set(handles.radiobutton5, 'enable', 'off');
% Plot trajectories
% Set up a plot window to display reduced-dimensionality state trajectories
figure;
axes;
axis ([-1 1 -1 1]);
axis equal;
ax = gca;
% Reduce dimensionality of training hidden layers
[hiddenlayerlist2d, eigvect, eigval, variances] = pca(handles.trainhiddenlayerlist, 0, 2);
% Plot all training hidden layers  
for i = 1:handles.nrofiterations
 v = hiddenlayerlist2d(i,:);
 scatter (v(1), v(2), 'k', '.');
 hold on
end
% Reduce dimensionality of test hidden layers
[testhiddenlayerlist2d, eigvect, eigval, variances] = pca(handles.runhiddenlayerlist, 0, 2);
% Plot test hidden laters and insert letter indices
for i = 1:handles.nroflettercodes
 v = testhiddenlayerlist2d(i,:);
 scatter (v(1), v(2), 'k', '.');
 text (v(1), v(2), handles.letterlist(i), 'FontSize', 14);
 hold on
end
guidata (gcbo, handles);

function radiobutton5_Callback(hObject, eventdata, handles)
% Select 3-D trajectory plot
set(handles.radiobutton4, 'enable', 'off');
% Set up a plot window to display reduced-dimensionality state trajectories
figure;
axes;
axis ([-1 1 -1 1 -1 1]);
axis equal;
ax = gca;
% Reduce dimensionality of training hidden layers
[hiddenlayerlist3d, eigvect, eigval, variances] = pca(handles.trainhiddenlayerlist, 0, 3);
% Plot all training hidden layers  
for i = 1:handles.nrofiterations
 v = hiddenlayerlist3d(i,:);
 scatter3 (v(1), v(2), v(3), 'k', '.');
 hold on
end
% Reduce dimensionality of test hidden layers
[testhiddenlayerlist3d, eigvect, eigval, variances] = pca(handles.runhiddenlayerlist, 0, 3);
% Insert letter indices into training hidden layer plot
for i = 1:handles.nroflettercodes
 v = testhiddenlayerlist3d(i,:);
 scatter3 (v(1), v(2), v(3));
 text (v(1), v(2), v(3), handles.letterlist(i), 'FontSize', 14);
 hold on
end
guidata (gcbo, handles);

% *************************************************************************

function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
