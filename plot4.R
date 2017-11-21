#plot4

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","testfile.zip",mode = "wb")
unzip("testfile.zip")
householdpwr <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,na.strings = "?")
householdpwrfeb = subset(householdpwr, householdpwr$Date=="1/2/2007" | householdpwr$Date=="2/2/2007")

householdpwrfeb$Global_active_power <- as.numeric(householdpwrfeb$Global_active_power)

datetime1 <- paste(householdpwrfeb$Date,householdpwrfeb$Time)
householdpwrfeb$DateTimemod <- strptime(datetime1, "%d/%m/%Y %H:%M:%S")

png('plot4.png',width = 480,height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(householdpwrfeb, {
  plot(DateTimemod, Global_active_power, type = "l", xlab ="",ylab = "Global Active Power")
  plot(DateTimemod, Voltage, type="l" , xlab ="datetime")
  plot(DateTimemod, Sub_metering_1, type="l", xlab ="",ylab="Energy Sub Metering", col = "grey")
  points(householdpwrfeb$DateTimemod, householdpwrfeb$Sub_metering_2, type = "l", col = "red",xlab ="DateTime")
  points(householdpwrfeb$DateTimemod, householdpwrfeb$Sub_metering_3, type = "l", col = "blue",xlab ="DateTime")
  legend("topright", lty = 1, bty = "n",  col = c("grey", "red", "blue"), 
         legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
  plot(DateTimemod, Global_reactive_power, type = "l",xlab ="datetime")
})
dev.off(dev.cur())