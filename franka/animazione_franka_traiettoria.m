%    begin                : November 2020
%    authors              : Rachele Nebbia Colomba, Chiara Sammarco, Giorgio Simonini
%    copyright            : Dipartimento di Ingegneria dell`Informazione (DII) Universita´ di pisa    
%    email                : rachelenebbia <at> gmail <dot> com

%% Description: matlab script file to visualize animation of the placement task
%% data are acquired from the simulation file used to test the impedance control in tests_control_franka.slx 

%% Setup DH 
[DH, Convention] = Load_Franka_DH();
% movie parameters
movie_mode = 0;
k = 1;				% init of movie's frames counter
movie_fps = 40;		% movie frame per second
movie_title = 'Test';

%% Animation parameters
inc=0.05;
fps = movie_fps;
period=1/fps;

% Initialize parameters 
tprec=0;
index=1;
t = out.q.time;
sizet=size(t);
% initial joint angles 
q1 = out.q.Data(1, 1);
q2 = out.q.Data(2, 1);
q3 = out.q.Data(3, 1);
q4 = out.q.Data(4, 1);
q5 = out.q.Data(5, 1);
q6 = out.q.Data(6, 1);
q7 = out.q.Data(7, 1);
q = [q1 q2 q3 q4 q5 q6 q7 0];

%% Graphics
figh = figure('name', 'Franka');
% build robot model from links stl files 
link0 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link0_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link1 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link1_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link2 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link2_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link3 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link3_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link4 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link4_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link5 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link5_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link6 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link6_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');
link7 = patch(stlread('franka-gripper_urdf-2021-02-25/meshes/link7_mod.stl'),...
    'EdgeColor','none', 'FaceLighting','gouraud');

camlight('headlight');
material('dull');

%% Calculations of HGT from DH model --> chain 
chain = FramesChainFromDH(DH,q,Convention);
A0 = [  1 0 0 0; ...
        0 1 0 0; ...
        0 0 1 0; ...
        0 0 0 1];
A1 = chain(:,:,1);
A2 = chain(:,:,2);
A3 = chain(:,:,3);
A4 = chain(:,:,4);
A5 = chain(:,:,5);
A6 = chain(:,:,6);
A7 = chain(:,:,7);

%% tranform in HGT 
link0_T = hgtransform('Parent',gca);
set(link0_T,'Matrix', A0);
set(link0,'Parent', link0_T);
set(link0, 'facec', [255,255,255]./255);

link1_T = hgtransform('Parent',gca);
set(link1_T,'Matrix', A1);
set(link1,'Parent', link1_T);
set(link1, 'facec', [255,255,255]./255);

link2_T = hgtransform('Parent',gca);
set(link2_T,'Matrix', A2);
set(link2,'Parent', link2_T);
set(link2, 'facec', [255,255,255]./255);

link3_T = hgtransform('Parent',gca);
set(link3_T,'Matrix', A3);
set(link3,'Parent', link3_T);
set(link3, 'facec', [255,255,255]./255);

link4_T = hgtransform('Parent',gca);
set(link4_T,'Matrix', A4);
set(link4,'Parent', link4_T);
set(link4, 'facec', [255,255,255]./255);

link5_T = hgtransform('Parent',gca);
set(link5_T,'Matrix', A5);
set(link5,'Parent', link5_T);
set(link5, 'facec', [255,255,255]./255);

link6_T = hgtransform('Parent',gca);
set(link6_T,'Matrix', A6);
set(link6,'Parent', link6_T);
set(link6, 'facec', [255,255,255]./255);

link7_T = hgtransform('Parent',gca);
set(link7_T,'Matrix', A7);
set(link7,'Parent', link7_T);
set(link7, 'facec', [255,0,0]./255);

% plot config
View = [30 20];				% Initial plot view 
axis equal;
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
%hold on
view(View(1, 1), View(1, 2));

pause();

%% Start Loop for animation 
while index < sizet(1)
    %cla
    while t(index) < (tprec+period) 
        if index >= sizet(1)
            break 
        else
            index = index + 1;
        end
    end
    q1 = out.q.Data(1, index);
    q2 = out.q.Data(2, index);
    q3 = out.q.Data(3, index);
    q4 = out.q.Data(4, index);
    q5 = out.q.Data(5, index);
    q6 = out.q.Data(6, index);
    q7 = out.q.Data(7, index);
    q = [q1 q2 q3 q4 q5 q6 q7 0];
    
    chain = FramesChainFromDH(DH,q,Convention);
    A0 = [  1 0 0 0; ...
            0 1 0 0; ...
            0 0 1 0; ...
            0 0 0 1];
    A1 = chain(:,:,1);
    A2 = chain(:,:,2);
    A3 = chain(:,:,3);
    A4 = chain(:,:,4);
    A5 = chain(:,:,5);
    A6 = chain(:,:,6);
    A7 = chain(:,:,7);
    
    set(link0_T,'Matrix', A0);
    set(link0,'Parent', link0_T);

    set(link1_T,'Matrix', A1);
    set(link1,'Parent', link1_T);
    
    set(link2_T,'Matrix', A2);
    set(link2,'Parent', link2_T);

    set(link3_T,'Matrix', A3);
    set(link3,'Parent', link3_T);

    set(link4_T,'Matrix', A4);
    set(link4,'Parent', link4_T);

    set(link5_T,'Matrix', A5);
    set(link5,'Parent', link5_T);

    set(link6_T,'Matrix', A6);
    set(link6,'Parent', link6_T);

    set(link7_T,'Matrix', A7);
    set(link7,'Parent', link7_T);
    
    %update iteration step
    tprec=t(index); 
    drawnow;
    pause(period);
    index = index +1;
    
    % animation
    if movie_mode == 1
		movieVector(k) = getframe(figh);
    elseif movie_mode == 2
        movieVector(k) = getframe(figh, [10,10,1910,960]);
    end		
	k = k+1;
    
end

% movie generator
if movie_mode == 1
	movie = VideoWriter( movie_title, 'MPEG-4');
	movie.FrameRate = movie_fps;

	open(movie);
	writeVideo(movie, movieVector);
	close(movie);
	disp([movie_title ' saved!'])
end
    