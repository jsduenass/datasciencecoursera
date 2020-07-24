
#rm(list = ls())
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
# objective: create a card game where you can draw cards

new_deck <-function(){
    
    rank <-c('A',2:9,'J','Q','K')
    #levels(rank)<- 1:12
    
    suits <- c( '♣', '♦', '♥', '♠') 
    #names(suits)<-c('clubs', 'diamonds', 'hearts', 'spades')
    
    deck<-paste(rank,rep(suits, each=12),sep="-")
    deck<- shuffle(deck)
}

shuffle <-function(deck){
    shuffled <- sample(deck,length(deck))
}    

draw<-function(deck){
    
}


rank <-c('A',2:9,'J','Q','K')
levels(rank)<- 1:12

suits<-c('clubs', 'diamonds', 'hearts', 'spades')

suits <- c( '♣', '♦', '♥', '♠') 
names(suits)<-c('clubs', 'diamonds', 'hearts', 'spades')
print(suits)

deck<-paste(rank,rep(suits, each=12),sep="-")


assign("deck", shuffled , envir = globalenv())


dim(deck)<-c(12,4)
colnames(deck) <- c('clubs', 'diamonds', 'hearts', 'spades')
rownames(deck)<- rank

card<-sample(deck,1)
print(card) 


external_deck <- read.csv("./data/deck_of_cards.csv")
head(external_deck,5)
tail(external_deck,5)






