ad_cvm_watson_pvalue <- function(x, theta, B = 1000){

  n <- length(x)

  ## Observed statistics
  y <- sort(x)
  F0 <- psujatha(y, theta)

  AD.obs <- -n -
    mean((2*(1:n)-1) *
           (log(F0) + log(1-rev(F0))))

  CVM.obs <- 1/(12*n) +
    sum((F0 - (2*(1:n)-1)/(2*n))^2)

  Watson.obs <- CVM.obs -
    n*(mean(F0)-0.5)^2

  AD.boot <- numeric(B)
  CVM.boot <- numeric(B)
  Watson.boot <- numeric(B)

  for(i in seq_len(B)){

    xb <- rsujatha(n, theta)

    fitb <- fitsujatha(xb)

    thetab <- fitb$estimate

    Fb <- psujatha(sort(xb), thetab)

    AD.boot[i] <- -n -
      mean((2*(1:n)-1) *
             (log(Fb)+log(1-rev(Fb))))

    CVM.boot[i] <- 1/(12*n) +
      sum((Fb-(2*(1:n)-1)/(2*n))^2)

    Watson.boot[i] <- CVM.boot[i] -
      n*(mean(Fb)-0.5)^2
  }

  list(
    AD = AD.obs,
    AD.pvalue = mean(AD.boot >= AD.obs),

    CVM = CVM.obs,
    CVM.pvalue = mean(CVM.boot >= CVM.obs),

    Watson = Watson.obs,
    Watson.pvalue = mean(Watson.boot >= Watson.obs)
  )
}
