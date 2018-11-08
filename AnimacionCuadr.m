function AnimacionCuadr(mov,tf,af)
    t0=0;
    delta_t=0.1;
    a0=pi/2;
    if(t0>=tf)
        disp('Parámetros inválidos'); 
        return;
    end
    if(a0>=af)
        disp('Parámetros inválidos'); 
        return;
    end
    
    if(strcmp(mov,'forward'))
       beta=ones(1,4)*0; 
    elseif(strcmp(mov,'backward'))
       beta=ones(1,4)*pi;
    elseif(strcmp(mov,'left'))
       beta=ones(1,4)*pi/2;
    elseif(strcmp(mov,'right'))
       beta=ones(1,4)*pi*3/2;
    elseif(strcmp(mov,'rotatecw') || strcmp(mov,'rotateccw'))
       beta=[pi/4,-pi/4,-3*pi/4,3*pi/4];
    end
    gamma=[pi/4,-pi/4,-3*pi/4,3*pi/4];
    U=zeros(3,5);
    for i=1:1:4
       U(:,i)=rotz(gamma(i))*[5;0;0];
    end
    U(:,5)=U(:,1);
    Pd=zeros(3,4);
    Theta=zeros(3,4);
    for t=t0:delta_t:tf
        if(strcmp(mov,'rotatecw'))
            w=(t-t0)/(tf-t0);
        else
            w=-(t-t0)/(tf-t0);
        end
        
        alfa=(af-a0)*w+a0;
        alfa2=(af-a0)*w+a0+pi;
        trplot(eye(4),'frame','0','color','k');
        axis([-20 20 -20 15 -17 15]);
        hold on
        for i=1:1:4
            if(mod(i,2)==0)
                Pd(:,i)=lug_des(alfa,beta(i),gamma(i));
            else
                Pd(:,i)=lug_des(alfa2,beta(i),gamma(i));
            end
            Theta(:,i)=IK_cuad(Pd(:,i));
            gen_trayect(Theta(:,i),gamma(i),U(:,i));
        end
        
        plot3(U(1,:),U(2,:),U(3,:),'g-');  
        for i=1:1:4
            plot_tray_compl(beta(i),gamma(i),U(:,i));
        end


        drawnow
        hold off
    end
end
        