##plot1
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","testfile.zip",mode = "wb")
unzip("testfile.zip")
householdpwr <- read.csv("household_power_consumption.txt",sep = ";",stringsAsFactors = FALSE,na.strings = "?")
householdpwrfeb = subset(householdpwr, householdpwr$Date=="1/2/2007" | householdpwr$Date=="2/2/2007")

householdpwrfeb$Global_active_power <- as.numeric(householdpwrfeb$Global_active_power)
png('plot1.png',width = 480,height = 480)
hist(householdpwrfeb$Global_active_power,
     main = "Global Active Power",col= "red", 
     xlab = "Global Active Power (kilowatts)")
dev.off(dev.cur())