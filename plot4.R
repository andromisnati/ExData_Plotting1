#setwd("../Downloads/exploratory-analysis/git/ExData_Plotting1")
Sys.setlocale("LC_TIME", "English")
#Set ENG language or we'll have Spanish Days in the plot XD

#Read columns names
nombres<-read.table("household_power_consumption.txt",sep=";",
                    nrows=1,header=TRUE)
cols<-colnames(nombres)
#Read needed data
mydata<-read.table("household_power_consumption.txt",sep=";",
                   skip=66637,na.strings="?",nrows=2880)
names(mydata)<-cols
mydata$Hora<-strptime(paste(mydata$Time,mydata$Date,sep="-"),"%H:%M:%S-%d/%m/%Y")

#Data read with labels, time objects, now create plots

#setting of multiple
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

#1st plot of GAP (plot2)
plot(mydata$Hora,mydata$Global_active_power,main="",type="l",
     ylab="Global Active Power (kilowatts)",xlab="")

#2nd plot of Voltage
plot(mydata$Hora,mydata$Voltage,main="",type="l",
     ylab="Voltage",xlab="datetime")

#3rd plot of Submeterings (plot3)
plot(mydata$Hora,mydata$Sub_metering_1,main="",type="l",
     ylab="Energy sub metering",xlab="")
lines(mydata$Hora,mydata$Sub_metering_2,col="red")
lines(mydata$Hora,mydata$Sub_metering_3,col="blue")
legend("topright", pch = "-", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
      cex=0.5, text.width=strwidth("- Sub_meter"), bty="n")

#4th plot of GRP
plot(mydata$Hora,mydata$Global_reactive_power,main="",type="l",
     ylab="Global_reactive_power",xlab="datetime")

#save to png
dev.copy(png, file = "plot4.png",width=480,height=480) 
#close
dev.off()