# Read the data into dataframe
hhp <- read.table("household_power_consumption.txt",skip=1,sep=";")
# Give the correct names to each column
names(hhp) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# make a subset for the requiered dates
sub_hhp <- subset(hhp,hhp$Date=="1/2/2007" | hhp$Date =="2/2/2007")
# tranforming date and time
sub_hhp$Date <- as.Date(sub_hhp$Date, format="%d/%m/%Y")
sub_hhp$Time <- strptime(sub_hhp$Time, format="%H:%M:%S")
sub_hhp[1:1440,"Time"] <- format(sub_hhp[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sub_hhp[1441:2880,"Time"] <- format(sub_hhp[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# construct the graph
plot(sub_hhp$Time,sub_hhp$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering", ylim = c(0,40))
with(sub_hhp,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(sub_hhp,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(sub_hhp,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# call the graphic device and save file
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()