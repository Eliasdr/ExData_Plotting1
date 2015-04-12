# plot4

library(graphics)

datos <- read.csv("household_power_consumption.txt",as.is= TRUE, na.strings = "?", sep = ";", dec = ".",header = TRUE)
datos2 <- subset.data.frame(datos, Date == "1/2/2007" | Date == "2/2/2007", c(1:9))
fecha <- as.Date(datos2$Date, "%d/%m/%Y")
dia_sem <- weekdays(fecha,TRUE)
longitud <- length(datos2$Global_active_power)

png(file="plot4.png", width = 480, height = 480)

par(mfcol=c(2, 2))

plot(datos2$Global_active_power,type = "l", ylab = "Global Active Power kilowatts)", axes=FALSE, frame.plot=TRUE, xlab='')
axis(2)
longitud <- length(datos2$Global_active_power)
axis(1, labels = c("Thu", "Fri", "Sat"), at = c(0, longitud/2, longitud))
dev.cur()

plot(datos2$Sub_metering_1,col='black',type='l',axes=FALSE,frame.plot=TRUE,ylab='Energy sub metering',xlab='')
points(datos2$Sub_metering_2,col='red',type='l')
points(datos2$Sub_metering_3,col='blue',type='l')
axis(2)
axis(1,labels=c("Thu","Fri","Sat"), at=c(0,longitud/2,longitud))
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'),plot=TRUE,lwd=1, bty="n")
dev.cur()

plot(datos2$Voltage,type="l",ylab="Voltage",axes=FALSE,frame.plot=TRUE,xlab='datetime')
axis(2)
longitud = length(datos2$Voltage)
axis(1,labels=c("Thu","Fri","Sat"), at=c(0,longitud/2,longitud))
dev.cur()

plot(datos2$Global_reactive_power,type="l",ylab="Global_reactive_power",axes=FALSE,frame.plot=TRUE,xlab='datetime')
axis(2)
longitud = length(datos2$Global_reactive_power)
axis(1,labels=c("Thu","Fri","Sat"), at=c(0,longitud/2,longitud))

dev.off()
par(mfcol=c(1,1))
