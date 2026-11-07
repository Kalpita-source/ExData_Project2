NEI <- readRDS("summarySCC_PM25.rds")
d <- subset(NEI, fips == "24510" & type == "ON-ROAD")
total <- tapply(d$Emissions, d$year, sum)
png("plot5.png")
barplot(total, xlab = "Year", ylab = "PM2.5 emissions (tons)",
        main = "Baltimore City Motor Vehicle PM2.5 Emissions")
dev.off()