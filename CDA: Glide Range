% CDA Range and Duration Calculator
% version 2.0 
% UPDATE 1 --> Accuracy improved to 0.1 seconds
% UPDATE 2 --> L/D formula used to calculate the Range
clc
clear


L = input('Enter the Lift in Newtons: ');
D = input('Enter the Drag in Newtons: ');
A = input('Enter the Area of the wing: ');
Cd0 = input('Enter the CD0 of the plane: ');
H = input('Enter the Height of Dropping the CDA(meters): ');
V = 8; % initial velocity is always 8m/s
T = 0.1; % updated accuracy works at 0.1 secs accuracy
% Runtime is kept to be 20secs
cl = L/(0.6125*A*V^2);
cd = D/(0.6125*A*V^2);
v0 = V;  % initial velocity in the horizontal 
hv(1) = 8;
hs(1) = 0;
% Horizontal Analysis
for i=2:100
    v1 = v0 - ((0.6125*A*(v0^2)*cd)/0.255)*T;
    s1 = v0*T - 0.5*((0.6125*A*(v0^2)*cd)/0.255)*T^2;
    hv(i) = v1;
    hs(i) = s1;
    v0 = v1;
end
% Vertical Analysis
i = 1;
j = 1;
vv0 = 0; % initialising the vertical velocity
t = 0; % initialise time
H1 = H;
while H1>0
    vv1 = vv0 + (((0.6125*A*(hv(i)^2)*cl)-(2.5))/0.255)*(T);
    ss1 = vv0*T +  0.5*(((0.6125*A*(hv(i)^2)*cl)-(2.5))/0.255)*T^2;
    vv(i) = vv1; % storing the Vertical Velocity    
    hss(j) = ss1;
    i = i+1;
    j = j+1;
    vv0 = vv1;
    H1 = H1 + ss1;
    if H1<0
        H1=0;
    end
    disp(H1)
    t = t+T;
    if vv1>=sqrt(0.255*9.81*sqrt(8*Cd0)/(1.225*A))
        disp(t)
    end
end

% Calculation of the Range from L/D ratio
final_range = 0; % Initialising  the Range
for i = 1: (t/T) 
    vr = sqrt((hv(i))^2 + (vv(i))^2);
    LD = (2.55)/((6.5025/(A*1.255*vr^2)) + 0.5*A*1.255*Cd0*vr^2);
    if hss(i)>0
        Range = LD * (hss(i));
    else
        Range = -(LD * (hss(i)));
    end
    
    final_range = Range + final_range;
end
% Averaging the Range
d = final_range;
f = d * 3.281;
disp('The time of the glide is -->');
disp(t);
disp('The Range travelled (in meters)-->');
disp(d);
disp('The Range travelled (in feets) -->');
disp(f);
