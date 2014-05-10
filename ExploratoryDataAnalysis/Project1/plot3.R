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

# png(file="plot3.png", width=480, height=480)

plot(myData$DateTime,myData$Sub_metering_1,
     type="l",xlab="",ylab="Energy sub metering")
lines(myData$DateTime,myData$Sub_metering_2,
      type="l",col="red")
lines(myData$DateTime,myData$Sub_metering_3,
      type="l",col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","blue","red"),
       lty=c(1,1,1))
# dev.off()