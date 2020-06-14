
x <- 1:10
y <- 11:20
cbind(x,y)

rbind(x,y)

# factors 
x<- factor(c("yes","no","yes","no","yes","yes","no","no"))
table(x)
unclass(x)
answers <- c("good","bad","really good","really bad","bad","really bad","good")
satisfaction <- factor(answers, levels=c("really bad","bad","good","really good"))

# NA variables  missing values
satisfaction[3]=NA
satisfaction[4]=NaN    # numeric not define 
is.na(satisfaction)
is.nan(satisfaction)

# data frame
opinion_poll <- data.frame(name=c("karen", "brayan"), age=c(27,36),opinion=c("agree","disagree"))


names(opinion_poll)

dimensions<- list(height=5, width=4, depth=3)

# application of dimnames apply to diagnostic test and false positives and false negatives cases

m=matrix(c(0.25, 0.10, 0.05,0.60), nrow=2, ncol=2)

dimnames(m) <- list(c("positive","negative"),c("present", "absent"))
print(m)

students <- read.csv("./data/student_info.csv",sep=";",header=TRUE)
students

x<- c("a","b","c")
for(i in seq_along(x)){
    print(x[i])
}

