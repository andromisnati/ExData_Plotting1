#setwd("../Downloads/exploratory-analysis/git/ExData_Plotting1")
#Read columns names
nombres<-read.table("household_power_consumption.txt",sep=";",
                    nrows=1,header=TRUE)
cols<-colnames(nombres)

#Read needed data
mydata<-read.table("household_power_consumption.txt",sep=";",
                   skip=66637,na.strings="?",nrows=2880)
names(mydata)<-cols

#Data read with labels, now create histogram
hist(mydata$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

#save to png
dev.copy(png, file = "plot1.png",width=480,height=480) 
#close
dev.off()