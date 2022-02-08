% Code to illustrate advection and diffusion from a Lagrangian perspective
% A constant background velocity field can be prescribed
% Sergio Maldonado
clear variables
close all
clc

%==================== Input data ==========================================

np = 100;                   % number of particles
it = 30;                    % no. of time steps
wait = 0.1;                 % time between frames (for animation)
r = 0.01;                   % length of random walk (proxy for diffusivity)
ow = false;                 % track particles' trajectory? 
% Background velocity field:
u = 0.0;                    % x component of velocity
v = 0.0;                    % y component of velocity
% Initial position of all particles:
x_ini = 0.5;                % x coordinate, values in range [0,1]
y_ini = 0.5;                % y coordinate, values in range [0,1]

%==========================================================================

% bluiding vector of coordinates
co_x = zeros(np,1);
co_y = zeros(np,1);

% For velocity field
[x,y] = meshgrid(0:0.1:1,0:0.1:1);
u_v = u*ones(size(x));
v_v = v*ones(size(y));

% Initial coordinates
for m=1:np
    co_x(m) = x_ini;
    co_y(m) = y_ini;
end

% Plot velocity field
quiver(x,y,u_v,v_v,0,'color','b')
hold on

% Time iteration
for i=1:it
    quiver(x,y,u_v,v_v,0,'color','b')
    hold on
    for m=1:np
        
        plot(co_x(m),co_y(m),'ok','MarkerFaceColor','k')
        hold on
        grid on
        xlim([0 1])
        ylim([0 1])   
    end
    title(['time step: ',num2str(i),'/',num2str(it),';  ',num2str(np),' particles'])
    xlabel('x')
    ylabel('y')
    
    % wait for user before starting animation
    if (i==1)
        disp('Press any key to start animation')
        pause
        elseif(i>1)
        pause(wait) 
    end
    
    % keep track of individual particles?
    if (ow)
        hold on
    else
        hold off
    end
    
    % new coordinates based on random walk
    for m=1:np
        walk = random('Uniform',0,2*pi);       
        co_x(m) = co_x(m) + u + r*cos(walk);
        co_y(m) = co_y(m) + v + r*sin(walk);
    end
    
end