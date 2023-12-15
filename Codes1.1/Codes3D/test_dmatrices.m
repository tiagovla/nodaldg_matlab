clc; clear;

Globals3D
N = 2;
Np = (N+1)*(N+2)*(N+3)/6; Nfp = (N+1)*(N+2)/2; Nfaces=4; NODETOL = 1e-7;
[x,y,z] = Nodes3D(N);
[r,s,t] = xyztorst(x,y,z);
V = Vandermonde3D(N,r,s,t);
[Dr,Ds,Dt] = Dmatrices3D(N, r, s, t, V);

[Nv, VX, VY, VZ, K, EToV] = MeshReaderGambit3D('cubeK6.neu');

% va = EToV(:,1)'; vb = EToV(:,2)'; vc = EToV(:,3)'; vd = EToV(:,4)';
% x = 0.5*(-(1+r+s+t)*VX(va)+(1+r)*VX(vb)+(1+s)*VX(vc)+(1+t)*VX(vd));
% y = 0.5*(-(1+r+s+t)*VY(va)+(1+r)*VY(vb)+(1+s)*VY(vc)+(1+t)*VY(vd));
% z = 0.5*(-(1+r+s+t)*VZ(va)+(1+r)*VZ(vb)+(1+s)*VZ(vc)+(1+t)*VZ(vd));

fmask1   = find( abs(1+t) < NODETOL)'; 
fmask2   = find( abs(1+s) < NODETOL)';
fmask3   = find( abs(1+r+s+t) < NODETOL)';
fmask4   = find( abs(1+r) < NODETOL)';
Fmask  = [fmask1;fmask2;fmask3;fmask4]';

% [rx,sx,tx,ry,sy,ty,rz,sz,tz,J] = GeometricFactors3D(x,y,z,Dr,Ds,Dt);

% LIFT = Lift3D(N, r, s, t);
[nx, ny, nz, sJ] = Normals3D();