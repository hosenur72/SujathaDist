# SujathaDist

<!-- badges: start -->
  [![R-CMD-check](https://img.shields.io/badge/R--CMD--check-passing-brightgreen)]()
[![License: GPL-3](https://img.shields.io/badge/License-GPL--3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![R-CMD-check](https://github.com/hosenur72/SujathaDist/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/hosenur72/SujathaDist/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

  ## Overview

  **SujathaDist** is an R package for statistical analysis based on the **Sujatha distribution**, a one-parameter lifetime distribution proposed by Shanker (2016). The package provides functions for probability calculations, random number generation, parameter estimation using Maximum Likelihood Estimation (MLE), and goodness-of-fit analysis.

The package is intended for researchers, statisticians, reliability engineers, and students working with lifetime and reliability data.

---

  ## Features

  - Density function (`dsujatha`)
    - Distribution function (`psujatha`)
      - Quantile function (`qsujatha`)
        - Random number generation (`rsujatha`)
- Maximum Likelihood Estimation (`fitsujatha`)
- Goodness-of-fit analysis (`gofsujatha`)
- Confidence intervals
- Model selection criteria
- Log-Likelihood
- AIC
- AICc
- BIC
- CAIC
- HQIC

---

  ## Installation

  ### Install from GitHub

  ```r
# install.packages("remotes")
remotes::install_github("hosenur72/SujathaDist")
```


### Install from Source

Download the package source and install

```r
install.packages("SujathaDist_0.1.0.tar.gz",
                 repos = NULL,
                 type = "source")
```

---

  ## Load the Package

  ```r
library(SujathaDist)
```

---

  # Examples

  ## Density Function

  ```r
dsujatha(2, theta = 2)
```

---

  ## Distribution Function

  ```r
psujatha(2, theta = 2)
```

---

  ## Quantile Function

  ```r
qsujatha(0.50, theta = 2)
```

---

  ## Random Number Generation

  ```r
set.seed(123)

x <- rsujatha(100,
              theta = 2)

head(x)
```

---

  ## Parameter Estimation

  ```r
fit <- fitsujatha(x)

fit
```

Example output

```
Maximum Likelihood Fit of Sujatha Distribution

Parameter Estimate

theta = 2.08
```

---

  ## Summary

  ```r
summary(fit)
```

---

  ## Confidence Interval

  ```r
confint(fit)
```

---

  ## Variance-Covariance Matrix

  ```r
vcov(fit)
```

---

  ## Goodness-of-Fit

  ```r
gofsujatha(fit)
```

---

  # Included Functions

  | Function | Description |
  |----------|-------------|
  | `dsujatha()` | Probability density function |
  | `psujatha()` | Cumulative distribution function |
  | `qsujatha()` | Quantile function |
  | `rsujatha()` | Random number generation |
  | `fitsujatha()` | Maximum likelihood estimation |
  | `gofsujatha()` | Goodness-of-fit analysis |

  ---

  # Applications

  The package can be applied in

- Reliability Engineering
- Survival Analysis
- Lifetime Data Analysis
- Medical Statistics
- Actuarial Science
- Risk Analysis
- Industrial Quality Control

---

  # References

  Shanker, R. (2016).

**Sujatha Distribution and Its Applications.**

Statistics in Transition: new Series,
17 (3), 391-410,
---

  # Citation

  If you use **SujathaDist** in your research, please cite both the package and the original paper introducing the Sujatha distribution.

Example

```
Prodhani, H. R.(2026).

SujathaDist:
  An R Package for Statistical Analysis Using the Sujatha Distribution.

Version 0.1.0.
```

---

 # Author

**Hosenur Rahman Prodhani**

Assistant Professor

Department of Statistics

B.N. College (Autonomous),Dhubri, Assam, India

Email: hosenur72@gmail.com

---

  # License

  GPL (>= 3)
