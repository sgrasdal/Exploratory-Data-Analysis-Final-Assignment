# Plot 4 Comparison of Vehicle sources of pollution in the Baltimore City (1999 - 2008)
# 
# Setup

setwd("C:/Users/sgras/OneDrive/Documents/School/WNTR 2024/Exploratory Data Analysis/Week4/Assignment")
library(dplyr)
library(ggplot2)

# Plot 
## A histogram of Motor vehicle related pollution in Baltimore City (1999 - 2008). 

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_by_year <- NEI %>%
        filter(fips == "24510" & type == "ON-ROAD") %>%
        group_by(year) %>%
        summarize(total_emissions = sum(Emissions))

emissions_by_year$year <- as.factor(emissions_by_year$year)

ggplot(emissions_by_year, aes(x=year, y=total_emissions)) + 
        geom_bar(stat="identity") + 
        labs(x="Year", y="PM2.5 Emissions (tons)") + 
        ggtitle("Baltimore City PM2.5 Emissions from Vehicle Related Sources")

dev.copy(png,'plot5.png')
dev.off()