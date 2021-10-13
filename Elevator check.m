clc
clear all
Vmax = 30; % m/s
Sw=2; % m ˆ 2
Sh = 0.4662; % m ˆ 2
Vs = 10.8; %m/sec
Tmax= 40.034; %N
rho = 1.225; % kg/m ˆ 3
Cmo = -0.217;
zT = 0.0205; %m
CLa = 3.8684; %1/rad
CLah = 3.7245; % 1/rad
CLa_wf = CLa;
g = 9.81; %m/s ˆ 2
m = 18.3486; % kg
CLo = 0.9855;
taw = 0.53575;
etha_h = 1;
lh = 1.1625; % m from main landing gear
de_da = 0.5026;
CLdE=-CLah*etha_h*Sh*taw/Sw;
Cbar=0.561;
% Most aft cg
xcg = 0.075; % m from main landing gear
h_to_ho = -0.031/Cbar; % m
l_h1 = lh+xcg; %m
VH1 = (l_h1*Sh)/(Sw*Cbar);
CmdE1 = -CLah*etha_h*VH1*taw;
Cma1 = CLa_wf*h_to_ho-CLah*etha_h*Sh*(l_h1/Cbar)*(1-de_da)/Sw;
% Most forward cg
xcg = 0.106; % m from main landing gear
h_to_ho = 0/Cbar; % m
l_h2 = lh+xcg; % m
VH2 = (l_h2*Sh)/(Sw*Cbar);
CmdE2 = -CLah*etha_h*VH2*taw;
Cma2 = CLa_wf*h_to_ho-CLah*etha_h*Sh*(l_h2/Cbar)*(1-de_da)/Sw;
i =1;
for U1=Vs:Vmax;
    qbar=0.5*rho*U1^2;
    CL1= (m*g)/(qbar*Sw);
    f1=((Tmax*zT)/(qbar*Sw*Cbar))+Cmo;
    dE1(i)=-((f1*CLa)+(CL1-CLo)*Cma1)/(CLa*CmdE1-Cma1*CLdE);
    dE2(i)=-((f1*CLa)+(CL1-CLo)*Cma2)/(CLa*CmdE2-Cma2*CLdE);
    V(i)=U1;
    i=i+1;
end
plot(V,dE1*57.3,'--','color','#8a86aa','LineWidth',1.5)
hold on
plot(V,dE2*57.3,'--','color','#d1bbd4','LineWidth',1.5)
grid
xlabel ('Speed')
ylabel ('\delta_E (deg)')
legend('Most aft cg','Most forward cg')
