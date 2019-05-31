
# Read the data into dataframe
hhp <- read.table("household_power_consumption.txt",skip=1,sep=";")
# Give the correct names to each column
names(hhp) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
# make a subset for the requiered dates
sub_hhp <- subset(hhp,hhp$Date=="1/2/2007" | hhp$Date =="2/2/2007")
# tell R there will only be one graph
par(mfrow = c(1,1))
# construct the graph
hist(as.numeric(sub_hhp$Global_active_power), xlab = "Global Active Power (kilowatts)", col="red",main="Global Active Power")
# call the graphic device and save file
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()