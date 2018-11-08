function plot_tray_compl(b,g,Up)
    %Mostrar trayectoria completa del recorrido de la i-ésima pata
    ux=Up(1);
    uy=Up(2);
    uz=Up(3);
    puntos=10;
    P=zeros(3,puntos+1);
    for i=1:puntos+1
        t=2*pi*i/puntos;
        P(:,i)=[ux;uy;uz]+rotz(g)*lug_des(t,b,g);
    end
    plot3(P(1,:),P(2,:),P(3,:),'r-');
    
    view(140,40)
    
end