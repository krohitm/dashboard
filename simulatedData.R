library(dplyr)
library(lubridate)

set.seed(1)
#function for simulating data
sourceData <- function () {
  date <-
    seq(ymd('2010/03/01'), ymd(Sys.Date()), by = "month")
  
  #simulating budget revenue for different deparmtents
  propertyTaxBudget <-
    rnorm(length(date), mean = 11704.82, sd = 61.105) %>%
    sample()
  TIFRevenuesBudget <- rnorm(length(date), mean = 28116.6, sd = 1445.0) %>%
    sample()
  OtherCityTaxesBudget <-
    rnorm(length(date), mean = 31873.7, sd = 1806.7) %>%
    sample()
  LicensesBudget <- rnorm(length(date), mean = 37965, sd = 2426.0) %>%
    sample()
  ServiceBudget <- rnorm(length(date), mean = 19365.83, sd = 109.94) %>%
    sample()
  
  #simulating actual revenue for depertments
  propertyTaxActual <-
    rnorm(length(date), mean = 10812.08, sd = 56.610) %>%
    sample()
  TIFRevenuesActual <- rnorm(length(date), mean = 26115.5, sd = 1345.0) %>%
    sample()
  OtherCityTaxesActual <-
    rnorm(length(date), mean = 33403.1, sd = 1769.6) %>%
    sample()
  LicensesActual <- rnorm(length(date), mean = 43847, sd = 2796.8) %>%
    sample()
  ServiceActual <- rnorm(length(date), mean = 18957.65, sd = 106.07) %>%
    sample()
  
  revenueData <- cbind(
    date,
    propertyTaxBudget,
    TIFRevenuesBudget,
    OtherCityTaxesBudget,
    LicensesBudget,
    ServiceBudget,
    propertyTaxActual,
    TIFRevenuesActual,
    OtherCityTaxesActual,
    LicensesActual,
    ServiceActual
  ) %>%
    as_tibble()
  revenueData <- abs(revenueData)
  
  #revenueData$date <- as_date(revenueData$date)
  return(revenueData)
}