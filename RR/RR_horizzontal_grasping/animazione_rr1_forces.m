%% setup
% movie parameters
movie_mode = 1;
line_graph = 1;
k = 1;				% init of movie's frames counter
movie_fps = 50;		% movie frame per second
movie_title = 'film_rr1_forces';

%% Animazione RR2
if(line_graph == 1)
    subplot(1,2,1);
end
%colors
arm_color = [0 0.4 0.6];
can_color = [0.7 0.2 0.7];
ee_color = [0.8 0 0];
table_color = [0.3 0.3 0.3];
inc=0.05;
fps=movie_fps;
period=1/fps;
figh = figure('name', 'RR');
figh.Position = [0 0 800 800];
xlim([-0.5 1.5]);
ylim([-0.5 1.5]);
hold off;
grid on
tprec=0;
index=1;
t = out.z_des.time;
sizet=size(t);

if(line_graph == 1)
    subplot(1,2,2);
    anim_line = animatedline('Color','r','LineWidth',2);
    y = out.f_ext.Data(:,2); 
    %axis([0,20,0,30])
end
pause();

while index < sizet(1)
    cla;
    while t(index) < (tprec+period) 
        if index >= sizet(1)
            break 
        else 
            index = index + 1;
        end
    end
    if(line_graph == 1)
        subplot(1,2,1);
    end
    title('RR grasping a can')
    %% Legend 
    %desired position
    r = 0.03;
    pos = [ -0.45 1.45-2*r 2*r 2*r];
    rectangle('Position',pos,'Curvature',[1 1], 'EdgeColor', 'g', 'LineWidth', 2);
    text(-0.45+2*r+0.05, 1.45-r, 'Desired Position');
    
    %real position before grasping
    pos = [-0.45 1.45-4*r-0.05 2*r 2*r];
    rectangle('Position',pos, 'EdgeColor',ee_color)
    text( -0.45+2*r+0.05, 1.45-3*r-0.05, 'Position')
    
    %real position after grasping
    pos = [-0.45 1.45-6*r-0.1 2*r 2*r];
    rectangle('Position', pos, 'EdgeColor',ee_color, 'FaceColor', ee_color)
    text(-0.45+2*r+0.05, 1.45-5*r-0.1, 'Position after Grasping')
    
    %object to grasp
    pos = [-0.45 1.45-6*r-0.15-0.2 0.1 0.2];
    rectangle('Position',pos,'Curvature',0.1, 'EdgeColor',can_color, 'LineWidth',4);
    text(-0.45+0.1+0.05, 1.45-6*r-0.15-0.1, 'Object to Grasp')
    
    %% Plot
    %table surface;
    pos = [-0.45 -0.15 1.9 0.05];
    rectangle('Position',pos ,'Curvature',0.1, 'EdgeColor',table_color, 'FaceColor',table_color, 'LineWidth',2);
    %line([-0.5 2],[-0.1 -0.1],'Color',[0.4 0.2 0],'LineWidth',5);
    % base
    pos1 = [-0.1 -0.1 0.2 0.15];
    rectangle('Position', pos1, 'EdgeColor', arm_color, 'FaceColor', arm_color); 
    %giuntino
    pos = [l1*cos(out.q.Data(index,1))-0.04 l1*sin(out.q.Data(index,1))-0.04 0.08 0.08];
    rectangle('Position',pos,'Curvature',[1 1],'EdgeColor', arm_color, 'FaceColor', arm_color)
    
    % arm
    line([0 l1*cos(out.q.Data(index,1))], [0 l1*sin(out.q.Data(index,1))],'Color',arm_color, 'LineWidth',10);
    line([l1*cos(out.q.Data(index,1)), l1*cos(out.q.Data(index,1))+l2*cos(out.q.Data(index,1)+out.q.Data(index,2))], [l1*sin(out.q.Data(index,1)), l1*sin(out.q.Data(index,1))+l2*sin(out.q.Data(index,1)+out.q.Data(index,2))],'Color',arm_color,'LineWidth',10);
    % before grasping
    if t(index) < 3
      pos = [1 -0.1 0.1 0.2];
      rectangle('Position',pos,'Curvature',0.1, 'EdgeColor',can_color, 'LineWidth',4);
      pos = [out.z.Data(index,1)-1.5*r out.z.Data(index,2)-1.5*r 2*1.5*r 2*1.5*r];
      rectangle('Position',pos, 'EdgeColor', ee_color, 'LineWidth', 2);
    % after grasping
    else
        pos = [out.z.Data(index,1) out.z.Data(index,2)-0.1 0.1 0.2];
        rectangle('Position', pos, 'Curvature', 0.1, 'EdgeColor', can_color, 'LineWidth',4);
        pos = [out.z.Data(index,1)-1.5*r out.z.Data(index,2)-1.5*r 2*1.5*r 2*1.5*r];
        rectangle('Position',pos, 'EdgeColor', ee_color, 'FaceColor',ee_color);
    end
    %desired position
    pos = [out.z_des.Data(index,1)-r out.z_des.Data(index,2)-r 2*r 2*r];
    rectangle('Position',pos,'Curvature',[1 1], 'EdgeColor', 'g', 'Linewidth', 2);
    
    if(line_graph == 1)
        subplot(1,2,2);
        addpoints(anim_line,t(index),y(index));
    end
    
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
    if movie_mode
        movie = VideoWriter( movie_title, 'MPEG-4');
        movie.FrameRate = movie_fps;

        open(movie);
        writeVideo(movie, movieVector);
        close(movie);
        disp([movie_title ' saved!'])
    end
end