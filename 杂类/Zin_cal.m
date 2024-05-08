f_kai=[202.5e6 252.5e6 226.5e6 278.5e6];
f_duan=[252e6 301e6 343e6 485e6];
f_un=[543e6 596e6 622e6 668e6];
z=1;
Beta1=2*pi*f_kai*1.5/3e8;
Beta2=2*pi*f_duan*1.5/3e8;
Beta3=2*pi*f_un*1.5/3e8;
Zc=50;
zl=[34.06+1i*7.15 34.41+1i*7.8 34.64+1i*8.08 35.04+1i*8.64];
zL1=34.06+1i*7.15;
zL2=34.41+1i*7.8;
zL3=34.64+1i*8.08;
zL4=35.04+1i*8.64;
% z_in=(Zc*(zL+1i*Zc*tan(Beta*z)))/(Zc+1i*zL*tan(Beta*z))
%% 计算开路线的阻抗
z_in_kai=-1i*Zc*cot(Beta1*z);

%% 计算短路线的阻抗

z_in_duan=1i*Zc*tan(Beta2*z);

%% 计算不匹配负载阻抗
z_in1=(Zc*(zL1+1i*Zc*tan(Beta3(1)*z)))/(Zc+1i*zL1*tan(Beta3(1)*z))
z_in2=(Zc*(zL2+1i*Zc*tan(Beta3(2)*z)))/(Zc+1i*zL2*tan(Beta3(2)*z))
z_in3=(Zc*(zL3+1i*Zc*tan(Beta3(3)*z)))/(Zc+1i*zL3*tan(Beta3(3)*z))
z_in4=(Zc*(zL4+1i*Zc*tan(Beta3(4)*z)))/(Zc+1i*zL4*tan(Beta3(4)*z))
%%
% $x^2+e^{\pi i}$ 