setwd("c:/Curso/Exploratory")
dados <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
dados$Date <- as.Date(dados$Date, "%d/%m/%Y")
dados <- subset(dados,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
# Delete lines with NA
dados <- dados[complete.cases(dados),]
dateTime <- paste(dados$Date, dados$Time)
dataTime <- setNames(dateTime, "DateTime")
dados <- dados[ ,!(names(dados) %in% c("Date","Time"))]
dados <- cbind(dateTime, dados)
dados$dateTime <- as.POSIXct(dateTime)
hist(dados$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()


