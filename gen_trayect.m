function gen_trayect(Theta,gamma,Up)
%Generación de trayectorias para pata del robot
    ux=Up(1);
    uy=Up(2);
    uz=Up(3);
    L1=3; L2=6; L3=14;
    U=[rotz(gamma) [ux;uy;uz];0 0 0 1];
    T{1}=MatranH(Theta(1), 0, 0, 0);
    T{2}=MatranH(Theta(2), 0, pi/2, L1);
    T{3}=MatranH(Theta(3), 0, pi, L2);
    T{4}=[eye(3),[0;L3;0];0 0 0 1];
    
    O=[0;0;0;1];
    T0i=U*eye(4);
    P=cell(1,4);
    for i=1:4
        T0i=T0i*T{i};
        P{i}=T0i*O;
    end
    Xp=[O,[P{1:4}]];
    plot3(Xp(1,3:end),Xp(2,3:end),Xp(3,3:end),'r*', ...
            Xp(1,2),Xp(2,2),Xp(3,2),'g*', ...
            Xp(1,2:end),Xp(2,2:end),Xp(3,2:end),'b-');
    
end