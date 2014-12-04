mydata<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
mysubset<-mydata[mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02",]
mysubset$Global_active_power<-as.numeric(as.character(mysubset$Global_active_power))
mysubset$Sub_metering_1<-as.numeric(levels(mysubset$Sub_metering_1)[mysubset$Sub_metering_1])
mysubset$Sub_metering_2<-as.numeric(levels(mysubset$Sub_metering_2)[mysubset$Sub_metering_2])

# plot 3
png("plot3.png",width=480,height=480, units="px")
plot(mysubset$Sub_metering_1, type='l',ylab="Energy sub metering", xlab="",xaxt="n")
lines(mysubset$Sub_metering_2, type='l', col="red")
lines(mysubset$Sub_metering_3, type='l', col="blue")
axis(1, at=1, labels=c("Thu"))
axis(1, at=1441, labels=c("Fri"))
axis(1, at=2881, labels=c("Sat"))

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()