% Driver script for solving the 1D Maxwell's equations
Globals1D;

% Polynomial order used for approximation 
N = 8;

% Generate simple mesh
[Nv, VX, K, EToV] = MeshGen1D(-10.0,10.0,80);

% Initialize solver and construct grid and metric
StartUp1D;

% Set up material parameters
eps1 = [ones(1,K/2), 1*ones(1,K/2)]; 
mu1 = ones(1,K);
epsilon = ones(Np,1)*eps1; mu = ones(Np,1)*mu1;

% Set initial conditions
E = sin(pi*x).*(x<0 & x>-1); H = zeros(Np,K);

% Solve Problem
FinalTime = 10;
[E,H] = Maxwell1D(E,H,epsilon,mu,FinalTime);
