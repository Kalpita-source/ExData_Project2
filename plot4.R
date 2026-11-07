NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal <- SCC[grepl("Coal", SCC$EI.Sector), "SCC"]
d <- subset(NEI, SCC %in% coal)
total <- tapply(d$Emissions, d$year, sum)
png("plot4.png")
barplot(total, xlab = "Year", ylab = "PM2.5 emissions (tons)",
        main = "US Coal Combustion PM2.5 Emissions")
dev.off()