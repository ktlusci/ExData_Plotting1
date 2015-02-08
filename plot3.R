###  Create a line plots of Energy Sub Metering for Feb 1-2, 2007

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
png("plot3.png")

plot(powSub$DT, 
     powSub[,7],
     type="l",
     main="",
     xlab="",
     ylab="Energy sub metering")

lines(powSub$DT, powSub[,8], col="red")
lines(powSub$DT, powSub[,9], col="blue")

legend("topright",
       lty=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )

dev.off()


