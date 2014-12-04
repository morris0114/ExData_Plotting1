mydata<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
mysubset<-mydata[mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02",]
mysubset$Global_active_power<-as.numeric(as.character(mysubset$Global_active_power))
mysubset$Global_reactive_power<-as.numeric(as.character(mysubset$Global_reactive_power))
mysubset$Voltage<-as.numeric(as.character(mysubset$Voltage))
mysubset$Sub_metering_1<-as.numeric(levels(mysubset$Sub_metering_1)[mysubset$Sub_metering_1])
mysubset$Sub_metering_2<-as.numeric(levels(mysubset$Sub_metering_2)[mysubset$Sub_metering_2])

# plot 4
png("plot4.png",width=480,height=480, units="px")
par(mfrow=c(2,2))
with(mysubset,
     {
       plot(Global_active_power, type='l',ylab="Global Active Power", xlab="",xaxt="n")
       axis(1, at=1, labels=c("Thu"))
       axis(1, at=1441, labels=c("Fri"))
       axis(1, at=2881, labels=c("Sat"))
       
       plot(Voltage, type='l',ylab="Voltage",xlab="datetime",xaxt="n")
       axis(1, at=1, labels=c("Thu"))
       axis(1, at=1441, labels=c("Fri"))
       axis(1, at=2881, labels=c("Sat"))

       plot(Sub_metering_1, type='l',ylab="Energy sub metering",xlab="",xaxt="n")
       lines(Sub_metering_2, type='l', col="red")
       lines(Sub_metering_3, type='l', col="blue")
       axis(1, at=1, labels=c("Thu"))
       axis(1, at=1441, labels=c("Fri"))
       axis(1, at=2881, labels=c("Sat"))
       legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
       
       plot(Global_reactive_power, type='l', ylab="Global_reactive_power", xlab="datetime",xaxt='n')
       axis(1, at=1, labels=c("Thu"))
       axis(1, at=1441, labels=c("Fri"))
       axis(1, at=2881, labels=c("Sat"))
       
     })
dev.off()