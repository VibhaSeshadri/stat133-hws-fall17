Homework 1: Summarizing Variables
================
Vibha Seshadri
September 18, 2017

``` r
# loading data
load("../data/nba2017-salary-points.RData")

# listing available objects
ls()
```

    ## [1] "experience" "player"     "points"     "points1"    "points2"   
    ## [6] "points3"    "position"   "salary"     "team"

``` r
# simplifying representation of dollar quantities stored in salary
milSalary <- salary/1000000
milSalary <- round(milSalary, digits = 2)
```

``` r
# creating a new vector that holds numeric representation of experience, previously a vector of type char
experience <- replace(experience, experience == "R", "0")
experience <- as.integer(experience)
```

``` r
# changing variable position from character vector to factor with more descriptive labels
position <- factor(position, labels = c("center", "power_fwd", "point_guard", "small_fwd", "shoot_guard"))

# calculate frequency of positions in factor, position
table(position)
```

    ## position
    ##      center   power_fwd point_guard   small_fwd shoot_guard 
    ##          89          89          85          83          95

``` r
# creating a scatterplot to analyze the relationship between points and salary
plot(points, milSalary, xlab = "Points", ylab = "Salary (millions)", 
     main = "Relationship Between Points and Salary", col = c("light blue"),
     cex.main = "1", cex.lab = "1", pch = 16)
```

![](hw01-vibha-seshadri_files/figure-markdown_github-ascii_identifiers/scatterPlot-1.png)

The scatterplot above illustrates a positive relationship between the number of `points` a player makes and his resulting `salary`. The majority of the data is clustered in the lower left corner of the scatterplot, and begins to uncluster and grow with a positive slope as players gain more than 432 total points. There are, however, many points on the graph which do not follow the positive trend of the majority of points. The most total points a player has made is 2558 points, but this player does not have the highest salary. This player with 2558 has a salary of $26.54. The highest salary appears to be around $30.96 dollars and is the salary of a player who has a total of 1954 points.
