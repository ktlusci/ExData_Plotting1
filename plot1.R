###  Create a histogram of Global Active Power for Feb 1-2, 2007

#Read data
pow <- read.table("Power.txt", 
                  sep=";", 
                  na.strings=c("?"), 
                  header=TRUE,
                  colClasses=c("character", 
                               "character", 
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric",
                                "numeric") ) 

#Convert date strings to date objects
pow$Date <- as.Date(pow$Date, "%d/%m/%Y")

#Create data subset for the 2 important days
powSub <- pow[pow$Date >= "2007-02-01" & pow$Date <= "2007-02-02",]


#Plot to PNG
png("plot1.png")

hist(powSub[,3], 
     col="red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)" )

dev.off()


