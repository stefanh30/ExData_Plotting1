#plot 1

#get data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","household_power_consumption.zip")
unzip("household_power_consumption.zip")
file.remove("household_power_consumption.zip")

#load, define and filter data
df<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?", stringsAsFactors = F)
df$Time<-as.POSIXct(paste(df$Date, df$Time), format="%d/%m/%Y %H:%M:%S")
df$Date<-as.Date(df$Date,"%d/%m/%Y")
df<-df[df$Date=="2007-02-01"|df$Date=="2007-02-02",]

#Construct
par(cex=0.8,cex.lab=0.9,cex.axis=0.9) #define font size
hist(df$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#save to PNG (480x480)
dev.copy(png,file="plot1.png")
dev.off()