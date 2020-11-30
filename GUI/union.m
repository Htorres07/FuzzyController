function varargout = union(varargin)
% UNION MATLAB code for union.fig
%      UNION, by itself, creates a new UNION or raises the existing
%      singleton*.
%
%      H = UNION returns the handle to a new UNION or the handle to
%      the existing singleton*.
%
%      UNION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNION.M with the given input arguments.
%
%      UNION('Property','Value',...) creates a new UNION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before union_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to union_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to desired_value (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help union

% Last Modified by GUIDE v2.5 06-Nov-2020 19:44:33

% Begin initialization code - DO NOT EDIT



gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @union_OpeningFcn, ...
                   'gui_OutputFcn',  @union_OutputFcn, ...
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


% --- Executes just before union is made visible.
function union_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to union (see VARARGIN)

% Choose default command line output for union
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes union wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.uipanel3, 'visible', 'off')
set(handles.uipanel5,'visible', 'off')

% --- Outputs from this function are returned to the command line.
function varargout = union_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in desired_value.
function desired_value_Callback(hObject, eventdata, handles)
% hObject    handle to desired_value (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fid=fopen('filena2.txt','r');
datos=fscanf(fid, '%f', [5 inf]);
fclose(fid);
t=datos(1,:); 
r=datos(2,:);
y=datos(3,:);
axes(handles.axes1);
plot(t,r,t,y);
set(legend('$r[rad]$','$\theta[rad]$','$e[rad]$','$u[V]$'), 'interpreter', 'latex')
xlabel('$t[s]$', 'interpreter', 'latex')
grid on;

% % load_system('fuzzy5');
% % 
% % a = sim('fuzzy5','SimulationMode','normal');
% % b = a.get('simout');
% % c = a.get('simout1');
% % assignin('base','b',b);
% % assignin('base','c',c);
% % % %figure;
% % % 
% % plot(b)
% % %plot(simout.time,simout.data)
% % %title('a)')
% % %plot(t,r,t,y,t,e,t,u);
% % set(legend('$y$','$y^*$'), 'interpreter', 'latex')
% % xlabel('$t[s]$', 'interpreter', 'latex')
% % ylabel('$rad$', 'interpreter', 'latex')
% % grid on;



% --- Executes on button press in error_graph.
function error_graph_Callback(hObject, eventdata, handles)
% hObject    handle to error_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load_system('fuzzy5');
%set_param('fuzzy5','SimulationCommand','start');
a = sim('fuzzy5','SimulationMode','normal');
b = a.get('simout');
c = a.get('simout1');
assignin('base','b',b);
assignin('base','c',c);
%axes(handle.axes1);
plot(c)
%plot(t,r,t,y,t,e,t,u);
set(legend('$u[V]$','$e[rad]$'), 'interpreter', 'latex')
xlabel('$t[s]$', 'interpreter', 'latex')
grid on;


% --- Executes on button press in Control_signal.
function Control_signal_Callback(hObject, eventdata, handles)
% hObject    handle to Control_signal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fid=fopen('filena2.txt','r');
datos=fscanf(fid, '%f', [5 inf]);
fclose(fid);
t=datos(1,:); 
u=datos(4,:);
axes(handles.axes1);
plot(t,u);
%set(legend('$u[V]$'), 'interpreter', 'latex')
xlabel('$t[s]$', 'interpreter', 'latex')
ylabel('$u[V]$', 'interpreter', 'latex')
ylim([-6 11])
grid on;



% --- Executes on button press in error_signal.
function error_signal_Callback(hObject, eventdata, handles)
% hObject    handle to error_signal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

fid=fopen('filena2.txt','r');
datos=fscanf(fid, '%f', [5 inf]);
fclose(fid);
t=datos(1,:); 
e=datos(5,:);
axes(handles.axes1);
plot(t,e);
%set(legend('$u[V]$'), 'interpreter', 'latex')
xlabel('$t[s]$', 'interpreter', 'latex')
ylabel('$e[Radians]$', 'interpreter', 'latex')
grid on;


% --- Executes on button press in behavior.
function behavior_Callback(hObject, eventdata, handles)
% hObject    handle to behavior (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel3, 'visible', 'on')
set(handles.uipanel5, 'visible', 'off')

% --- Executes on button press in fuzzylogic.
function fuzzylogic_Callback(hObject, eventdata, handles)
set(handles.uipanel3, 'visible', 'off')
set(handles.uipanel5, 'visible', 'on')
set(handles.uipanel6, 'visible', 'off')
set(handles.uipanel7, 'visible', 'off')
% hObject    handle to fuzzylogic (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in membererror.
function membererror_Callback(hObject, eventdata, handles)
% hObject    handle to membererror (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel6, 'visible', 'on')
set(handles.uipanel7, 'visible', 'off')
fis = readfis('fuzzydoctorado5');
axes(handles.axes2);
plotmf(fis,'input',1)
%plot(t,r,t,y);
%set(legend('$r[rad]$','$\theta[rad]$','$e[rad]$','$u[V]$'), 'interpreter', 'latex')
xlabel('Error')
grid on;

% --- Executes on button press in memberweight.
function memberweight_Callback(hObject, eventdata, handles)
% hObject    handle to memberweight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel6, 'visible', 'on')
set(handles.uipanel7, 'visible', 'off')
fis = readfis('fuzzydoctorado5');
axes(handles.axes2);
plotmf(fis,'input',2)
%plot(t,r,t,y);
%set(legend('$r[rad]$','$\theta[rad]$','$e[rad]$','$u[V]$'), 'interpreter', 'latex')
xlabel('Weight')
grid on;

% --- Executes on button press in Memberoutput.
function Memberoutput_Callback(hObject, eventdata, handles)
% hObject    handle to Memberoutput (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel6, 'visible', 'on')
set(handles.uipanel7, 'visible', 'off')
fis = readfis('fuzzydoctorado5');
axes(handles.axes2);
plotmf(fis,'output',1)
grid on;

% --- Executes on button press in rules.
function rules_Callback(hObject, eventdata, handles)
% hObject    handle to rules (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.uipanel6, 'visible', 'on')
set(handles.uipanel7, 'visible', 'on')
fis= readfis('fuzzydoctorado5');
b=showrule(fis)
for i=1:15
   c(i,1)={b(i,:)}; 
   %set(handles.uitable3, 'Data', c)
end
c
set(handles.uitable1, 'Data', c)
