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

plot(mydata$Hora,mydata$Global_active_power,main="",type="l",
     ylab="Global Active Power (kilowatts)",xlab="")