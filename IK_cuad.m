function Theta=IK_cuad(Pd)
    %Cinemática inversde robot, requiere de un punto para dar valores
    %articulares
    L1=3; L2=6; L3=14;
    q1=atan2(Pd(2),Pd(1));
    c1=cos(q1);
    s1=sin(q1);
    s3=(L2^2+L3^2-Pd(3)^2-(c1*Pd(1)+s1*Pd(2)-L1)^2)/(2*L2*L3);
    if 1-s3^2<0
        disp('Punto inalcanzable.'); 
        s3=1;
    end
    
    q3=atan2(s3,sqrt(1-s3^2));
    c3=cos(q3);
    q2 = atan2(Pd(3),c1*Pd(1)+s1*Pd(2)-L1)-atan2(-L3*c3,L2-L3*s3);
    
    Theta =[q1 q2 q3];
end