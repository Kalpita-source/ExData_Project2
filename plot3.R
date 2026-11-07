library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
bal <- subset(NEI, fips == "24510")
agg <- aggregate(Emissions ~ year + type, bal, sum)
png("plot3.png", width = 700, height = 500)
print(ggplot(agg, aes(factor(year), Emissions)) +
        geom_col() + facet_wrap(~ type) +
        labs(x = "Year", y = "PM2.5 emissions (tons)",
             title = "Baltimore City PM2.5 Emissions by Source Type"))
dev.off()