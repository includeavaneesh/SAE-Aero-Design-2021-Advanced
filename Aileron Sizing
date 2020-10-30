clc
clear all

S=1.401;%% wing area
C=0.561;%% wing chord length
Cr=0.63;
b=2.57; %% wingspan
b1=3.3;
hb=b/2;%% semispan
Stot=2.58;%% total  area
file_name = 'C:\Assailing falcons\Final\ailerongraph.xlsx';%%%LocationofExcelsheet
q=2;
Ixx=4.59209;%% moment of inertia
CLaw=3.8691;%% slope of the airfoil 
Vs=10.28;
fch=0.365;%distance beteen the fuselage centreline and the root of wings
fch1=0.879;%distance beteen the fuselage centreline and the start of the tapered section spanwise
                
CDR=0.7; %%Range is between 0.7-1.2
YD=1.65*0.4;%%The drag moment arm is assumed to be at 40% of the wing span
dA=0.3490658504; %%maximum deflectionclc



lamb=0.55;%taper ratio
syms Cac baib baob angle1
%%Cac representing chord_aileron/chord_wing
%%baib representing the inboard position of aileron 
%%baob representing the outboard position of aileron
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for angle1=1:1:45
    angle=angle1*0.0174533;
%for Cac=0.3:0.01:0.37
Cac=0.296791;
%for baib=0.6:0.01:0.8
baib=0.55;
baob=0.95;
b=2.57;
hb=b/2;
iy=(baib*hb)+fch;
oy=(baob*hb)+fch;
iyy=iy*iy;
iyyy=iyy*iy;
oyy=oy*oy;
oyyy=oyy*oy;
z121=(2/3)*((lamb-1)/b1);
z12=z121*(oyyy-iyyy);
z11=0.5*(oyy-iyy);
z122=(lamb-1)/(b1*2);
z13=z122*(oyy-iyy)*fch1;
z1=z11+z12+z13;
area=(baob-baib)*hb*Cac*C;

tw=1.129*(Cac)^0.4044-0.1772;

CldA=((2*CLaw*tw*Cr)/(S*b))*z1;

Cl=CldA*dA;
LA=(0.5)(1.225)(Vs^2)*S*Cl*b;
Pss=((2*LA)/(1.225*Stot*CDR*(YD^3)))^(0.5);
Bankangle=((Ixx)/(1.225*(YD^3)*Stot*CDR))*log((Pss^2));
Rollrate=(Pss^2)/(2*Bankangle);
t=((2*angle)/Rollrate)^(0.5);
Sas=area/S;
                            range_Cac(q,1) = angle1;
                            range_Baib(q,1) = t;                         
sheet = 1;
xlRange = 'A';
xlswrite(file_name, range_Cac,sheet,xlRange);
xlRange = 'B';
xlswrite(file_name, range_Baib,sheet,xlRange);
q=q+1;
end
disp('Process finished');
