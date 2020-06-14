

# simple casion

## dice

library('ggplot2')

roll <- function() {
    die <-1:6
    probability<- c(3, 1, 1, 1, 1, 3)
    dice <- sample(die, size = 2, replace=TRUE, prob=probability)
    sum(dice)
}

rolls <- replicate(1000,roll())
qplot(rolls,binwidth=1)

print(roll())


## card game


rank <-c('A',2:9,'J','Q','K')
levels(rank)<- 1:12

suits<-c('clubs', 'diamonds', 'hearts', 'spades')

suits <- c( '♣', '♦', '♥', '♠') 
names(suits)<-c('clubs', 'diamonds', 'hearts', 'spades')
print(suits)

deck<-paste(rank,rep(suits, each=12),sep="-")
deck<-matrix(deck,nrow=12)

card<-sample(deck,1)
print(card) 


