##plot2
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","testfile.zip",mode = "wb")
unzip("testfile.zip")
householdpwr <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,na.strings = "?")
householdpwrfeb = subset(householdpwr, householdpwr$Date=="1/2/2007" | householdpwr$Date=="2/2/2007")

householdpwrfeb$Global_active_power <- as.numeric(householdpwrfeb$Global_active_power)

datetime1 <- paste(householdpwrfeb$Date,householdpwrfeb$Time)
householdpwrfeb$DateTimemod <- strptime(datetime1, "%d/%m/%Y %H:%M:%S")
png('plot2.png',width = 480,height = 480)
with(householdpwrfeb,plot(DateTimemod, Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off(dev.cur())