plot1 <- function (){
  eng<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?"),
                  colClasses = c("character",
                                 "character",
                                 "numeric","numeric"
                                 ,"numeric","numeric",
                                 "numeric","numeric","numeric"))
  eng$Date<-as.Date(eng$Date, "%d/%m/%Y")
  eng$Time<-strptime(eng$Time, "%H:%M:%S")
  sub <- subset(eng, eng$Date==("2007-02-01")|eng$Date==("2007-02-02"))
  png(file = "plot1.png")
  hist(sub$Global_active_power,col="red",
       main="Global Active Power",xlab="Global Active Power (in kilowatts)")
  dev.off()
}