# Here I followed a suggestion on the suggestion forum which led me to some
# learging of the sqldf package.

library(sqldf)
myfile <- "household_power_consumption.txt"
mySql <- "SELECT * from file WHERE Date='1/2/2007' OR Date='2/2/2007'"
myData <- read.csv.sql(myfile,sql=mySql,sep=";")
str(myData)

png(file="plot1.png", width=480, height=480)

hist(myData$Global_active_power,
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power",
     col="red")

dev.off()