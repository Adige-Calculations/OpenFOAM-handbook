# Internal Flow approximations

For a fully developed inlet flow, approximating turbulent boundary
conditions can be extrapolated using the Reynolds number *Re* to
determine the turbulent intensity *I* to define the intensity length
scale *l*, the required turbulent boundary conditions can be calculated.

$ I = 0.16 \ Re_L ^{-1/8} $

This can be used to calculate a mean approximation for the turbulent
boundary conditions

$ k = \frac{3}{2} U I^{2} $

$ ε = C_{\mu}\frac{k^{\frac{3}{2}}}{l} = C_{\mu}\frac{k^{\frac{3}{2}}}{0.07L} $

$ ω = \frac{\varepsilon}{kC_{\mu}}\ $