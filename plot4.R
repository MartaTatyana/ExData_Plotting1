plot4 <- function (){
  eng<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"),
                  colClasses = c("character",
                                 "character",
                                 "numeric","numeric"
                                 ,"numeric","numeric",
                                 "numeric","numeric","numeric"))
  eng$Date<-as.Date(eng$Date, "%d/%m/%Y")
  eng$Time<-strptime(eng$Time, "%H:%M:%S")
  sub <- subset(eng, eng$Date==("2007-02-01")|eng$Date==("2007-02-02"))
  sub$datetime<-strptime(paste(sub$Date,strftime(sub$Time, format="%H:%M:%S")),"%Y-%m-%d %H:%M:%S")
  png(file = "plot4.png")
  par(mfcol=c(2,2))
  with(sub, {plot(datetime,Global_active_power,type = "l",
                  ylab="Global Active Power",
                  xlab="")
    plot(datetime,Sub_metering_1,type = "l",
                 ylab="Energy sub metering",
                 xlab="")
    with(sub,points(datetime,Sub_metering_2,type = "l",col="red"))
    with(sub,points(datetime,Sub_metering_3,type = "l",col="blue"))
    legend("topright",lty=c(1,1,1),col=c("black","red","blue")
         ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
    plot(datetime,Voltage,type = "l")
    plot(datetime,Global_reactive_power,type = "l")})
  dev.off()
}