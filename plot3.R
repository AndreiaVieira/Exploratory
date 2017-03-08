setwd("c:/curso/Exploratory")
dados <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados <- subset(dados,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
dados <- dados[complete.cases(dados),]
dateTime <- paste(dados$Date, dados$Time)
dateTime <- setNames(dateTime, "DateTime")
dados <- dados[ ,!(names(dados) %in% c("Date","Time"))]
dados <- cbind(dateTime, dados)
dados$dateTime <- as.POSIXct(dateTime)
with(dados, { 
         plot(Sub_metering_1~dateTime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
         lines(Sub_metering_2~dateTime,col='Red')
         lines(Sub_metering_3~dateTime,col='Blue')
 })
legend ("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))     
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

