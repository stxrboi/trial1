library(magrittr)
library(dplyr)
library(tidyverse)
library(readxl)

df <- tibble(read.csv('train.csv', sep = ","))
df$Survived<-as.factor(df$Survived)
df$Pclass<-as.factor(df$Pclass)

df %>% group_by(Pclass, Sex, Survived) %>% count() %>% 
  ggplot(aes(x= Pclass, y=n, fill=Sex))+
  geom_col()+
  #geom_text(Survived)+
  facet_wrap(~Survived)

x<- 10

if(x<4){
  print("The statement is true")
}else{
  print("The statement is false")
}

x<-c(1,-4,3,2,10)

ifelse (x<1,"YES","NO")

ifelse (x<1,"YES",ifelse(x<3,"Less than 3","No true"))

is.na(df$Age)

x<-na.omit(df$Age)

df %>% mutate (cat_age= ifelse (x<10,0,ifelse(x<20,1, ifelse(x<30,2, ifelse(x>=30,3, 10)))))

x<- df$Sex

ifelse(x=="male",0,ifelse(x=="female",1,10))

df %>% mutate(cat_sex= ifelse(x=="male",0,ifelse(x=="female",1,10)))
