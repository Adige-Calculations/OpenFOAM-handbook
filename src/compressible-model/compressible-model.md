# Compressible model

## Algorithms explanation

The Navier-Stokes equations consist of a time-dependent continuity equation for conservation of mass, three 
time-dependent conservation of momentum equations, and a time-dependent conservation of energy equation.

\begin{equation}
\tag{1}
\frac{\partial \rho}{\partial t} + \frac{\partial(\rho u_{i})}{\partial x_{i}} = 0
\end{equation}


\begin{equation}
\tag{2}
\frac{\partial (\rho u_{i})}{\partial t} + \frac{\partial[\rho u_{i}u_{j}]}{\partial x_{j}} = -\frac{\partial p}{\partial x_{i}} + \frac{\partial \tau_{ij}}{\partial x_{j}} + \rho f_{i} 
\end{equation}

\begin{equation}
\tag{3}
\frac{\partial (\rho e)}{\partial t} + (\rho e+p)\frac{\partial u_{i}}{\partial x_{i}} = \frac{\partial(\tau_{ij}u_{j})}{\partial x_{i}} + \rho f_{i}u_{i} + \frac{\partial(\dot{ q_{i}})}{\partial x_{i}} + r
\end{equation}

The general transport is in words:

- [Rate of increase of fluid element] + [Net rate of flow of fluid element] = [Rate of increase of diffusion] + [Rate of increase of sources]

## Compressible resolution

To solve a compressible flow problem, you have to solve all five equations simultaneously; hence a coupled system 
of equations. There are actually some other equations that are required to solve this system. We only show five 
equations for six unknowns (u, v, w, p, ρ, T). The pressure, temperature, and density of a gas are all related by 
an equation of state (p = p(ρ, T)).

## Incompressible resoulution

To solve for incompressible flow problems, density is constant and, hence, by definition, not linked to the pressure. 
In this case, coupling between pressure and velocity introduces a constraint in the solution of the flow field because 
there are 4 equations and 6 unknowns.

So, we need to do this by using a segregated algorithm (i.g. SIMPLE); we need to guess the velocity and pressure field. 
The convective fluxes through cell faces are evaluated from guessed velocity components, and a guessed pressure field is 
used to solve the momentum equations.

A pressure correction equation is derived from the continuity and momentum equations, and that pressure correction 
equation is solved to obtain a pressure correction field, which is in turn used to update the velocity and pressure 
fields that will satisfy the continuity equation, and again the momentum equation is solved by updated pressure and 
velocity fields until we get a converged solution.

<!--  Script to show the footer   -->
<html>
<script
    src="https://code.jquery.com/jquery-3.3.1.js"
    integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
    crossorigin="anonymous">
</script>
<script>
$(function(){
  $("#footer").load("../footers/footer_first_level_depth.html");
});
</script>
<body>
<div id="footer"></div>
</body>
</html>
