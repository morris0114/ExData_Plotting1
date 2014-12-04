mydata<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
mysubset<-mydata[mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02",]
mysubset$Global_active_power<-as.numeric(as.character(mysubset$Global_active_power))

# plot 2
png("plot2.png", width=480, height=480,units="px")
plot(mysubset$Global_active_power, type='l',ylab="Global Active Power (kilowatts)", xlab="", xaxt="n")
axis(1, at=1, labels=c("Thu"))
axis(1, at=1441, labels=c("Fri"))
axis(1, at=2881, labels=c("Sat"))
dev.off()