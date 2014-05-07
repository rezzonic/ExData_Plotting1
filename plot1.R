f <- "household_power_consumption.txt"

# first useful value is on line 66638 (command = grep -m 1 -n "1/2/2007" household_power_consumption.txt)
nskip=66637

# two days, sampled every minute
nrow=60*24*2

DT <- read.table(f,
                  skip = nskip, nrow = nrow, sep = ";", 
                  col.names = colnames(read.table(
                  	f,
                  	nrow = 1, header = TRUE, sep=";")))

png(filename="plot1.png", width=480, height=480)
hist(DT$Global_active_power, 
	xlab="Global Active Power (kilowatts)", 
	main="Global Active Power", 
	col='red')
dev.off()
