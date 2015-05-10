# Project1 coursera Exploratory Data analysis.
# Ploting histogram of Global Active Power over two days 2007-02-01
# and 2007-02-02 of the data
# "Individual household electric power consumption Data Set" from the
# machine learning repository http://archive.ics.uci.edu/ml/


# Download data.
if (!file.exists("household_power_consumption.txt")){
  download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                "household_power_consumption.zip")
  unzip("household_power_consumption.zip")
}


# Read data and adjust time/date
read_tb <- function() {
  arq<<- read.table("household_power_consumption.txt",sep=";",dec=".", header=1, na.strings="?")
  subArq <<- subset(arq,subset=(arq$Date=="1/2/2007"|arq$Date=="2/2/2007"))
  subArq[[1]] <<- as.POSIXct(x = paste(as.Date(subArq[[1]], format = "%d/%m/%Y"),subArq[[2]]))
}
if (!exists("subArq")) {
  read_tb()
} else {if (nrow(subArq)!= 2880) {read_tb()}}

# Plot histogram of Global Active Power (kilowatts)

png("plot2.png", width=480, height=480)
plot(subArq[[1]],subArq[[3]],type="l",ylab='Global Active Power (kilowatts)',xlab="")
dev.off()

