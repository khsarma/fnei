#
# R Script to answer the question:
#   Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# 
# Author: Hemasundar
# 8-June-2018
#
# Uses base plotting system
# Plot to show total PM2.5 emission from all sources by years - 1999, 2002, 2005, and 2008

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