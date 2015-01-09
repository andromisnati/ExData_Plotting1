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

#Data read with labels, time objects, now create plot

plot(mydata$Hora,mydata$Sub_metering_1,main="",type="l",
     ylab="Energy sub metering",xlab="")
lines(mydata$Hora,mydata$Sub_metering_2,col="red")
lines(mydata$Hora,mydata$Sub_metering_3,col="blue")
legend("topright", pch = "-", col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       text.width=strwidth("- Sub_metering_1_____")  )

#save to png
dev.copy(png, file = "plot3.png",width=480,height=480) 
#close
dev.off()