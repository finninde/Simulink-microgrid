%%%%%%%%%%%%%%%%%
% Main function %
%%%%%%%%%%%%%%%%%

function gui_var_globales;

% Définition de handles comme variables globales dans chaque fonction et sous-fonction
% handles : identifiants des objets graphiques (vecteur)
global handles

% [1 1 0]yellow
% [1 0 1]magenta
% [0 1 1]cyan
% [1 0 0]red
% [0 1 0]green
% [0 0 1]blue
% [1 1 1]white
% [0 0 0]black

% Création de l'objet Figure
handles(1)=figure('units','pixels',...
    'position',[250 250 500 500],...
    'color',[1 1 1],... % White
    'numbertitle','off',...
    'name','[GUI] Utilisation des variables globales',...
    'menubar','none',...
    'tag','interface');

%% PARAMETERS

%Creation of the Global Box Parameters
handles(2)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0 0.3 0.25 0.7],...
    'string','',...    
    'BackgroundColor',[0.1 0.6 0.1 ],...
    'tag','text1');

%Creation of the title Parameters
handles(3)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0 0.97 0.25 0.03],...
    'string','Parameters',...    
    'BackgroundColor',[0.15 0.90 0.1 ],...
    'tag','text2');

% Création de l'objet Uicontrol Pushbutton Run
handles(4)=uicontrol('style','pushbutton',...
    'units','normalized',...
    'position',[0.07 0.85 0.1 0.05],...
    'string','Run',...    
    'callback',@run,...
    'tag','Run');

% Création de l'objet Uicontrol Popup menu Seasons
handles(5)=uicontrol('style','Popupmenu',...
    'units','normalized',...
    'position',[0.035 0.7 0.18 0.05],...
    'string','Monsoon|Intermediate|Winter');

% Création de l'objet Uicontrol Text T°C Outside
handles(6)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0 0.60 0.25 0.05],...
    'BackgroundColor',[0.15 0.90 0.1 ],...
    'string','T° Outside',...
    'tag','text3');

% Création de l'objet Uicontrol Text T°C Panel 
handles(7)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0 0.5 0.25 0.05],...
    'BackgroundColor',[0.15 0.90 0.1 ],...
    'string','T° Panel',...
    'tag','text4');


% Création de l'objet Uicontrol Popup menu Blocks
handles(8)=uicontrol('style','Popupmenu',...
    'units','normalized',...
    'position',[0.05 0.35 0.15 0.05],...
    'string','Block D|Block E|Block C|Block A|Block B|Block LH|Block RH');

% Création de l'objet Picture Bhutan
img = imread('Bhutan.jpg'); 

%% SUPERVISION

%Creation of the title Supervision
handles(9)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.25 0.97 0.75 0.03],...
    'string','Supervision',...    
    'BackgroundColor',[1 0 1],...
    'tag','text1');


%% POWER

%Creation of the Box Power
handles(10)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.25 0 0.37 0.94],...
    'string','',...    
    'BackgroundColor',[0.5 0.6 0.6],...
    'tag','text1');

%Creation of the title Power
handles(11)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.25 0.94 0.38 0.03],...
    'string','Power',...    
    'BackgroundColor',[0.15 0.90 0.1 ],...
    'tag','text2');
      
%Creation of the Box Production
handles(10)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.295 0.1 0.28 0.3],...
    'string','',...    
    'BackgroundColor',[1 1 1],...
    'tag','text3');

          
handles(10) = axes(...    % Axes for plotting the selected plot
                 'Parent', figure, ...
                 'Units', 'normalized', ...
                 'HandleVisibility','callback', ...
                 'Position',[0.295 0.1 0.28 0.3]);
             
%Creation of the Box Consumption
% handles(10)=uicontrol('style','text',...
%     'units','normalized',...
%     'position',[0.295 0.52 0.28 0.3],...
%     'string','',...    
%     'BackgroundColor',[1 1 1],...
%     'tag','text3');

%% STABILITY [x y width height]

%Creation of the Box Stability
handles(12)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.62 0 0.38 0.94],...
    'string','',...    
    'BackgroundColor',[0.6 0.2 0.6],...
    'tag','text1');

%Creation of the title Stability
handles(13)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.62 0.94 0.38 0.03],...
    'string','Stability',...    
    'BackgroundColor',[0.15 0.90 0.1 ],...
    'tag','text3');

%Creation of the Box Voltage
handles(10)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.665 0.68 0.3 0.2],...
    'string','',...    
    'BackgroundColor',[1 1 1],...
    'tag','text3');

%Creation of the Box Frequency
handles(10)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.665 0.38 0.3 0.2],...
    'string','',...    
    'BackgroundColor',[1 1 1],...
    'tag','text3');

%Creation of the Box SOC
handles(10)=uicontrol('style','text',...
    'units','normalized',...
    'position',[0.665 0.08 0.3 0.2],...
    'string','',...    
    'BackgroundColor',[1 1 1],...
    'tag','text3');
%% Functions in the parameters windows

 % Seasons
 
 
 Seasons=get(handles(5),'Value');
 elements = get(handles(5), 'String');

 switch Seasons
    case 1 % Monsoon
       
        set(handles(6),'string','T° Outside=26.8°C');
        set(handles(7),'string','T° Panel=40°C');
        
    case 2 % Intermediate
       
        set(handles(6),'string','T° Outside=17.4 °C');
        set(handles(7),'string','T° Panel=0°C');
        
    case 3 % Winter
      
        set(handles(6),'string','T° Outside=23.4 °C');
        set(handles(7),'string','T° Panel=0°C');
        
end 

% Blocks
 Blocks=get(handles(8),'Value');
 
 switch Blocks
    case 1 %D
       
      
        
    case 2 %E
       
        
        
    case 3 %C
      
        
        
    case 4 %A
       
       
      
    case 5 %B
       
        
        
    case 6 %LH
        
        
        
    case 7 %RH
       
       
        
        
    case 8 %All
       
            
end 
        
% Run
 Run=get(handles(4),'Value');
% run ('Regression_Rev_1');
