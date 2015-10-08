data <- read.csv("C:\\Users\\HOME\\Documents\\R\\lab1\\data_full.csv", header = TRUE, sep = ",")

colnames(data)[6] <- "Debt"




for (i in 1:1350)
{
  if (!is.na(data[i, 6]))
  {
    data[i, 6] <- data[i, 6] * data[i, 7]
  }
}



plot(data[,"age"], data[,"Debt"], log='y', 
     col=ifelse(data[,"SeriousDlqin2yrs"] == 0, "blue", "red"))


test1 <- subset(data, data[,'SeriousDlqin2yrs'] == 0)
test2 <- subset(data, data[,'SeriousDlqin2yrs'] > 0)

plot(density(test1[,'MonthlyIncome'], na.rm=TRUE),xlim=c(0,40000), col="red")
lines(density(test2[,'MonthlyIncome'], na.rm=TRUE),xlim=c(0,40000), col="blue")
