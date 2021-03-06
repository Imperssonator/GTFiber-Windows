function u = diffusion_scheme_3D_standard(u, Dxx,Dxy,Dxz,Dyy,Dyz,Dzz,dt)
% Standard Discretization of 3D image diffusion.
% Based on Laure Fritz, "Diffusion-based applications for interactive 
% medical image segmentation".In Proceedings of CESCG 2006.
% 
% Function is written by D.Kroon University of Twente (September 2009)

% Calculate positive and negative indices
[N1,N2,N3] = size(u);
px = [2:N1,N1]; nx = [1,1:N1-1];
py = [2:N2,N2]; ny = [1,1:N2-1];
pz = [2:N3,N3]; nz = [1,1:N3-1];

% In literatue a,b,c,d,e and f are used as variables
a=Dxx; b=Dyy; c=Dzz; d=Dxy; e=Dxz; f=Dyz; 


% The Stencil Weights
A2 = 0.5*(-f(:,:,nz)-f(:,py,:));
A4 = 0.5*( e(:,:,nz)+e(nx,:,:));
A5 = ( c(:,:,nz)+c);
A6 = 0.5*(-e(:,:,nz)-e(px,:,:));
A8 = 0.5*( f(:,:,nz)+f(:,ny,:));

B1 = 0.5*(-d(nx,:,:) -d(:,py,:));
B2 = (b(:,py,:)+b);
B3 = 0.5*(d(px,:,:)+ d(:,py,:));
B4 = (a(nx,:,:)+a);
B5 = - (a(nx,:,:) + 2*a + a(px,:,:)) ...
      -(b(:,ny,:) + 2*b + b(:,py,:)) ...
      -(c(:,:,nz) + 2*c + c(:,:,pz));
B6 = (a(px,:,:)+a);
B7 = 0.5*(d(nx,:,:)+d(:,ny,:));
B8 = (b(:,ny,:)+b);
B9 = 0.5*(-d(px,:,:)-d(:,ny,:));

C2 = 0.5*(f(:,:,pz) + f(:,py,:));
C4 = 0.5*(-e(:,:,pz)-e(nx,:,:));
C5 = (c(:,:,pz)+c);
C6 = 0.5*(e(:,:,pz)+e(px,:,:));
C8 = 0.5*(-f(:,:,pz)-f(:,ny,:));

% Perform the diffusion
u=u+ 0.5*dt.*(  ...
        A2.*(u(: ,py,nz )-u) + ...
        A4.*(u(nx ,: ,nz)-u) + ...
        A5.*(u(: ,: ,nz)-u)  + ... 
        A6.*(u(px,: ,nz)-u)  + ... 
        A8.*(u(: ,ny,nz)-u)  + ...
        B1.*(u(nx,py,: )-u)  + ...
        B2.*(u(: ,py,: )-u)  + ...
        B3.*(u(px,py,: )-u)  + ...
        B4.*(u(nx,: ,: )-u)  + ...
        B5.*(u(:,: ,: )-u)  + ...
        B6.*(u(px,: ,: )-u)  + ...
        B7.*(u(nx,ny,: )-u)  + ...
        B8.*(u(: ,ny,: )-u)  + ...
        B9.*(u(px,ny,: )-u)  + ...
        C2.*(u(: ,py,pz)-u)  + ...
        C4.*(u(nx,: ,pz)-u)  + ...
        C5.*(u(: ,: ,pz)-u)  + ...
        C6.*(u(px,: ,pz)-u)  + ...
        C8.*(u(: ,ny,pz)-u));
 
    
%% Alternative way to do the diffusion
%
% du= 0.5*dt.*( A2.*u(: ,py,nz ) + ...
%         A4.*u(nx ,: ,nz )+ A5.*u(: ,: ,nz)  + ... 
%         A6.*u(px,: ,nz)  + A8.*u(: ,ny,nz)  + ...
%         B1.*u(nx,py,: )  + B2.*u(: ,py,: )  + ...
%         B3.*u(px,py,: )  + B4.*u(nx,: ,: )  + ...
%         B6.*u(px,: ,: )  + B7.*u(nx,ny,: )  + ...
%         B8.*u(: ,ny,: )  + B9.*u(px,ny,: )  + ...
%         C2.*u(: ,py,pz)  + C4.*u(nx,: ,pz)  + ...
%         C5.*u(: ,: ,pz)  + C6.*u(px,: ,pz)  + ...
%         C8.*u(: ,ny,pz));
% 
% % Perform the edge preserving diffus:on filtering on the image
% u = (u + du )./ (1-0.5*dt*B5);  
% 

