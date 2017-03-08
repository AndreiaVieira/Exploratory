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
## Create Plot 2
plot(dados$Global_active_power~dados$dateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()
 

