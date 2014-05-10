myData <- read.table("household_power_consumption.txt",
                     header=TRUE,
                     na.strings="?",
                     sep=";",
                     stringsAsFactors=FALSE)
str(myData)

myIndex=(myData$Date=="1/2/2007") | (myData$Date=="2/2/2007")

myData=myData[myIndex,]

myData$DateTime=paste(myData$Date,myData$Time,sep=" ")

myData$DateTime=as.POSIXct(myData$DateTime,format="%d/%m/%Y %H:%M:%S")

# png(file="plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(myData$DateTime,myData$Global_active_power,
     type="l",xlab="",ylab="Global Active Power")

plot(myData$DateTime,myData$Voltage,
     type="l",xlab="datetime",ylab="Voltage")

plot(myData$DateTime,myData$Sub_metering_1,
     type="l",xlab="",ylab="Energy sub metering")
lines(myData$DateTime,myData$Sub_metering_2,
      type="l",col="red")
lines(myData$DateTime,myData$Sub_metering_3,
      type="l",col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"),
       lty=c(1,1,1),
       bty="n")

plot(myData$DateTime,myData$Global_reactive_power,
     type="l",xlab="datetime",ylab="Globar_reactive_power")

par(mfrow=c(1,1))

# dev.off()