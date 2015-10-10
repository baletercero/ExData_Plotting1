hpc <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
hpc$DateTime <- paste(hpc$Date,hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime,'%d/%m/%Y %H:%M:%S')
hpc$Date <- as.Date(hpc$Date,'%d/%m/%Y')
hpc_sub <- hpc[hpc$Date>='2007-02-01'&hpc$Date<='2007-02-02',]
# Create a histogram with the subst of data, color it red, name the x axis and the main title
png(file = "plot3.png",width = 480, height = 480)
with(hpc_sub,plot(DateTime,Sub_metering_1+Sub_metering_2+Sub_metering_3,type='n',xlab='',ylab='Energy submetering'))
with(hpc_sub,lines(DateTime,Sub_metering_1,col='black',pch=3,type='l'))
with(hpc_sub,lines(DateTime,Sub_metering_2,col='red',pch=3,type='l'))
with(hpc_sub,lines(DateTime,Sub_metering_3,col='blue',pch=3,type='l'))
legend("topright",col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=0)
#dev.copy(png, file = "plot3.png",width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
