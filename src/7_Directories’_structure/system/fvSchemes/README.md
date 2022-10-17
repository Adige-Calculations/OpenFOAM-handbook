# fvSchemes 

This dictionary contains the instructions to discretize the problem’s
equations. 
 But you will need to set the keyword runTimeModifiable to yes in the controlDict dictionary.
Different discretization procedures suit different mesh
refinement and quality.

| Main document keywords     | Category of mathematical terms                                                                |
| -------------------------- | --------------------------------------------------------------------------------------------- |
| interpolationSchemes       | Point-to-point interpolations of values                                                       |
| snGradSchemes              | Component of gradient normal to a cell face                                                   |
| gradSchemes                | Gradient          ∇                                                                           |
| divSchemes                 | Divergence      ∇ ∙                                                                           |
| laplacianSchemes           | Laplacian    ∇<sup>2                                                                          |
| timeScheme                 | First and second time derivatives ![∂∕ ∂t,∂2∕∂<sup>2<sup>t ]                                    |

### gradScheme

This voice tackles the gradient limitators

### divSchemes

Relates to the evaluation of the flux φ (phi) across cell faces which
transport a property \<transporProperties\> under the influence of
velocity field (phi). The schemes are all based on Gauss integration,
using the flux φ and the advected field being interpolated to the cell
faces by one of the selected schemes

These are the convective discretization schemes that you will use most
of the times:

  - Gauss upwind → first order accurate.

  - Gauss linearUpwind grad(\<transporProperties\>) → second order
    accurate, bounded.

  - Gauss linear → second order accurate, unbounded.

  - Gauss limitedLinear → second order accurate, unbounded, but more
    stable than pure linear. Recommended for LES simulations.

Gauss indicates derivatives are evaluated via Gauss’ theorem (no real
choice there). upwind is standard 1st order upwind interpolation
(usually too diffusive). linear is standard 2nd order interpolation –
unbounded. Instead remember that TVD methods (such as superBee, minmod
vanLeer) switch locally to upwind when they detect strong gradients

For the discretization of the diffusive terms, you can use a fully
orthogonal scheme

  - Linear corrected

  - Linear limited \<from0To1\>

0 for bad mesh and 1 for good quality mesh