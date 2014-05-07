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


png(filename="plot2.png", width=480, height=480, bg='transparent')
plot(strptime(paste(DT$Date,DT$Time,sep=" "), format=dformat), DT$Global_active_power,
	xlab="", 
	ylab="Global Active Power (kilowatts)",
	type='l')
dev.off()
