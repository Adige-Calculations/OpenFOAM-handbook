# Residuals

The residual is evaluated by substituting the current solution into the
equation, taking the magnitude of the difference between the left- and
right-hand sides; it is also normalised to make it independent of the
scale of the problem being analysed. Consequently, before solving an
equation for a particular field, the initial residual is evaluated based
on the current values of the field. After each solver iteration the
residual is re-evaluated. To terminate the case, the initial residual of
the field equations must falls below user-specified threshold values:
