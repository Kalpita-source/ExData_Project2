NEI <- readRDS("summarySCC_PM25.rds")
bal <- subset(NEI, fips == "24510")
total <- tapply(bal$Emissions, bal$year, sum)
png("plot2.png")
barplot(total, xlab = "Year", ylab = "Total PM2.5 emissions (tons)",
        main = "Total PM2.5 Emissions in Baltimore City")
dev.off()