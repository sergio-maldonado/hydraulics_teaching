% Code to understand advection and diffusion from a Lagrangian perspective
% including 'turbulence' (turbulence is here modelled as completly random
% fluctuations for illustrative purposes)
% Sergio Maldonado
clear variables
close all
clc

%==================== Input data ==========================================

np = 100;                   % number of particles
it = 30;                    % no. of time steps
wait = 0.1;                 % time between frames (for animation)
r = 0.0;                   % length of random walk (proxy for diffusivity)
ow = 1;                     % overwrite? 0=no 1=yes
plot_vel = 1;               % plot velocity field? 0=no 1=yes
% Background velocity field:
u = 0.02;                   % x component of velocity
v = 0.0;                    % y component of velocity
up = 0.02;                   % max pseudo turbulent fluctuation in u
vp = 0.02;                   % max pseudo turbulent fluctuation in v
% Initial position of all particles:
x_ini = 0.0;                % x coordinate, [0,1]
y_ini = 0.5;                % y coordinate, [0,1]

%==========================================================================

% bluiding vector of coordinates
co_x = zeros(np,1);
co_y =zeros(np,1);

% For velocity field
[x,y] = meshgrid(0:0.1:1,0:0.1:1);


% Initial coordinates
for m=1:np
    co_x(m) = x_ini;
    co_y(m) = y_ini;
end

% Time iteration
for i=1:it
    
    % For velocity field:   
    u_v = u*ones(size(x)) + (-up + 2.*up.*rand(size(x)));
    v_v = v*ones(size(x)) + (-vp + 2.*vp.*rand(size(y)));
    
    if plot_vel == 1
        hold off
        quiver(x,y,u_v,v_v,0)
        hold on
    end
    
    for m=1:np
        
        plot(co_x(m),co_y(m),'ok','MarkerFaceColor','k')
        hold on
        grid on
        xlim([0 1])
        ylim([0 1])   
    end
    title(['time step: ',num2str(i),'/',num2str(it),'  ',num2str(np),' particles'])
    
    % wait for user before starting animation
    if (i==1)
        pause
        elseif(i>1)
        pause(wait) 
    end
    
    % overwrite particle trajectories?
    if (ow == 0)
        hold off
    else
        hold on
    end
    
    % new coordinates based on random walk
    for m=1:np
        walk = random('Uniform',0,2*pi);       
        co_x(m) = co_x(m) + (u + random('Uniform',-up,up)) + r*cos(walk);
        co_y(m) = co_y(m) + (v + random('Uniform',-vp,vp)) + r*sin(walk);
    end
    
end