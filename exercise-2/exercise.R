### Exercise 2: Data Frame Practice with dplyr

## This exercise need the "fueleconomy" package.  Install and load it.
## You should have have access to the `vehicles` data.frame
#install.packages('fueleconomy')
#library(fueleconomy)
## Install (if you haven't already) and load the `dplyr`package
#install.packages('dplyr')
#library(dplyr)
# You should have have access to the `vehicles` data.frame


# Create a data.frame of vehicles from 1997
cars_1997 <- vehicles[vehicles$year == 1997,]
cars_1997 <- filter(vehicles,year == 1997)
View(cars_1997)

# Use the `unique` function to verify that there is only 1 value in the `year` column of your new data.frame
print(unique(cars_1997$year))

# Create a data.frame of 2-Wheel Drive vehicles that get more than 20 miles/gallon in the city
two_wheel <- data.frame(vehicles[vehicles$drive == '2-Wheel Drive' & vehicles$cty > 20,])
two_wheel <- filter(vehicles, drive == "2-Wheel Drive", cty>20)
View(two_wheel)

# Of those vehicles, what is the vehicle ID of the vehicle with the worst hwy mpg?
filtered.mpg <- filter(two_wheel, hwy == min(hwy))
worst.hwy.id <- select(filtered.mpg, id)

View(filtered.mpg)
View(worst.hwy.id)
# Write a function that takes a `year` and a `make` as parameters, and returns 
# The vehicle that gets the most hwy miles/gallon of vehicles of that make in that year
MakeYearFilter <- function(my_make, my_year) {
filtered <- filter(vehicles, year == my_year, make == my_make) %>%
 filter(hwy == max(hwy))
  return(filtered)
}
# What was the most efficient honda model of 1995?
print(MakeYearFilter("Honda", 1995))

