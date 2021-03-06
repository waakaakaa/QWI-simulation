clear;clc;
h = 3.5e-9; % 阱宽
H = 7e-9; % 垒宽

length = 0.1e-9; %向量间隔

bx = 1;   % T.~Mei,"k值与红移"
by = 0;
wx = 0.71;
wy = 0.61;

N = 1; % 量子阱数目
offset = 0.6;
z = (-N*(H+h)/2):length:(N*(H+h)/2); % 定义域
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 0;
Ld_min = 0e-9;
Ld_length = 0.5e-9;
Ld_max = 10e-9;
Ld = Ld_min:Ld_length:Ld_max;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:((Ld_max-Ld_min)/Ld_length+1)
    CIn(i,:) = composition(length,h,H,bx,wx,N,Ld_min+(i-1)*Ld_length);
    CAs(i,:) = composition(length,h,H,by,wy,N,(Ld_min+(i-1)*Ld_length)*k);
    E(i,:) = potential(CIn(i,:),CAs(i,:));
    V_c(i,:) = Vc(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_hh(i,:) = Vhh(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_lh(i,:) = Vlh(length,h,H,CIn(i,:),CAs(i,:),N,offset);

    [vectc,valuec] = clevel(length,N,H,h,V_c(i,:)+E(i,round(N*(H+h)/2/length+1)),CIn(i,:),CAs(i,:));
    Ec(i,:) = sum(valuec);
    
    [vecthh,valuehh] = hhlevel(length,N,H,h,V_hh(i,:),CIn(i,:),CAs(i,:));
    Ehh(i,:) = sum(valuehh);
    
    [vectlh,valuelh] = lhlevel(length,N,H,h,V_lh(i,:),CIn(i,:),CAs(i,:));
    Elh(i,:) = sum(valuelh);
end
wavelengthhh(:,1) = 1./(Ec(:,1)+Ehh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthhh0 = 1./(Ec(1,1)+Ehh(1,1)) * 6.63e-34 * 3e8/1e-9;

wavelengthlh(:,1) = 1./(Ec(:,1)+Elh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthlh0 = 1./(Ec(1,1)+Elh(1,1)) * 6.63e-34 * 3e8/1e-9;

plot(Ld/1e-9,wavelengthhh-wavelengthhh0,'b-',Ld/1e-9,wavelengthlh-wavelengthlh0,'g-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 0.25;
Ld_min = 0e-9;
Ld_length = 0.5e-9;
Ld_max = 10e-9;
Ld = Ld_min:Ld_length:Ld_max;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:((Ld_max-Ld_min)/Ld_length+1)
    CIn(i,:) = composition(length,h,H,bx,wx,N,Ld_min+(i-1)*Ld_length);
    CAs(i,:) = composition(length,h,H,by,wy,N,(Ld_min+(i-1)*Ld_length)*k);
    E(i,:) = potential(CIn(i,:),CAs(i,:));
    V_c(i,:) = Vc(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_hh(i,:) = Vhh(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_lh(i,:) = Vlh(length,h,H,CIn(i,:),CAs(i,:),N,offset);

    [vectc,valuec] = clevel(length,N,H,h,V_c(i,:)+E(i,round(N*(H+h)/2/length+1)),CIn(i,:),CAs(i,:));
    Ec(i,:) = sum(valuec);
    
    [vecthh,valuehh] = hhlevel(length,N,H,h,V_hh(i,:),CIn(i,:),CAs(i,:));
    Ehh(i,:) = sum(valuehh);
    
    [vectlh,valuelh] = lhlevel(length,N,H,h,V_lh(i,:),CIn(i,:),CAs(i,:));
    Elh(i,:) = sum(valuelh);
end
wavelengthhh(:,1) = 1./(Ec(:,1)+Ehh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthhh0 = 1./(Ec(1,1)+Ehh(1,1)) * 6.63e-34 * 3e8/1e-9;

wavelengthlh(:,1) = 1./(Ec(:,1)+Elh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthlh0 = 1./(Ec(1,1)+Elh(1,1)) * 6.63e-34 * 3e8/1e-9;

plot(Ld/1e-9,wavelengthhh-wavelengthhh0,'b-',Ld/1e-9,wavelengthlh-wavelengthlh0,'g-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 0.35;
Ld_min = 0e-9;
Ld_length = 0.5e-9;
Ld_max = 10e-9;
Ld = Ld_min:Ld_length:Ld_max;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:((Ld_max-Ld_min)/Ld_length+1)
    CIn(i,:) = composition(length,h,H,bx,wx,N,Ld_min+(i-1)*Ld_length);
    CAs(i,:) = composition(length,h,H,by,wy,N,(Ld_min+(i-1)*Ld_length)*k);
    E(i,:) = potential(CIn(i,:),CAs(i,:));
    V_c(i,:) = Vc(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_hh(i,:) = Vhh(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_lh(i,:) = Vlh(length,h,H,CIn(i,:),CAs(i,:),N,offset);

    [vectc,valuec] = clevel(length,N,H,h,V_c(i,:)+E(i,round(N*(H+h)/2/length+1)),CIn(i,:),CAs(i,:));
    Ec(i,:) = sum(valuec);
    
    [vecthh,valuehh] = hhlevel(length,N,H,h,V_hh(i,:),CIn(i,:),CAs(i,:));
    Ehh(i,:) = sum(valuehh);
    
    [vectlh,valuelh] = lhlevel(length,N,H,h,V_lh(i,:),CIn(i,:),CAs(i,:));
    Elh(i,:) = sum(valuelh);
end
wavelengthhh(:,1) = 1./(Ec(:,1)+Ehh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthhh0 = 1./(Ec(1,1)+Ehh(1,1)) * 6.63e-34 * 3e8/1e-9;

wavelengthlh(:,1) = 1./(Ec(:,1)+Elh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthlh0 = 1./(Ec(1,1)+Elh(1,1)) * 6.63e-34 * 3e8/1e-9;

plot(Ld/1e-9,wavelengthhh-wavelengthhh0,'b-',Ld/1e-9,wavelengthlh-wavelengthlh0,'g-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 0.63;
Ld_min = 0e-9;
Ld_length = 0.5e-9;
Ld_max = 10e-9;
Ld = Ld_min:Ld_length:Ld_max;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:((Ld_max-Ld_min)/Ld_length+1)
    CIn(i,:) = composition(length,h,H,bx,wx,N,Ld_min+(i-1)*Ld_length);
    CAs(i,:) = composition(length,h,H,by,wy,N,(Ld_min+(i-1)*Ld_length)*k);
    E(i,:) = potential(CIn(i,:),CAs(i,:));
    V_c(i,:) = Vc(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_hh(i,:) = Vhh(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_lh(i,:) = Vlh(length,h,H,CIn(i,:),CAs(i,:),N,offset);

    [vectc,valuec] = clevel(length,N,H,h,V_c(i,:)+E(i,round(N*(H+h)/2/length+1)),CIn(i,:),CAs(i,:));
    Ec(i,:) = sum(valuec);
    
    [vecthh,valuehh] = hhlevel(length,N,H,h,V_hh(i,:),CIn(i,:),CAs(i,:));
    Ehh(i,:) = sum(valuehh);
    
    [vectlh,valuelh] = lhlevel(length,N,H,h,V_lh(i,:),CIn(i,:),CAs(i,:));
    Elh(i,:) = sum(valuelh);
end
wavelengthhh(:,1) = 1./(Ec(:,1)+Ehh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthhh0 = 1./(Ec(1,1)+Ehh(1,1)) * 6.63e-34 * 3e8/1e-9;

wavelengthlh(:,1) = 1./(Ec(:,1)+Elh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthlh0 = 1./(Ec(1,1)+Elh(1,1)) * 6.63e-34 * 3e8/1e-9;

plot(Ld/1e-9,wavelengthhh-wavelengthhh0,'b-',Ld/1e-9,wavelengthlh-wavelengthlh0,'g-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k = 1;
Ld_min = 0e-9;
Ld_length = 0.5e-9;
Ld_max = 10e-9;
Ld = Ld_min:Ld_length:Ld_max;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:((Ld_max-Ld_min)/Ld_length+1)
    CIn(i,:) = composition(length,h,H,bx,wx,N,Ld_min+(i-1)*Ld_length);
    CAs(i,:) = composition(length,h,H,by,wy,N,(Ld_min+(i-1)*Ld_length)*k);
    E(i,:) = potential(CIn(i,:),CAs(i,:));
    V_c(i,:) = Vc(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_hh(i,:) = Vhh(length,h,H,CIn(i,:),CAs(i,:),N,offset);
    V_lh(i,:) = Vlh(length,h,H,CIn(i,:),CAs(i,:),N,offset);

    [vectc,valuec] = clevel(length,N,H,h,V_c(i,:)+E(i,round(N*(H+h)/2/length+1)),CIn(i,:),CAs(i,:));
    Ec(i,:) = sum(valuec);
    
    [vecthh,valuehh] = hhlevel(length,N,H,h,V_hh(i,:),CIn(i,:),CAs(i,:));
    Ehh(i,:) = sum(valuehh);
    
    [vectlh,valuelh] = lhlevel(length,N,H,h,V_lh(i,:),CIn(i,:),CAs(i,:));
    Elh(i,:) = sum(valuelh);
end
wavelengthhh(:,1) = 1./(Ec(:,1)+Ehh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthhh0 = 1./(Ec(1,1)+Ehh(1,1)) * 6.63e-34 * 3e8/1e-9;

wavelengthlh(:,1) = 1./(Ec(:,1)+Elh(:,1)) * 6.63e-34 * 3e8/1e-9;
wavelengthlh0 = 1./(Ec(1,1)+Elh(1,1)) * 6.63e-34 * 3e8/1e-9;

plot(Ld/1e-9,wavelengthhh-wavelengthhh0,'b-',Ld/1e-9,wavelengthlh-wavelengthlh0,'g-');
hold on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
axis([0 10 -200 200]);
xlabel('Diffusion length L_{dIII} (nm)');
ylabel('Wavelength (nm)');