NEI <- readRDS("summarySCC_PM25.rds")
total <- tapply(NEI$Emissions, NEI$year, sum)
png("plot1.png")
barplot(total, xlab = "Year", ylab = "Total PM2.5 emissions (tons)",
        main = "Total PM2.5 Emissions in the US")
dev.off()
