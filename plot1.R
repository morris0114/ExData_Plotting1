mydata<-read.table("household_power_consumption.txt", head=TRUE, sep=";")
mydata$Date<-as.Date(mydata$Date, "%d/%m/%Y")
mydata$DateTime<-paste(mydata$Date, mydata$Time)
mydata$DateTime<-strptime(mydata$DateTime, "%Y-%m-%d %H:%M:%S")
mysubset<-mydata[mydata$Date=="2007-02-01" | mydata$Date=="2007-02-02",]
mysubset$Global_active_power<-as.numeric(as.character(mysubset$Global_active_power))

# plot 1
png("plot1.png",width=480, height=480, units="px")
hist(mysubset$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()