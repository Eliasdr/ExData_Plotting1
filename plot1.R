# Plot1.png
datos <- read.csv("household_power_consumption.txt",as.is= TRUE, na.strings = "?", sep = ";", dec = ".",header = TRUE)
datos2 <- subset.data.frame(datos, Date == "1/2/2007" | Date == "2/2/2007",c(1:9))
png(file="plot1.png", width = 480, height = 480)
hist(datos2$Global_active_power, main="Global Active Power", col="red",xlab="Global Active Power (kilowatts)")
dev.off()
