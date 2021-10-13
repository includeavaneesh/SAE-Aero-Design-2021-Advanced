clc
clear
syms y
b=2.62; %wingspan(m)
v=13; %velocity(m/s)
Ne=0;
tc=0.128;
M=v/343;
a0=0.093;
LIFT_REQ=190;
mu=0.0000181;
k=0.8662961201;%2d lift slope curve
max_thick=0.306;
fspan=0.68;
Fuselagelift=17.21;
%Flushs  pan=0.14;
% percentage rectangular section should be between 0.4 to 0.7 of the total wingspan 
% taper is between 0.5 to 0.7
% root chord is between 0.5 to 0.65for aoa=0:0.1:5.3
% minimum tip chord length should be 0.3
aoa=4;
rect_sec=0.4;
        for TR=0.4:0.05:0.7
                Cr=0.63 ;
                Ct=TR*Cr;
                Rect_area=rect_sec*b*Cr;
                Cavg=(Cr+Ct)/2;
                
                
                
                Taper_area=(1-rect_sec)*b*Cavg;
                Wing_area= Rect_area + Taper_area;
                Aspect_ratio=(b^2)/Wing_area;
                x1=(rect_sec)*(b/2);
                x=(b/2)-x1;
                c2=Cr-((Cr-Ct)/x)*(y-x1);
                integral1=int(Cr^2,y,0,x1);
                integral2=int(c2^2,y,x1,(b/2));
                MAC=(2/Wing_area)*(integral1+integral2);
                F1=0.005*(1 +(1.5*((TR-0.6)^2)));
                phi=atan((Cr-Ct)/(2*b));
                phi_25=cos(phi); %*57.3
                e=(1/( (1+0.12*(M^6))*( 1+((0.142 + F1*Aspect_ratio*((10*tc)^0.33))/((phi_25)^2))+ ((0.1*(3*Ne+1))/((4+Aspect_ratio)^0.8)) ) ) );
                %LIFT3D=(a0/(1+((57.3*a0)/(3.14*e*Aspect_ratio))));
                %CL=((2*LIFT_REQ)/(1.225*v*v*Wing_area));
                %AOA_REQ=(CL/LIFT3D)-10.998;
                rc=( Wing_area/(b/2))-Ct;
                tp=Ct/rc;
                sweep=(((rc-Ct)/2)/(b/2));
                Mb=1-((13/343)^2);
                y1=((Aspect_ratio^2)*Mb)/k^2;
                x1=(sweep^2/Mb)+1;

                adeg=2*pi*Aspect_ratio/(2+sqrt((y1*x1)+4));

                a=adeg*pi/180;     
                CL=a*(11.1+aoa);
                ind_drag=((CL)^2)/(3.14*e*Aspect_ratio);
                Reno=(1.225*v*MAC)/mu;
             
                Skinfr_drag=0.074/((Reno)^0.2);
                Cre=((2*Wing_area)/b)-Ct;
                phi_m=(2*max_thick*(Cre-Ct))/b;
                FF=(1+((0.6/max_thick)*tc)+(100*((tc)^4)))*(1.34*((M)^0.8)*((cosd(phi_m)^0.28)));
                Swet=2*Wing_area*(1+(0.25*tc));
                Sref=Wing_area+(fspan*Cr);
                Cd0=(Swet/Sref)*Skinfr_drag;
                Cd=ind_drag+Cd0
                %Flusharea=Flushspan*Cr;
                %TotalLift=Fuselagelift + (0.5*1.225*v*v*(Wing_area-Flusharea)*CL);
                TotalDrag=0.5*1.225*v*v*Wing_area*Cd;
                liftproduced=103.5125*CL*Wing_area;
                TotalLift=liftproduced+Fuselagelift;
                LD=liftproduced/TotalDrag;
                if Ct>0
                    if TotalLift<190
                          X = sprintf('RecSec=%f Cr=%f Ct=%f AR=%f TR=%f Sw=%f L/D=%f e=%f cd=%f CL=%f sweep angle=%f MAC=%f',rect_sec,Cr,Ct,Aspect_ratio,TR,Wing_area,LD,e,Cd,CL,Cd0,MAC);
                            disp(X)
                        end
                end
        end
  
                %    end
               % end
           % end
            
