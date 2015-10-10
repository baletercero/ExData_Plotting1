hpc <- read.csv("./household_power_consumption.txt", sep=";", na.strings="?")
hpc$DateTime <- paste(hpc$Date,hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime,'%d/%m/%Y %H:%M:%S')
hpc$Date <- as.Date(hpc$Date,'%d/%m/%Y')
hpc_sub <- hpc[hpc$Date>='2007-02-01'&hpc$Date<='2007-02-02',]
# Create a histogram with the subst of data, color it red, name the x axis and the main title
with(hpc_sub,plot(DateTime,Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)'))
dev.copy(png, file = "plot2.png",width = 480, height = 480)  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!
