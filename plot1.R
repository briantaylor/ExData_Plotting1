## plot 1

## first download the dataset - use same code for plot1 to plot4

filename = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(filename, destfile="dataset", method="curl")

## read in data from zip file
zipFileInfo <- unzip("dataset", list=TRUE)
fulldataset<- read.table(unz("dataset", as.character(zipFileInfo$Name)),sep = ";", header = TRUE)

## subset for selected dates 2007-02-01 and 2007-02-02
datasubset <- fulldataset[fulldataset$Date=="1/2/2007"|fulldataset$Date=="2/2/2007",]

## reformat date and time
dt <- paste(datasubset$Date,datasubset$Time)
timeconvert <- strptime(paste(datasubset$Date,datasubset$Time), "%d/%m/%Y %H:%M:%S")

## make new set of data converted to values

data <- cbind(timeconvert,datasubset[,3:9])
for(i in 2:8){
  data[,i]<-as.numeric(as.character(data[,i]))
}


## open a PNG file
png(filename = "plot1.png", width = 480, height = 480)

## now produce the plot
hist(data$Global_active_power, col = 2, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab="Frequency")

## close the png file
dev.off()




