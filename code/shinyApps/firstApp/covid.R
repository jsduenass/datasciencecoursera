# Packages
library(ggplot2)
library(dplyr)


# Model

SIR <- function(t, state, parameters) {
    with(as.list(c(state, parameters)), {
        dS<-  -B*S*I/N;
        dI<-  B*S*I/N -gamma*I;
        dR<-  gamma*I;
        list(c(dS, dI, dR))
    })
}

N <- 1
parameters <- c(B = 0.05, gamma=0.03,N=N)

state      <- c(S=0.97*N,I=0.03*N,R=0)     

times      <- seq(0, 200, by = 5)

out <- ode(y = state, times = times, func = SIR, parms = parameters)


n<- dim(out)[1]

time <- rep(out[,1],each=length(state))               # x Axis
value <- matrix(t(out[,2:4]), ncol  = 1,byrow =TRUE)    #y Axis

group <- rep(names(state),times=n)        # group, one shape per group

data <- data.frame(time, value, group)
data$group <- factor(data$group , levels=c("S","R","I") )

# stacked area chart
ggplot(data, aes(x=time, y=value, fill=group)) + geom_area()
       