%%
tspan = 0:0.01:300;

W0= 150;
%P is normal people
P0 = 400;

x0 = [W0; P0];

betawp = 0.01;
betapw = 0.0075;
gammaw = 0.015;
gammap = 0.01;
x1= [];
y1 =[];
z1= [];
color = ['b','r'];
c = [];

parms=[betawp; betapw; gammaw;gammap];

[~,X]=ode23(@(t,x) ode2d(t,x,parms),tspan,x0);
figure(1);
set(gcf,'color','white')
plot(tspan,X)
leg = legend('White Walkers', 'People');
set(gca,'fontsize',16)
xlabel('Time')
ylabel('Population')

% %% Optimal Strategy 
% 
% [~,X]=ode23(@(t,x) odeoptimal(t,x,parms),tspan,x0);
% figure(2);
% set(gcf,'color','white')
% plot(tspan,X)
% leg = legend('White Walkers', 'Targaryens', 'Lannisters');
% set(gca,'fontsize',16)
% xlabel('Time')
% ylabel('Population')
% 
% 
% %% 2D
% x0= [W0; P0];
% [~,X]=ode23(@(t,x) ode2d(t,x,parms),tspan,x0);
% figure(3);
% set(gcf,'color','white')
% plot(tspan,X)
% leg = legend('White Walkers', 'Targaryens and Lannisters');
% set(gca,'fontsize',16)
% xlabel('Time')
% ylabel('Population')
%

%frontier

% x= linspace(0,250, 100);
% lambda2 = 0.5*(betawp + gammaw + gammap - sqrt((betawp - gammap + gammaw)*(betawp - gammap + gammaw) + 4*betawp*betapw));
% y= betawp* x / (gammap - lambda2);
% 
% 
% 
% 
% % Potential Outcomes:
% 
% 
%  for i = 0:50:500
%      for j = 0:50:500
%         x0 = [i;j];
%         [~,X]=ode23(@(t,x) ode2d(t,x,parms),tspan,x0);
%         p = X(end, :);
%         x1(end + 1) = i;
%         y1(end + 1) = j;
%         [maximum, index] = max(p, [], 'linear');
%          c(end + 1) = index; 
%      end
%  end
% map = [0 0 1
%     1 0 0];
% 
% 
% figure(4);
% scatter(x1',y1',10, c','filled')
% hold on
% plot(x,y,'g')
% h = zeros(3, 1);
% h(1) = plot(NaN,NaN,'.b');
% h(2) = plot(NaN,NaN,'.r');
% h(3) = plot(NaN,NaN,'-g');
% hold off
% colormap(map)
% xlim([0 500])
% ylim([0 500])
% legend(h, 'White Walkers win', 'People win','Frontier');
% xlabel('White Walker')
% ylabel('People')
% % 







%% Potential Outcomes:
% for i = 0:50:499
%     for j = 0:50:499
%         for k = 0:50:499
%             x0 = [i;j;k];
%             [~,X]=ode23(@(t,x) odefun(t,x,parms),tspan,x0);
%             p = X(end, :);
%             x1(end + 1) = i;
%             y1(end + 1) = j;
%             z1(end + 1) = k;
%             [maximum, index] = max(p, [], 'linear');
%             if index == 1
%                 c(end + 1) = 0;
%             elseif index == 2
%                 c(end + 1) = 100;
%             else
%                 c(end + 1) = 200;
%             end
%         end
%     end
% end

%figure(2);
%scatter3(x1',y1',z1',5,c')
%xlabel('White Walker')
%ylabel('Targaryen')
%zlabel('Lannister')


