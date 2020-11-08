library(pyinit)
X <- cbind(1, mtcars$wt, mtcars$gear)
y <- as.vector(mtcars$mpg)
n <- nrow(X)
p <- ncol(X)
delta <- 0.5 * (1 - p/n)

pyinit_expr <- quote(pyinit(x = X, y = y, intercept = FALSE, delta = delta, cc = 1.54764,
                            psc_keep = 0.5 * (1 - p/n), resid_keep_method = 'threshold',
                            resid_keep_thresh = 2, resid_keep_prop = 0.2, maxit = 20L,  eps = 1e-5,
                            mscale_maxit = 50, mscale_tol = 1e-6, mscale_rho_fun = 'bisquare'))

expected_obj <- c(3.169845, 3.169845, 3.433644, 5.074703, 5.074703, 0, 3.475116, 3.401738, 3.660265, 3.227703,
                    3.248764)

res1 <- eval(pyinit_expr)
res1$objective[[6]]
res2 <- eval(pyinit_expr)
res2$objective[[6]]
