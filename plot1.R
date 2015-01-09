#setwd("../Downloads/exploratory-analysis/git/ExData_Plotting1")
nombres<-read.table("household_power_consumption.txt",sep=";",
                             nrows=1,header=TRUE)
cols<-colnames(nombres)
mydata<-read.table("household_power_consumption.txt",sep=";",
                   skip=66637,na.strings="?",nrows=2880)
names(mydata)<-cols
#Data read with labels
hist(mydata$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")