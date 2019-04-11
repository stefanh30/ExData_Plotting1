#plot 4

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
      par(cex=0.8,cex.lab=0.8,cex.axis=0.8,mfrow=c(2,2)) #define font size
      #first plot
      plot(df$Time,df$Global_active_power,xlab="",ylab="Global Active Power",type="l")
      #second plot
      plot(df$Time,df$Voltage,xlab="datetime",ylab="Voltage",type="l")
      #third plot
      plot(df$Time,df$Sub_metering_1,xlab="",ylab="Global Active Power (kilowatts)",type="l")
      points(df$Time,df$Sub_metering_2,col="red",type="l") #add points
      points(df$Time,df$Sub_metering_3,col="blue",type="l")
      legend("topright", #location
             lty=1, #line type
             col=c("black","red","blue"), #color of lines
             legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), #text of legend
             y.intersp=0.9, #spacing between lines
             x.intersp=0.15, #spacing between text and line
             cex=0.65,#font size
             bty="n") #no box around legend
      #fourth plot
      plot(df$Time,df$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
      
#save to PNG (480x480)
dev.copy(png,file="plot4.png")
dev.off()