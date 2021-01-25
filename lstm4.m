function varargout = lstm4(varargin)
% **************************** 1. MATLAB HEADER ***************************
% LSTM4 M-file for lstm4.fig
%      LSTM4, by itself, creates a new LSTM4 or raises the existing
%      singleton*.
%
%      H = LSTM4 returns the handle to a new LSTM4 or the handle to
%      the existing singleton*.
%
%      LSTM4('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LSTM4.M with the given input arguments.
%
%      LSTM4('Property','Value',...) creates a new LSTM4 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lstm4_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lstm4_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lstm4

% Last Modified by GUIDE v2.5 14-Nov-2020 06:48:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lstm4_OpeningFcn, ...
                   'gui_OutputFcn',  @lstm4_OutputFcn, ...
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

% --- Executes just before lstm4 is made visible.
function lstm4_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lstm4 (see VARARGIN)

% Choose default command line output for lstm4
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lstm4 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = lstm4_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% **************************** 2. FUNCTIONS *******************************
function f = sigmoid(z) 
 f = 1 / (1 + exp(-z));
 
function f = tanh(z)
 f = (2 / (1 + exp(-2*z))) - 1;
 
function f = letterindex(letter)
 if letter == '#'
  x = 27;
 else
  x = double(letter) - 96;
 end
 f = x;
 
% **************************** 3. INITIALIZATION **************************
function radiobutton22_Callback(hObject, eventdata, handles)
handles.showlearninggraph = 0;
handles.trajectories2d = 0;
handles.trajectories3d = 0;
guidata (gcbo, handles);

% ****************************** 4. INPUT *********************************
function radiobutton1_Callback(hObject, eventdata, handles)
% Load letter representations
handles.letterreps = importdata('letterreps.txt');
[handles.nrofletterreps handles.letterreplength] = size(handles.letterreps); 
set (handles.edit5, 'string', int2str (handles.nrofletterreps));
set (handles.edit6, 'string', int2str (handles.letterreplength));
disp('Letter reps loaded');
guidata (gcbo, handles);

function edit5_Callback(hObject, eventdata, handles)
function edit5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit6_Callback(hObject, eventdata, handles)
function edit6_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% String list
function radiobutton4_Callback(hObject, eventdata, handles)
% Load word list
handles.stringlist = importdata('lstmstrings.txt');
[handles.nrofstrings handles.stringlength] = size(handles.stringlist); 
set (handles.edit7, 'string', int2str (handles.nrofstrings));
disp('String list loaded');
guidata (gcbo, handles)

function edit7_Callback(hObject, eventdata, handles)
function edit7_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% PARAMETERS
function edit30_Callback(hObject, eventdata, handles)
str = get (hObject, 'String');
handles.nrofstateunits = str2num (str);
guidata (gcbo, handles);

function edit30_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit2_Callback(hObject, eventdata, handles)
% Learning rate
str = get (hObject, 'String');
handles.learningrate = str2num (str);
guidata (gcbo, handles);

function edit2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit3_Callback(hObject, eventdata, handles)
% Nr of cycles
str = get (hObject, 'String');
handles.nrofcycles = str2num (str);
guidata (gcbo, handles);

function edit3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit4_Callback(hObject, eventdata, handles)
% Nr of iterations
str = get (hObject, 'String');
handles.nrofiterations = str2num (str);
guidata (gcbo, handles);

function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function radiobutton15_Callback(hObject, eventdata, handles)
handles.showlearninggraph = 1;
guidata (gcbo, handles);

% ****************************** 5. TRAIN *********************************
function radiobutton2_Callback(hObject, eventdata, handles)

% Layer sizes
handles.nrofexternalinputunits = handles.letterreplength;
% handles.nrofstateunits from user input
handles.nroffeedbackunits = handles.nrofstateunits;
handles.nroflstmoutputunits = handles.nrofstateunits;
handles.nrofexternaloutputunits = handles.letterreplength;

% Initialize lstm input connections
for i = 1:handles.nrofexternalinputunits;
 for j = 1:handles.nrofstateunits
  handles.externalinputconn(i,j) = rand/10;  
 end
end
for i = 1:handles.nroffeedbackunits
 for j = 1:handles.nrofstateunits
  handles.externalfeedbackconn(i,j) = rand/10;  
 end
end

% Initialize input gate connections
for i = 1:handles.nrofexternalinputunits;
 for j = 1:handles.nrofstateunits

  handles.inputgateinputconn(i,j) = rand/10;  
 end
end
for i = 1:handles.nroffeedbackunits
 for j = 1:handles.nrofstateunits
  handles.inputgatefeedbackconn(i,j) = rand/10;  
 end
end

% Initialize output gate connections
for i = 1:handles.nrofexternalinputunits;
 for j = 1:handles.nrofstateunits
  handles.outputgateinputconn(i,j)= rand/10;  
 end
end
for i = 1:handles.nroffeedbackunits
 for j = 1:handles.nrofstateunits
  handles.outputgatefeedbackconn(i,j) = rand/10;  
 end
end

% Initialize forget gate connections
for i = 1:handles.nrofexternalinputunits;
 for j = 1:handles.nrofstateunits
  handles.forgetgateinputconn(i,j) = rand/10;  
 end
end
for i = 1:handles.nroffeedbackunits
 for j = 1:handles.nrofstateunits
  handles.forgetgatefeedbackconn(i,j) = rand/10; 
 end
end

% Initialize lstm to external output connections
for i = 1:handles.nroflstmoutputunits
 for j = 1:handles.nrofexternaloutputunits
  handles.externaloutputconn(i,j) = rand/10; 
 end
end

% Create initial state 
for i = 1:handles.nrofstateunits
 handles.stateinitial(i) = rand/10;
end

% Create initial feedback
for i = 1:handles.nroffeedbackunits
 handles.lstmoutinitial(i) = rand/10;
end

% Create learning graph 
if handles.showlearninggraph == 1
 figure(1); 
 axes('Position',[0.1,0.1,0.8,0.8]);
 xlim([1 handles.nrofiterations]);
 ylim([1 100]);
end

% Train net
for i = 1:handles.nrofiterations 
 totalerror = 0;
 
 % Select current word
 stringindex = randi(handles.nrofstrings);
 currentstring = handles.stringlist(stringindex);
  % Convert to character string
 currentstring = char(currentstring);
 currentstringlength = length(currentstring);
 
 % Initialize current state
 for j = 1:handles.nrofstateunits
  handles.currentstate(j) = handles.stateinitial(j);
 end
  
 % Initialize feedback
 for j = 1:handles.nroffeedbackunits
  handles.lstmout(j) = handles.lstmoutinitial(j);
 end
  
 for j = 1:handles.nrofcycles
  for k = 1:currentstringlength 
   currentletter = currentstring(k);
   currentletterindex = letterindex(currentletter);
   currentletterrep = handles.letterreps(currentletterindex,:);
   currenttarget = currentletterrep;
    
   % Run lstm external input
   % Load input
   for l = 1:handles.nrofexternalinputunits
    handles.externalinput(l) = currentletterrep(l);
   end
   % Load feedback
   for l = 1:handles.nroffeedbackunits
    handles.externalfeedback(l) = handles.lstmout(l);
   end
   % Run 
   for l = 1:handles.nrofstateunits
    sum = 0;
    for m = 1:handles.nrofexternalinputunits    
     sum = sum + (handles.externalinput(m) * handles.externalinputconn(m,l));
    end
    for m = 1:handles.nroffeedbackunits
     sum = sum + (handles.externalfeedback(m) * handles.externalfeedbackconn(m,l));
    end
    handles.externalinputout(l) = tanh(sum);
   end
  
   % Run input gate
   % Load input
   for l = 1:handles.nrofexternalinputunits
    handles.inputgateinput(l) = currentletterrep(l);
   end
   % Load feedback
   for l = 1:handles.nroffeedbackunits
    handles.inputgatefeedback(l) = handles.lstmout(l);
   end
   % Run 
   for l = 1:handles.nrofstateunits
    sum = 0;
    for m = 1:handles.nrofexternalinputunits    
     sum = sum + (handles.inputgateinput(m) * handles.inputgateinputconn(m,l));
    end
    for m = 1:handles.nroffeedbackunits
     sum = sum + (handles.inputgatefeedback(m) * handles.inputgatefeedbackconn(m,l));
    end
    handles.inputgateout(l) = sigmoid(sum);
   end
  
   % Run forget gate
   % Load input
   for l = 1:handles.nrofexternalinputunits 
    handles.forgetgateinput(l) = currentletterrep(l);
   end
   % Load feedback
   for l = 1:handles.nroffeedbackunits
    handles.forgetgatefeedback(l) = handles.lstmout(l);
   end
   % Run 
   for l = 1:handles.nrofstateunits
    sum = 0;
    for m = 1:handles.nrofexternalinputunits    
     sum = sum + (handles.forgetgateinput(m) * handles.forgetgateinputconn(m,l));
    end
    for m = 1:handles.nroffeedbackunits
     sum = sum + (handles.forgetgatefeedback(m) * handles.forgetgatefeedbackconn(m,l));
    end
    handles.forgetgateout(l) = sigmoid(sum);
   end

   % Update state
   % c[t] = z[t].i[t] + c[t-1].f[t]
   for l = 1:handles.nrofstateunits
    handles.currentstate(l) = (handles.externalinputout(l) .* handles.inputgateout(l)) + (handles.currentstate(l) .* handles.forgetgateout(l));
   end 
  
   % Run output gate
   % Load input
   for l = 1:handles.nrofexternaloutputunits
    handles.outputgateinput(l) = currentletterrep(l);
   end
   % Load feedback
   for l = 1:handles.nroffeedbackunits
    handles.outputgatefeedback(l) = handles.lstmout(l);
   end
   % Run 
   for l = 1:handles.nrofstateunits
    sum = 0;
    for m = 1:handles.nrofexternalinputunits    
     sum = sum + (handles.outputgateinput(m) * handles.outputgateinputconn(m,l));
    end
    for m = 1:handles.nroffeedbackunits
     sum = sum + (handles.outputgatefeedback(m) * handles.outputgatefeedbackconn(m,l));
    end
    handles.outputgateout(l) = sigmoid(sum);
   end
  
   % Apply output gate to state
   for l = 1:handles.nrofstateunits
    handles.lstmout(l) = tanh(handles.currentstate(l)) .* handles.outputgateout(l); 
   end
  
   % Generate the external output from the current state
   for l = 1:handles.nrofexternaloutputunits
    sum = 0;
    for m = 1:handles.nroflstmoutputunits
     sum = sum + (handles.lstmout(m) * handles.externaloutputconn(m,l));
    end
    handles.externalout(l) = sigmoid(sum);   
   end
  
   % BACKWARD PASS
   % Get external error vector
   for l = 1:handles.nrofexternaloutputunits
    targetoutput = currenttarget(l);
    actualoutput = handles.externalout(l);
    error = targetoutput - actualoutput;
    handles.outputerrorvector(l) = error *(actualoutput * (1 - actualoutput));
    totalerror = totalerror + abs(error);
   end
  
   % Get lstm error vector
   for l = 1:handles.nroflstmoutputunits
    error = 0;
    for m = 1:handles.nrofexternaloutputunits
     error = error + (handles.outputerrorvector(m) * handles.externaloutputconn(l,m));   
    end  
    handles.lstmerrorvector(l) = error * (handles.lstmout(l) * (1-handles.lstmout(l)));
   end
  
   % Update lstm to external output connections
   for l = 1:handles.nrofstateunits
    for m = 1:handles.nrofexternaloutputunits
     error = handles.outputerrorvector(m);  
     delta = handles.learningrate * error * handles.externalout(l);
     handles.externaloutputconn(l,m) = handles.externaloutputconn(l,m) + delta;
    end
   end
  
   % Update lstm connections
   % Output gate
   for l = 1:handles.nrofexternalinputunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.outputgateinput(l);
     handles.outputgateinputconn(l,m) = handles.outputgateinputconn(l,m) + delta;
    end
   end
   for l = 1:handles.nroffeedbackunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.outputgatefeedback(l);
     handles.outputgatefeedbackconn(l,m) = handles.outputgatefeedbackconn(l,m) + delta;
    end
   end
  
   % Forget gate
   for l = 1:handles.nrofexternalinputunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.forgetgateinput(l);
     handles.handles.forgetgateinputconn(l,m) = handles.forgetgateinputconn(l,m) + delta;
    end
   end
   for l = 1:handles.nroffeedbackunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.forgetgatefeedback(l);
     handles.forgetgatefeedbackconn(l,m) = handles.forgetgatefeedbackconn(l,m) + delta;
    end
   end
  
   % Input gate
   for l = 1:handles.nrofexternalinputunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.inputgateinput(l);
     handles.handles.inputgateinputconn(l,m) = handles.inputgateinputconn(l,m) + delta;
    end
   end
   for l = 1:handles.nroffeedbackunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.inputgatefeedback(l);
     handles.inputgatefeedbackconn(l,m) = handles.inputgatefeedbackconn(l,m) + delta;
    end
   end
  
   % Lstm external input
   for l = 1:handles.nrofexternalinputunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.externalout(l);
     handles.handles.externalinputconn(l,m) = handles.externalinputconn(l,m) + delta;
    end
   end
   for l = 1:handles.nroffeedbackunits
    for m = 1:handles.nrofstateunits
     error = handles.lstmerrorvector(m);
     delta = handles.learningrate * error * handles.externalfeedback(l);
     handles.externalfeedbackconn(l,m) = handles.externalfeedbackconn(l,m) + delta;
    end
   end
  end
 
  % Graph error
  if handles.showlearninggraph == 1
   scatter(i,totalerror, '.', 'k');
   pause(0.001);
   hold on;
  end
 end
end
disp ('Done');
guidata (gcbo, handles);

% ****************************** 6. RUN ***********************************
function radiobutton23_Callback(hObject, eventdata, handles)
handles.trajectories2d = 1;
guidata (gcbo, handles);

function radiobutton24_Callback(hObject, eventdata, handles)
handles.trajectories3d = 1;
guidata (gcbo, handles);

function radiobutton3_Callback(hObject, eventdata, handles)
% Save trajectory states
handles.teststatelistlength = 0;

% Run net
for i = 1:handles.nrofstrings
 %Initialize current state
 for j = 1:handles.nrofstateunits
  handles.currentstate(j) = handles.stateinitial(j);
 end
 handles.teststatelistlength = handles.teststatelistlength + 1;
 for k = 1:handles.nroflstmoutputunits
  handles.teststatelist(handles.teststatelistlength,k) = handles.currentstate(k);
 end
 
 % Initialize feedback
 for j = 1:handles.nroffeedbackunits
  handles.lstmout(j) = handles.lstmoutinitial(j);
 end
 
 % Select current word
 currentstring = handles.stringlist(i);
 % Convert to character string
 currentstring = char(currentstring);
 currentstringlength = length(currentstring);
 
 for j = 1:currentstringlength
  currentletter = currentstring (j);
  currentletterindex = letterindex(currentletter);
  currentletterrep = handles.letterreps(currentletterindex,:);
    
  % Run lstm external input
  % Load input
  for k = 1:handles.nrofexternalinputunits
   handles.externalinput(k) = currentletterrep(k);
  end
  % Load feedback
  for k = 1:handles.nroffeedbackunits
   handles.externalfeedback(k) = handles.lstmout(k);
  end
  % Run 
  for k = 1:handles.nrofstateunits
   sum = 0;
   for l = 1:handles.nrofexternalinputunits    
    sum = sum + (handles.externalinput(l) * handles.externalinputconn(l,k));
   end
   for l = 1:handles.nroffeedbackunits
    sum = sum + (handles.externalfeedback(l) * handles.externalfeedbackconn(l,k));
   end
   handles.externalinputout(k) = tanh(sum);
  end
  
  % Run input gate
  % Load input
  for k = 1:handles.nrofexternalinputunits
   handles.inputgateinput(k) = currentletterrep(k);
  end
  % Load feedback
  for k = 1:handles.nroffeedbackunits
   handles.inputgatefeedback(k) = handles.lstmout(k);
  end
  % Run 
  for k = 1:handles.nrofstateunits
   sum = 0;
   for l = 1:handles.nrofexternalinputunits    
    sum = sum + (handles.inputgateinput(l) * handles.inputgateinputconn(l,k));
   end
   for l = 1:handles.nroffeedbackunits
    sum = sum + (handles.inputgatefeedback(l) * handles.inputgatefeedbackconn(l,k));
   end
   handles.inputgateout(k) = sigmoid(sum);
  end
  
  % Run forget gate
  % Load input
  l = 0;
  for k = 1:handles.nrofexternalinputunits 
   handles.forgetgateinput(k) = currentletterrep(k);
  end
  % Load feedback
  for k = 1:handles.nroffeedbackunits
   handles.forgetgatefeedback(k) = handles.lstmout(k);
  end
  % Run 
  for k = 1:handles.nrofstateunits
   sum = 0;
   for l = 1:handles.nrofexternalinputunits    
    sum = sum + (handles.forgetgateinput(l) * handles.forgetgateinputconn(l,k));
   end
   for l = 1:handles.nroffeedbackunits
    sum = sum + (handles.forgetgatefeedback(l) * handles.forgetgatefeedbackconn(l,k));
   end
   handles.forgetgateout(k) = sigmoid(sum);
  end

  % Update state
  % c[t] = z[t].i[t] + c[t-1].f[t]
  for k = 1:handles.nrofstateunits
   handles.currentstate(k) = (handles.externalinputout(k) .* handles.inputgateout(k)) + (handles.currentstate(k) .* handles.forgetgateout(k));
  end 
  handles.teststatelistlength = handles.teststatelistlength + 1;
  for k = 1:handles.nrofstateunits
   handles.teststatelist(handles.teststatelistlength,k) = handles.currentstate(k);
  end
  
  % Run output gate
  % Load input
  for k = 1:handles.nrofexternaloutputunits
   handles.outputgateinput(k) = currentletterrep(k);
  end
  % Load feedback
  for k = 1:handles.nroffeedbackunits
   handles.outputgatefeedback(k) = handles.lstmout(k);
  end
  % Run 
  for k = 1:handles.nrofstateunits
   sum = 0;
   for l = 1:handles.nrofexternalinputunits    
    sum = sum + (handles.outputgateinput(l) * handles.outputgateinputconn(l,k));
   end
   for l = 1:handles.nroffeedbackunits
    sum = sum + (handles.outputgatefeedback(l) * handles.outputgatefeedbackconn(l,k));
   end
   handles.outputgateout(k) = sigmoid(sum);
  end
  
  % Apply output gate to state
  for k = 1:handles.nrofstateunits
   handles.lstmout(k) = tanh(handles.currentstate(k)) .* handles.outputgateout(k); 
  end
   
  % Generate the external output from the current state
  for k = 1:handles.nrofexternaloutputunits
   sum = 0;
   for l = 1:handles.nroflstmoutputunits
    sum = sum + (handles.lstmout(l) * handles.externaloutputconn(l,k));
   end
   handles.externalout(k) = sigmoid(sum);   
  end
 end
end

% Reduce dimensionality of the state layer list for display: 2D
if handles.trajectories2d == 1
 % Set up a plot window to display reduced-dimensionality state layers
 figure;
 axes;
 axis ([-1 1 -1 1]);
 axis equal;
 ax = gca;  ax.Position = [0.1 0.1 0.8 0.8];
  
% Reduce dimensionality
 [statelist2d, eigvect, eigval, variances] = pca(handles.teststatelist, 0, 2);
  
 % Plot reduced-dimensionality statelist
 counter = 0;
 for i = 1:handles.nrofstrings
  currentstring = handles.stringlist(i);
  currentstring = char(currentstring);
  currentstringlength = length(currentstring);
  counter = counter + 1;
  set (handles.edit31, 'string', int2str (counter));
  vfrom = statelist2d(counter,:);
  scatter (vfrom(1), vfrom(2), 'b', '+');
  hold on
  for j = 1:currentstringlength
   counter = counter + 1;
   set (handles.edit31, 'string', int2str (counter));
   vto = statelist2d(counter,:);
   if j == currentstringlength
    scatter (vto(1), vto(2))
    text (vto(1), vto(2), currentstring, 'FontSize', 12);
   else
    scatter (vto(1), vto(2), 'k', 'o');
   end
   line([vfrom(1) vto(1)], [vfrom(2) vto(2)], 'Color', 'k');
   hold on
   vfrom = vto;
   pause
  end
 end
end

% Reduce dimensionality of the state layer list for display: 3D
if handles.trajectories3d == 1
 % Set up a plot window to display reduced-dimensionality state layers
 figure;
 axes;
 axis ([-1 1 -1 1 -1 1]);
 axis equal;
 ax = gca;
 ax.Position = [0.1 0.1 0.8 0.8 0.8 0.8];
  
 % Reduce dimensionality
 [statelist3d, eigvect, eigval, variances] = pca(handles.teststatelist, 0, 3);
  
 % Plot reduced-dimensionality statelist
 counter = 0;
 for i = 1:handles.nrofstrings
  currentstring = handles.stringlist(i);
  currentstring = char(currentstring);
  currentstringlength = length(currentstring);
  counter = counter + 1;
  set (handles.edit31, 'string', int2str (counter));
  vfrom = statelist3d(counter,:);
  scatter3 (vfrom(1), vfrom(2), vfrom(3), 'b', '+');
  hold on
  for j = 1:currentstringlength
   counter = counter + 1;
   set (handles.edit31, 'string', int2str (counter));
   vto = statelist3d(counter,:);
   if j == currentstringlength
    scatter3 (vto(1), vto(2), vto(3))
    text (vto(1), vto(2), vto(3), currentstring, 'FontSize', 12);
   else
    scatter3 (vto(1), vto(2), vto(3), 'k', 'o');
   end
   line([vfrom(1) vto(1)], [vfrom(2) vto(2)], [vfrom(3) vto(3)], 'Color', 'k');
   vfrom = vto;
   hold on
   pause
  end
 end
end
dlmwrite('lstmstrreps.txt',handles.teststatelist, 'delimiter', '\t', 'precision','%.3f', 'newline', 'pc'); guidata (gcbo, handles);

%**************************************************************************
function edit31_Callback(hObject, eventdata, handles)
function edit31_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
