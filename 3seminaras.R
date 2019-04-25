getwd()
setwd("C:/Users/studentas/Desktop")
getwd()
dir()
install.packages("readr")
data <- read.csv("data-table.csv", sep=",", header = TRUE, stringsAsFactors = FALSE, encoding = "UTF-8")
View(data)
str(data)
df <- data[data$Lytis=="Vyrai ir moterys" 
           & data$Gyvenamoji.vietovė=="Miestas ir kaimas",]
aggregate(df$Reikšmė, list(df$Amžius..tikslinės.amžiaus.grupės.), mean)
df <- data[data$Lytis=="Vyrai ir moterys" 
           & data$Gyvenamoji.vietovė=="Miestas ir kaimas" 
           & data$Amžius..tikslinės.amžiaus.grupės. %in% c("15–24", "15–74"),]
png("nedarbo_lygio_statistika.png",
    width = 1920,
    height = 1080,
    units = "px",
    pointsize = 12,)
plot(df[df[,3]=="15–24",1],
     df[df[,3]=="15–24",7],
     type = "l",
     col="Pink",
     lwd=2,
     ylim = c(0,40),
     xlab = "Metai",
     ylab = "Nedarbo lygis,%")
lines(df[df[,3]=="15–74",1],
      df[df[,3]=="15–74",7],
      col="Red",
      lwd=2)
dev.off()
#-----------------------------------------------------------------------------------------------
setwd("C:/Users/studentas/Desktop/3_seminaras")
getwd()
dir()
best <- function(state, outcome){
        df <- read.csv("outcome-of-care-measures.csv",
                       stringsAsFactors = FALSE,
                       na.strings = "Not Available")}
str(df)

state <- "AAAA"
state <- "AL"
if(!state%in%unique(df$State)){
        stop("Invalid State")}

outcome <- "Heart"
outcome <- "Heart Attack"
if(!outcome%in%c("Heart Attack",
                   "Heart Failure",
                   "Pneumonia")){
        stop("invalid outcome")
}
df <- df[,c(2,7,11)]
if(outcome="Heart Attack"){
df <- df[,c(2,7,11)]
}else if(outcome="Heart Failure"){
df <- df[,c(2,7,17)]
}else{
df <- df[,c(2,7,23)]
}

df <- df[!is.na(df[,3]),]
df <- df[df[,2]==state,]
df <- df[order(df[,3],df[,1]),]
df[1,1]