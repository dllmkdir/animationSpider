function P = lug_des(a,b,gamma)
%Lugar deseado donde se quiere la pata del robot
    dx =10;
    dy=0;
    dz=-13;
    ry=3;
    rz=4;
    P=rotz(b-gamma)*[0;ry*cos(a);max(0,rz*sin(a))]+[dx;dy;dz];%Considerando gamma
end