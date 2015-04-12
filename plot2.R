plot2 <- function (){
  eng<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"),
                  colClasses = c("character",
                                 "character",
                                 "numeric","numeric"
                                 ,"numeric","numeric",
                                 "numeric","numeric","numeric"))
  eng$Date<-as.Date(eng$Date, "%d/%m/%Y")
  eng$Time<-strptime(eng$Time, "%H:%M:%S")
  sub <- subset(eng, eng$Date==("2007-02-01")|eng$Date==("2007-02-02"))
  sub$datet<-strptime(paste(sub$Date,strftime(sub$Time, format="%H:%M:%S")),"%Y-%m-%d %H:%M:%S")
  png(file = "plot2.png")
  with(sub, plot(datet,Global_active_power,type = "l",
                 ylab="Global Active Power (in kilowatts)",
                 xlab=""))
  dev.off()
}