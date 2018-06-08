#
#

library(data.table)

# import the input data as data.tables
#SCC <- data.table(readRDS("Source_Classification_Code.rds"))
NEI <- data.table(readRDS("summarySCC_PM25.rds"))

# subset NEI data by year and calculate sum of emissions
neisub <- NEI[, .(emissions = sum(Emissions)), by = year]

# plot total emissions of US year wise
png("plot1.png")
plot(neisub,
     type = "l",
     lty = 2,
     lwd = 3,
     col = "grey",
     main = "Total Emissions in US",
     xlab = "Years (1999 - 2008)",
     ylab = "Emissions (Tonnes)")
points(neisub, pch = 19, cex = 1.5)
dev.off()