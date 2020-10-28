function varargout = reynolds(varargin)
% REYNOLDS MATLAB code for reynolds.fig
%      REYNOLDS, by itself, creates a new REYNOLDS or raises the existing
%      singleton*.
%
%      H = REYNOLDS returns the handle to a new REYNOLDS or the handle to
%      the existing singleton*.
%
%      REYNOLDS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REYNOLDS.M with the given input arguments.
%
%      REYNOLDS('Property','Value',...) creates a new REYNOLDS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before reynolds_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to reynolds_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help reynolds

% Last Modified by GUIDE v2.5 28-Oct-2020 09:35:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @reynolds_OpeningFcn, ...
                   'gui_OutputFcn',  @reynolds_OutputFcn, ...
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


% --- Executes just before reynolds is made visible.
function reynolds_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to reynolds (see VARARGIN)

% Choose default command line output for reynolds
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes reynolds wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = reynolds_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function densidad_Callback(hObject, eventdata, handles)

% hObject    handle to densidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Escribir el valor de ro:
densidad=eval(get(handles.densidad , 'String'))
% Hints: get(hObject,'String') returns contents of densidad as text
%        str2double(get(hObject,'String')) returns contents of densidad as a double

function velocidad_Callback(hObject, eventdata, handles)
% hObject    handle to velocidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Escribir el valor de la velocidad
velocidad=eval(get(handles.velocidad , 'String'))
% Hints: get(hObject,'String') returns contents of velocidad as text
%        str2double(get(hObject,'String')) returns contents of velocidad as a double

function diametro_Callback(hObject, eventdata, handles)
% hObject    handle to diametro (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
diametro=eval(get(handles.diametro , 'String'))
% Hints: get(hObject,'String') returns contents of diametro as text
%        str2double(get(hObject,'String')) returns contents of diametro as a double


% --- Executes during object creation, after setting all properties.

function lo_Callback(hObject, eventdata, handles)
% hObject    handle to lo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of lo as text
%        str2double(get(hObject,'String')) returns contents of lo as a double
lo=eval(get(handles.lo,'String'))

function viscosidad_Callback(hObject, eventdata, handles)
% hObject    handle to viscosidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
viscosidad=eval(get(handles.viscosidad,'String'))
% Hints: get(hObject,'String') returns contents of viscosidad as text
%        str2double(get(hObject,'String')) returns contents of viscosidad as a double

function rugosidad_Callback(hObject, eventdata, handles)
% hObject    handle to rugosidad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
rugosidad=eval(get( handles.rugosidad,'String'))
% Hints: get(hObject,'String') returns contents of rugosidad as text
%        str2double(get(hObject,'String')) returns contents of rugosidad as a double


% --- Executes on button press in calcu.
function calcu_Callback(hObject, eventdata, handles)
% hObject    handle to calcu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Calculo del numero de Reynolds
densidad=eval(get(handles.densidad , 'String'));
velocidad=eval(get(handles.velocidad , 'String'));
diametro=eval(get(handles.diametro , 'String'));
viscosidad=eval(get(handles.viscosidad , 'String'));

Re=densidad*velocidad*diametro/viscosidad
% Despliegue de resultados:
set(handles.reynolds, 'String',Re);
if Re>4000;
    flujo='Turbulento'
else Re<2300;
    flujo='Laminar'
end
    set(handles.tipo_flujo, 'String',flujo);
    %Calculo del factor de friccion
    Re=densidad*velocidad*diametro/viscosidad;
    syms f
if Re<2300;
    f=64/Re
else Re>4000;
    solve(1/square(f)+2*log((rugosidad/diametro)/3.7+2.51/(Re*quare(f))),f)
end
lo=eval(get(handles.lo,'String'));
presion=f*lo/diametro*densidad*velocidad^2/2
set(handles.caida_presion, 'String',presion);
%Perdida de carga
hl=presion/(densidad*9.81)
set(handles.perdida_carga, 'String',hl);
% --- Executes on button press in limpiar.
function limpiar_Callback(hObject, eventdata, handles)
% hObject    handle to limpiar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
limpia ='';
set(handles.densidad,'String',limpia);
set(handles.velocidad,'String',limpia);
set(handles.viscosidad,'String',limpia);
set(handles.rugosidad,'String',limpia);
set(handles.diametro,'String',limpia);
set(handles.reynolds,'String',limpia);
set(handles.perdida_carga,'String',limpia);
set(handles.caida_presion,'String',limpia);
% --- Executes on button press in salir.
function salir_Callback(hObject, eventdata, handles)
% hObject    handle to salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcbf);
