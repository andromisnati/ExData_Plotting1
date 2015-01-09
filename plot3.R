#setwd("../Downloads/exploratory-analysis/git/ExData_Plotting1")
Sys.setlocale("LC_TIME", "English")
#or we have Spanish Days

nombres<-read.table("household_power_consumption.txt",sep=";",
                    nrows=1,header=TRUE)
cols<-colnames(nombres)
mydata<-read.table("household_power_consumption.txt",sep=";",
                   skip=66637,na.strings="?",nrows=2880)
names(mydata)<-cols
mydata$Hora<-strptime(paste(mydata$Time,mydata$Date,sep="-"),"%H:%M:%S-%d/%m/%Y")
#mydata$Fecha<-as.Date(mydata$Date,"%d/%m/%Y")

#Data read with labels

plot(mydata$Hora,mydata$Sub_metering_1,main="",type="l",
     ylab="Energy sub metering",xlab="")
lines(mydata$Hora,mydata$Sub_metering_2,col="red")
lines(mydata$Hora,mydata$Sub_metering_3,col="blue")
legend("topright", pch = "-", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))