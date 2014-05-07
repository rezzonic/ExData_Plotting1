f <- "household_power_consumption.txt"

# first useful value is on line 66638 (command = grep -m 1 -n "1/2/2007" household_power_consumption.txt)
nskip=66637

# two days, sampled every minute
nrow=60*24*2

# format for date
dformat="%d/%m/%Y %H:%M:%S"

DT <- read.table(f,
                  skip = nskip, nrow = nrow, sep = ";", 
                  col.names = colnames(read.table(
                  	f,
                  	nrow = 1, header = TRUE, sep=";")))

png(filename="plot3.png", width=480, height=480)
plot(strptime(paste(DT$Date,DT$Time,sep=" "), format=dformat), DT$Sub_metering_1,
	xlab="", 
	ylab="Energy sub metering",
	type='l',
	col='black')
points(strptime(paste(DT$Date,DT$Time,sep=" "), format=dformat), DT$Sub_metering_2,
	type='l',
	col='red')
points(strptime(paste(DT$Date,DT$Time,sep=" "), format=dformat), DT$Sub_metering_3,
	type='l',
	col='blue')
legend('topright',col=c('black', 'red', 'blue'),legend=colnames(DT)[7:9],lty=1)
dev.off()
