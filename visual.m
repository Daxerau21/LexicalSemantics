function varargout = visual(varargin)

%******************************** 1. MATLAB HEADER ************************
% VISUAL M-file for visual.fig
%      VISUAL, by itself, creates a new VISUAL or raises the existing
%      singleton*.
%
%      H = VISUAL returns the handle to a new VISUAL or the handle to
%      the existing singleton*.
%
%      VISUAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISUAL.M with the given input arguments.
%
%      VISUAL('Property','Value',...) creates a new VISUAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before visual_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to visual_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help visual

% Last Modified by GUIDE v2.5 11-Nov-2020 15:03:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @visual_OpeningFcn, ...
                   'gui_OutputFcn',  @visual_OutputFcn, ...
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


% --- Executes just before visual is made visible.
function visual_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to visual (see VARARGIN)

% Choose default command line output for visual
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes visual wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = visual_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% *****************************2. FUNCTIONS *******************************
function f = sigmoid(z) 
 f = 1 / (1 + exp(-z));
 
% **************************** 3. INITIALIZE ******************************

function radiobutton1_Callback(hObject, eventdata, handles)
% Initialize
handles.showgraph = 0;
handles.trajectories2d = 0;
handles.trajectories3d = 0;
guidata (gcbo, handles);

% ****************************** 4. INPUT *********************************

function radiobutton2_Callback(hObject, eventdata, handles)
% Load visual vectors
handles.visualcodes = importdata('visualcodes.txt');
% Find nr of vectors and vector length
[handles.nrofvisualcodes handles.visualcodelength] = size(handles.visualcodes);
% Load corresponding words for use as plot labels later
handles.wordlist = importdata('wordlist.txt');
% Find nr of vectors and vector length
[handles.nrofwords handles.wordlengthlength] = size(handles.wordlist);
% Set network parameters
handles.nrofvisualnetinputunits = handles.visualcodelength;
handles.nrofvisualnetoutputunits = handles.visualcodelength;
% Echo to user interface
set (handles.edit1, 'string', int2str (handles.nrofvisualcodes));
set (handles.edit2, 'string', int2str (handles.visualcodelength));
disp('Visual codes loaded');
% Save
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
% Get nr of hidden units from user interface
str = get (hObject, 'String');
handles.nrofvisualnethiddenunits = str2num (str);
% Save
guidata (gcbo, handles);

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% Get nr of iterations from user interface
str = get (hObject, 'String');
handles.nrofiterations = str2num (str);
% Save
guidata (gcbo, handles);

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% Get nr of cycles from user interface
str = get (hObject, 'String');
handles.nrofcycles = str2num (str);
% Save
guidata (gcbo, handles);

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% Get learning rate from user interface
str = get (hObject, 'String');
handles.learningrate = str2num (str);
% Save
guidata (gcbo, handles);

function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton3_Callback(hObject, eventdata, handles)
% Show learning error graph
handles.showgraph = 1;
guidata (gcbo, handles);

% ****************************** 5. TRAIN *********************************

function radiobutton6_Callback(hObject, eventdata, handles)
% Train
if handles.showgraph == 1
 figure(1);
 axes('Position',[0.1,0.1,0.8,0.8]);
 xlim([1 handles.nrofiterations]);
 ylim([1 100]);
end

% Initialize layer1-layer2 connections
for i = 1:handles.nrofvisualnetinputunits
 for j = 1:handles.nrofvisualnethiddenunits
  handles.visualnetconn1_2(i,j) = rand / 20;   
 end
end
% Initialize layer2-layer3 connections
for i = 1:handles.nrofvisualnethiddenunits
 for j = 1:handles.nrofvisualnetoutputunits
  handles.visualnetconn2_3(i,j) = rand / 20;   
 end
end

% Initialize hidden layer list
handles.trainhiddenlayerlistlength = 0;

%Start training
for i = 1:handles.nrofiterations
 handles.totalerror = 0;   
 % Randomly select a vector
 index = randi(handles.nrofvisualcodes);
 for j = 1:handles.visualcodelength
  currentvisualvector(j) = handles.visualcodes(index,j);
 end

 %Load vector into input layer
 for j = 1:handles.visualcodelength
  handles.visualnetinputunits(j) = currentvisualvector(j);
 end
  
 for j = 1:handles.nrofcycles
  % Propagate input activations to hidden units
  for k = 1:handles.nrofvisualnethiddenunits
   sum = 0;
   for l = 1:handles.nrofvisualnetinputunits
    sum = sum + (handles.visualnetinputunits(l) * handles.visualnetconn1_2(l,k));
   end
   handles.visualnethiddenunits(k) = sigmoid(sum);
  end
  % Propagate hidden activations to output units
  for k = 1:handles.nrofvisualnetoutputunits
   sum = 0;
   for l = 1:handles.nrofvisualnethiddenunits
    sum = sum + (handles.visualnethiddenunits(l) * handles.visualnetconn2_3(l,k));
   end
   handles.visualnetoutputunits(k) = sigmoid(sum);
  end
  
  % Save hidden layer
  handles.trainhiddenlayerlistlength = handles.trainhiddenlayerlistlength + 1;
  for j = 1:handles.nrofvisualnethiddenunits
   handles.trainhiddenlayerlist(handles.trainhiddenlayerlistlength, j) = handles.visualnethiddenunits(j);   
  end
  
  % Get target output = same as input because autoassociation
  for j = 1:handles.visualcodelength
   handles.visualnettargetoutput(j) = currentvisualvector(j);
  end
  
  % Calculate output layer error relative to target output
  for k = 1:handles.nrofvisualnetoutputunits
   targetoutput = handles.visualnettargetoutput(k);
   actualoutput = handles.visualnetoutputunits(k);
   error = targetoutput - actualoutput;
   handles.visualnetoutputerror(k) = error *(actualoutput * (1 - actualoutput));
   handles.totalerror = handles.totalerror + abs(error);
  end
  
  % Calculate hidden layer error
  for k = 1:handles.nrofvisualnethiddenunits
   actualoutput = handles.visualnethiddenunits(k);
   error = 0;
   for l = 1:handles.nrofvisualnetoutputunits
    error = error + (handles.visualnetoutputerror(l) * handles.visualnetconn2_3(k,l));   
   end
   handles.visualnethiddenerror(k) = error * actualoutput * (1 - actualoutput);
  end
  
  % Update input layer to hidden layer connections
  for k = 1:handles.nrofvisualnetinputunits
   for l = 1:handles.nrofvisualnethiddenunits
    error = handles.visualnethiddenerror(l);   
    delta = handles.learningrate * error * handles.visualnetinputunits(k);
    handles.visualnetconn1_2(k,l) = handles.visualnetconn1_2(k,l) + delta;   
   end
  end
  
  % Update hidden layer to output layer connections
  for k = 1:handles.nrofvisualnethiddenunits
   for l = 1:handles.nrofvisualnetoutputunits
    error = handles.visualnetoutputerror(l);   
    delta = handles.learningrate * error * handles.visualnethiddenunits(k);   
    handles.visualnetconn2_3(k,l) = handles.visualnetconn2_3(k,l) + delta;   
   end
  end
 end
 if handles.showgraph == 1
  % Update total error vector
  scatter(i,handles.totalerror, '.', 'k');
  pause(0.001);
  hold on
 end
end
disp('Training complete');
guidata (gcbo, handles);

% ******************************** 6. RUN *********************************

function radiobutton7_Callback(hObject, eventdata, handles)
% Run
for i = 1:handles.nrofvisualcodes
 % Select next visual
 currentvisual = handles.visualcodes(i,:);
 
 % Load input units of layer 1
 for j = 1:handles.nrofvisualnetinputunits 
  handles.visualnetinputunits(j) = currentvisual(j);   
 end
 
 % Propagate layer 1 to layer 2
 for j = 1:handles.nrofvisualnethiddenunits
  sum = 0;
  for k = 1:handles.nrofvisualnetinputunits
   sum = sum + (handles.visualnetinputunits(k) * handles.visualnetconn1_2(k,j));
  end
  handles.visualnethiddenunits(j) = sigmoid(sum);
 end
 
 % Save hidden layer
 for j = 1:handles.nrofvisualnethiddenunits
  handles.runhiddenlayerlist(i,j) = handles.visualnethiddenunits(j);
 end
end
disp('Run complete')
% Write visual representations to file
dlmwrite('visualreps.txt',handles.runhiddenlayerlist, 'delimiter', '\t', 'precision','%.3f', 'newline', 'pc');
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
for i = 1:handles.nrofvisualcodes
 v = testhiddenlayerlist2d(i,:);
 scatter (v(1), v(2), 'k', '.');
 text (v(1), v(2), handles.wordlist(i), 'FontSize', 12);
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
for i = 1:handles.nrofvisualcodes
 v = testhiddenlayerlist3d(i,:);
 scatter3 (v(1), v(2), v(3));
 text (v(1), v(2), v(3), handles.wordlist(i), 'FontSize', 12);
 hold on
end
guidata (gcbo, handles);
