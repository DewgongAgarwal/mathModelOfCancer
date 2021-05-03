%%
tspan = 0:0.01:500;

W0=0.30;
T0=0.40;
L0=0.30;

x0 = [W0; T0; L0];

betatw = 0.008;
betatl = 0.008;
betalw = 0.008;
betalt = 0.008;
betawt = 0.01;
betawl = 0.01;

alphatw = 0.5;
alphalw = 0.5;
alphawl = 0.5;
x1= [];
y1 =[];
c = [];

parms=[betatw; betatl; betalw; betalt; betawt; betawl; alphatw; alphalw; alphawl];
parms_optimal=[betatw; betatl; betalw; betalt; betawt; betawl; 1;1;0];

[~,X]=ode23(@(t,x) odefunFinal(t,x,parms),tspan,x0);
figure(1);
set(gcf,'color','white')
plot(tspan,X)
leg = legend('White Walkers', 'Targaryens', 'Lannisters');
set(gca,'fontsize',16)
xlabel('Time')
ylabel('Population')

% Optimal Strategy 

[~,X]=ode23(@(t,x) odefunFinal(t,x,parms_optimal),tspan,x0);
figure(2);
set(gcf,'color','white')
plot(tspan,X)
leg = legend('White Walkers', 'Targaryens', 'Lannisters');
set(gca,'fontsize',16)
xlabel('Time')
ylabel('Population')


% Potential Outcomes :
for i = 0:0.05:1
    for j = 0:0.05:(1-i) + 0.01
        x0 = [i;j; 1-i-j];
        [~,X]=ode23(@(t,x) odefunFinal(t,x,parms),tspan,x0);
        p = X(end, :);
        x1(end + 1) = i;
        y1(end + 1) = j;
        [maximum, index] = max(p, [], 'linear');
        c(end + 1) = index;
    end
end

map = [0 0 1
    1 0 0
    0 0 0];
figure(2);
scatter(x1',y1',10,c', 'filled')
hold on
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.b');
h(2) = plot(NaN,NaN,'.r');
h(3) = plot(NaN,NaN,'.k');
colormap(map)
xlim([0 1])
ylim([0 1])
hold off
xlabel('White Walker')
ylabel('Targaryens')
legend(h, 'White Walkers win', 'Targaryens win','Lannisters win');
% 
% 
for i = 0:0.05:1
    for j = 0:0.05:(1-i) + 0.01
        x0 = [i;j; 1-i-j];
        [~,X]=ode23(@(t,x) odefunFinal(t,x,parms_optimal),tspan,x0);
        p = X(end, :);
        x1(end + 1) = i;
        y1(end + 1) = j;
        [maximum, index] = max(p, [], 'linear');
        c(end + 1) = index;
    end
end

map = [0 0 1
    1 0 0
    0 0 0];
figure(3);
scatter(x1',y1',10,c','filled')
hold on
h = zeros(3, 1);
h(1) = plot(NaN,NaN,'.b');
h(2) = plot(NaN,NaN,'.r');
h(3) = plot(NaN,NaN,'.k');
colormap(map)
xlim([0 1])
ylim([0 1])
hold off
xlabel('White Walker')
ylabel('Targaryens')
legend(h, 'White Walkers win', 'Targaryens win','Lannisters win');