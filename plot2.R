# Plot 2 Total Emissions in Baltimore City (1999 - 2008)
# 
#Setup

setwd("C:/Users/sgras/OneDrive/Documents/School/WNTR 2024/Exploratory Data Analysis/Week4/Assignment")
library(dplyr)

# Plot 
## A bar plot that shows the pollution in Baltimore City for years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- NEI %>%
        filter(fips == "24510") %>%
        group_by(year) %>%
        summarize(total_emissions = sum(Emissions))

with(emissions_by_year, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from Baltimore City Sources"))

dev.copy(png,'plot2.png')
dev.off()
