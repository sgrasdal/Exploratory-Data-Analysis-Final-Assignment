# Plot 1 Total Emissions in the U.S. (1999 - 2008)
# 
#Setup

setwd("C:/Users/sgras/OneDrive/Documents/School/WNTR 2024/Exploratory Data Analysis/Week4/Assignment")
library(dplyr)

# Plot 
## A bar plot that shows the pollution for years 1999, 2002, 2005, and 2008

NEI <- readRDS("exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata_data_NEI_data/Source_Classification_Code.rds")

emissions_by_year <- NEI %>%
        group_by(year) %>%
        summarize(total_emissions = sum(Emissions))

with(emissions_by_year, barplot(total_emissions, names.arg = year, xlab = "Year", ylab = "PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions in the U.S. from All Sources"))

dev.copy(png,'plot1.png')
dev.off()

