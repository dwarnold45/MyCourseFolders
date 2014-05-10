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

# png(file="plot2.png", width=480, height=480)

plot(myData$DateTime,myData$Global_active_power,
     type="l",xlab="",ylab="Global Active Power (kilowatts)")

# dev.off()
