# SujathaDist 0.1.0

## Initial Release

### New Features

- Added density function `dsujatha()`.
- Added distribution function `psujatha()`.
- Added quantile function `qsujatha()`.
- Added random number generator `rsujatha()`.
- Added maximum likelihood estimation using `fitsujatha()`.
- Added goodness-of-fit procedure `gofsujatha()`.
- Added confidence intervals.
- Added model selection criteria:
  - Log-Likelihood
  - AIC
  - AICc
  - BIC
  - CAIC
  - HQIC
- Added S3 methods:
  - `print()`
  - `summary()`
  - `coef()`
  - `vcov()`
  - `confint()`
  - `logLik()`
  - `AIC()`
  - `BIC()`
  - `deviance()`

### Documentation

- Added package vignette.
- Added function documentation.
- Added examples for all exported functions.

### Testing

- Added unit tests for all exported functions.
- Package passes `R CMD check` with no errors or warnings.
