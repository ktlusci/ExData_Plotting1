###  Create a line plot of Global Active Power for Feb 1-2, 2007

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

#Combine date & time into 1 field
powSub$DT <- strptime(
              paste(powSub$Date, powSub$Time), 
              format="%Y-%m-%d %H:%M:%S")


#Plot to PNG
png("plot2.png")

plot(powSub$DT,
     powSub[,3], 
     type="l",
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)" )

dev.off()


