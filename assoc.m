function varargout = assoc(varargin)
% ***************************** 1.MATLAB HEADER ***************************
% ASSOC M-file for assoc.fig
%      ASSOC, by itself, creates a new ASSOC or raises the existing
%      singleton*.
%
%      H = ASSOC returns the handle to a new ASSOC or the handle to
%      the existing singleton*.
%
%      ASSOC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSOC.M with the given input arguments.
%
%      ASSOC('Property','Value',...) creates a new ASSOC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assoc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assoc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assoc

% Last Modified by GUIDE v2.5 12-Nov-2020 08:25:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assoc_OpeningFcn, ...
                   'gui_OutputFcn',  @assoc_OutputFcn, ...
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


% --- Executes just before assoc is made visible.
function assoc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assoc (see VARARGIN)

% Choose default command line output for assoc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assoc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assoc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% ******************************* 2. FUNCTIONS ****************************
function f = sigmoid(z) 
 f = 1 / (1 + exp(-z));
 
% **************************** 3. INITIALIZATION **************************
function radiobutton1_Callback(hObject, eventdata, handles)
% Initialize
handles.showgraph = 0;
handles.trajectories2d = 0;
handles.trajectories3d = 0;
guidata (gcbo, handles);

% ********************************* 4. INPUT ******************************

function radiobutton2_Callback(hObject, eventdata, handles)
% Load word representations
handles.wordreplist = importdata ('wordreps.txt');
[handles.nrofwordreps handles.wordreplength] = size(handles.wordreplist);
% Load word list for use in plots
handles.wordlist = importdata ('wordlist.txt');
set (handles.edit1, 'string', int2str (handles.nrofwordreps));
set (handles.edit2, 'string', int2str (handles.wordreplength));
guidata (gcbo, handles);

function radiobutton3_Callback(hObject, eventdata, handles)
% Load visual reps
handles.visualreplist = importdata ('visualreps.txt');
[handles.nrofvisualreps handles.visualreplength] = size(handles.visualreplist);
set (handles.edit3, 'string', int2str (handles.nrofvisualreps));
set (handles.edit4, 'string', int2str (handles.visualreplength));
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
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit5_Callback(hObject, eventdata, handles)
% Nr of units
str = get (hObject, 'String');
handles.nrofassocnethiddenunits = str2num (str);
guidata (gcbo, handles);

function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
% Nr of iterations
str = get (hObject, 'String');
handles.nrofiterations = str2num (str);
guidata (gcbo, handles);

function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit7_Callback(hObject, eventdata, handles)
% Nr of cycles
str = get (hObject, 'String');
handles.nrofcycles = str2num (str);
guidata (gcbo, handles);

function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit8_Callback(hObject, eventdata, handles)
% Learning rate
str = get (hObject, 'String');
handles.learningrate = str2num (str);
guidata (gcbo, handles);

function edit8_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton4_Callback(hObject, eventdata, handles)
% Show learning error graph
handles.showgraph = 1;
guidata (gcbo, handles);

% ********************************* 5. TRAIN ******************************
function radiobutton7_Callback(hObject, eventdata, handles)
% Train
if handles.showgraph == 1
 figure(1);
 axes('Position',[0.1,0.1,0.8,0.8]);
 xlim([1 handles.nrofiterations]);
 ylim([1 30]);
 hold on;
end

% Initialize
handles.nrofassocnetinputunits = handles.wordreplength;
handles.nrofassocnetoutputunits = handles.visualreplength;

% Initialize assoc net connections
for i = 1:handles.nrofassocnetinputunits
 for j = 1:handles.nrofassocnethiddenunits
  handles.assocnetconn1_2(i,j) = rand/10;
 end
end
for i = 1:handles.nrofassocnethiddenunits
 for j = 1:handles.nrofassocnetoutputunits
  handles.assocnetconn2_3(i,j) = rand/10;
 end
end

handles.trainhiddenlayerlistlength = 0;

for i = 1:handles.nrofiterations
 % Randomly select the next string / visual pairing
 index = randi(handles.nrofwordreps);
 currentwordrep = handles.wordreplist(index,:);
 currentvisualrep = handles.visualreplist(index,:);
 totalerror = 0;
 
 % Load association net input units
 for j = 1:handles.nrofassocnetinputunits
  handles.assocnetinputunits(j) = currentwordrep(j);   
 end
 % Load target output
 for j = 1:handles.visualreplength
  target(j) = currentvisualrep(j);   
 end
 
 % Train
 for j = 1:handles.nrofcycles
  % Propagate input activations to hidden units
  for k = 1:handles.nrofassocnethiddenunits
   sum = 0;
   for l = 1:handles.nrofassocnetinputunits
    sum = sum + (handles.assocnetinputunits(l) * handles.assocnetconn1_2(l,k));
   end
   handles.assocnethiddenunits(k) = sigmoid(sum);
  end
  % Propagate hidden activations to output units
  for k = 1:handles.nrofassocnetoutputunits
   sum = 0;
   for l = 1:handles.nrofassocnethiddenunits
    sum = sum + (handles.assocnethiddenunits(l) * handles.assocnetconn2_3(l,k));
   end
   handles.assocnetoutputunits(k) = sigmoid(sum);
  end
  
  % Calculate output layer error relative to target output
  for k = 1:handles.nrofassocnetoutputunits
   targetoutput = target(k);
   actualoutput = handles.assocnetoutputunits(k);
   error = targetoutput - actualoutput;
   handles.assocnetoutputerror(k) = error *(actualoutput * (1 - actualoutput));
   totalerror = totalerror + abs(error);
  end
  
  % Calculate hidden layer error
  for k = 1:handles.nrofassocnethiddenunits
   actualoutput = handles.assocnethiddenunits(k);
   error = 0;
   for l = 1:handles.nrofassocnetoutputunits
    error = error + (handles.assocnetoutputerror(l) * handles.assocnetconn2_3(k,l));   
   end
   handles.assocnethiddenerror(k) = error * actualoutput * (1 - actualoutput);
  end
  
  % Update input layer to hidden layer connections
  for k = 1:handles.nrofassocnetinputunits
   for l = 1:handles.nrofassocnethiddenunits
    error = handles.assocnethiddenerror(l);   
    delta = handles.learningrate * error * handles.assocnetinputunits(k);
    handles.assocnetconn1_2(k,l) = handles.assocnetconn1_2(k,l) + delta;   
   end
  end
  
  % Update hidden layer to output layer connections
  for k = 1:handles.nrofassocnethiddenunits
   for l = 1:handles.nrofassocnetoutputunits
    error = handles.assocnetoutputerror(l);   
    delta = handles.learningrate * error * handles.assocnethiddenunits(k);   
    handles.assocnetconn2_3(k,l) = handles.assocnetconn2_3(k,l) + delta;   
   end
  end
 end
 % Save hidden layer
 handles.trainhiddenlayerlistlength = handles.trainhiddenlayerlistlength + 1;
 for j = 1:handles.nrofassocnethiddenunits
  handles.trainhiddenlayerlist(handles.trainhiddenlayerlistlength, j) = handles.assocnethiddenunits(j);
 end
 % Update training error graph
 if handles.showgraph == 1
  scatter(i,totalerror, '.', 'k');
  pause(0.001);
  hold on;
 end
end % end iterations
disp ('Training complete')
guidata (gcbo, handles);

% ********************************** 6. RUN *******************************
function radiobutton8_Callback(hObject, eventdata, handles)
% Run
% Unitialize
handles.runhiddenlayerlistlength = 0;
assocoutputlistlength = 0;

for i = 1:handles.nrofwordreps
 % Get next assoc
 currentwordrep = handles.wordreplist(i,:);
 
 % Load association net input units
 for j = 1:handles.nrofassocnetinputunits
  handles.assocnetinputunits(j) = currentwordrep(j);   
 end
 
 % Propagate layer 1 to layer 2
 for k = 1:handles.nrofassocnethiddenunits
  sum = 0;
  for j = 1:handles.nrofassocnetinputunits
   sum = sum + (handles.assocnetinputunits(j) * handles.assocnetconn1_2(j,k));
  end
  handles.assocnethiddenunits(k) = sigmoid(sum);
 end
 
 handles.runhiddenlayerlistlength = handles.runhiddenlayerlistlength + 1;
 for j = 1:handles.nrofassocnethiddenunits
  handles.runhiddenlayerlist(handles.runhiddenlayerlistlength,j) = handles.assocnethiddenunits(j);
 end
 
 % Propagate layer 2 to layer 3
 for k = 1:handles.nrofassocnetoutputunits
  sum = 0;
  for j = 1:handles.nrofassocnethiddenunits
   sum = sum + (handles.assocnethiddenunits(j) * handles.assocnetconn2_3(j,k));
  end
  handles.assocnetoutputunits(k) = sigmoid(sum);
 end
 
 assocoutputlistlength = assocoutputlistlength + 1;
 for j = 1:handles.nrofassocnetoutputunits
  assocoutputlist(assocoutputlistlength,j) = handles.assocnetoutputunits(j);
 end
end
dlmwrite('assocreps.txt',handles.runhiddenlayerlist, 'delimiter', '\t', 'precision','%.3f', 'newline', 'pc');
disp ('Complete');
guidata (gcbo, handles);

% ***************************** 7. GRAPHS *********************************

function radiobutton5_Callback(hObject, eventdata, handles)
% Select 2-D trajectory plot
set(handles.radiobutton6, 'enable', 'off');
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
% Plot test hidden laters and insert assoc indices
for i = 1:handles.nrofwordreps
 v = testhiddenlayerlist2d(i,:);
 scatter (v(1), v(2), 'k', '.');
 text (v(1), v(2), handles.wordlist(i), 'FontSize', 14);
 hold on
end
guidata (gcbo, handles);

function radiobutton6_Callback(hObject, eventdata, handles)
% Select 3-D trajectory plot
set(handles.radiobutton5, 'enable', 'off');
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
% Insert assoc indices into training hidden layer plot
for i = 1:handles.nrofwordreps
 v = testhiddenlayerlist3d(i,:);
 scatter3 (v(1), v(2), v(3));
 text (v(1), v(2), v(3), handles.wordlist(i), 'FontSize', 14);
 hold on
end
guidata (gcbo, handles);
