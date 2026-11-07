library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
d <- subset(NEI, fips %in% c("24510", "06037") & type == "ON-ROAD")
d$city <- ifelse(d$fips == "24510", "Baltimore City", "Los Angeles County")
agg <- aggregate(Emissions ~ year + city, d, sum)
agg$pct_change <- ave(agg$Emissions, agg$city,
                      FUN = function(x) (x / x[1] - 1) * 100)
png("plot6.png", width = 700, height = 500)
print(ggplot(agg, aes(year, pct_change, colour = city)) +
        geom_line() + geom_point() +
        labs(x = "Year", y = "% change in emissions since 1999",
             title = "Motor Vehicle PM2.5: Baltimore vs Los Angeles County"))
dev.off()