up02-vibha-seshadri
================
Vibha Seshadri
September 11, 2017

#### Loading the `NBA data` into R Session

``` r
# loading data
load("data/nba2017-salary-points.RData")

#list available objects
ls()
```

    ## [1] "experience" "player"     "points"     "points1"    "points2"   
    ## [6] "points3"    "position"   "salary"     "team"

#### Exploring quantitative variable, `salary`, in the dataset

``` r
# output the summary statistics of the salary data
summary(salary)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##     5145  1286160  3500000  6187014  9250000 30963450

*The following commands illustrates individual functions you can use to produce individual statistics that are mostly in the output of `summary()`. I have used the data in the object `salary` to illustrate the following functions.*

``` r
# average salary
mean(salary)
```

    ## [1] 6187014

``` r
# median salary
median(salary)
```

    ## [1] 3500000

``` r
# standard deviation from mean of salary
sd(salary)
```

    ## [1] 6571890

``` r
# minimum salary
min(salary)
```

    ## [1] 5145

``` r
# maximum salary
max(salary)
```

    ## [1] 30963450

``` r
# first quartile value in salary
unname(quantile(salary, 1/4))
```

    ## [1] 1286160

``` r
# third quartile value in salary
unname(quantile(salary, 3/4))
```

    ## [1] 9250000

*Graphical display of `salary` data*

``` r
milSalary <- salary/1000000
# Histogram
hist(milSalary, xlab = "Salary (millions)", main = "2017 NBA Salary")
```

![](up02-vibha-seshadri_files/figure-markdown_github-ascii_identifiers/salaryDistr-1.png)

``` r
# Boxplot
boxplot(milSalary, horizontal = TRUE, xlab = "Salary (millions)", main = "2017 NBA Salary")
```

![](up02-vibha-seshadri_files/figure-markdown_github-ascii_identifiers/salaryDistr-2.png)

``` r
# Density Polygon
denseSalary <- density(milSalary)
plot(denseSalary, xlab = "Salary (Millions)", main="2017 NBA Salary")
polygon(denseSalary, col="blue", border="blue")
```

![](up02-vibha-seshadri_files/figure-markdown_github-ascii_identifiers/salaryDistr-3.png)

**Description of the distribution of** `salary` **data**

The salary of NBA players is skewed right, with the median salary being $ 3.5 million dollars. The salary of NBA players ranges from $ 5145 to $ 30.96345 million dollars. There are quite a few salaries above $ 11.94576, the upper boundary of the data, so there appear to be quite a few upper outliers, but no lower outliers.

*The following functions output the statistical summary of the rest of the numeric variables.*

``` r
# experience
# replace "R," which stands for Rookie with "1" and change the experience
# data object to be of type integer as opposed to type character
newExp <- replace(experience, experience == "R", "1")
newExp <- as.integer(newExp)
summary(newExp)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   1.000   1.000   4.000   4.857   7.000  18.000

``` r
# points
summary(points)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0   156.0   432.0   546.6   780.0  2558.0

``` r
# points1
summary(points1)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00   21.00   58.00   92.47  120.00  746.00

``` r
# points2
summary(points2)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0    39.0   111.0   152.5   213.0   730.0

``` r
# points3
summary(points3)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00    3.00   32.00   49.71   78.00  324.00

#### Exploring Qualitative object `team`

``` r
# Creating table of frequencies of team
table(team)
```

    ## team
    ## ATL BOS BRK CHI CHO CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN 
    ##  14  15  15  15  15  15  15  15  15  15  14  14  15  15  15  14  14  14 
    ## NOP NYK OKC ORL PHI PHO POR SAC SAS TOR UTA WAS 
    ##  14  15  15  15  15  15  14  15  15  15  15  14

``` r
# Calculating relative frequency of teams which appear in team data
prop.table(table(team))
```

    ## team
    ##        ATL        BOS        BRK        CHI        CHO        CLE 
    ## 0.03174603 0.03401361 0.03401361 0.03401361 0.03401361 0.03401361 
    ##        DAL        DEN        DET        GSW        HOU        IND 
    ## 0.03401361 0.03401361 0.03401361 0.03401361 0.03174603 0.03174603 
    ##        LAC        LAL        MEM        MIA        MIL        MIN 
    ## 0.03401361 0.03401361 0.03401361 0.03174603 0.03174603 0.03174603 
    ##        NOP        NYK        OKC        ORL        PHI        PHO 
    ## 0.03174603 0.03401361 0.03401361 0.03401361 0.03401361 0.03401361 
    ##        POR        SAC        SAS        TOR        UTA        WAS 
    ## 0.03174603 0.03401361 0.03401361 0.03401361 0.03401361 0.03174603

``` r
# Creating barplot showing frequency with which each team appears in the team data
barplot(prop.table(table(team)), cex.names = 0.32, xlim = c(1,100), width = 3, xpd = TRUE)
```

![](up02-vibha-seshadri_files/figure-markdown_github-ascii_identifiers/tableTeam-1.png)

**Description of distribution of number of players on each team in** `team`

The teams are relatively equally sized in the NBA as evident by the lack of skew in this distribution. A couple of teams, such as `ATL` or `SAC` have fewer players, at most 1 player less as evident in the first table of teams. Each team represented in this data set has 15 or 14, so there are no outliers. The average number of players on a team is 14.7 players.

##### Reflections on this assignment

I really enjoyed this assignment because it was fun to figure out how to manipulate the data objects we were given to display them correctly. The hardest part of this assignment, as well as the most fun part of this assignment, was producing the summary statistics for the variable experience. I really enjoyed learning how to coerce a character vector with numeric values represented as strings to an integer vector where all the representations were actually integers. The hardest part of the problem was trying to get rid of the `NA` value which would appear whenever I was coercing the object to be an integer. It turns out I was nondestructively coercing it which was why when I called `as.integer()` all the `"R"` values would become NA. I just had to save the return vector from `replace()` and use that vector in my manipulation to get the summary statistics. To figure this out, I googled any question I had that I thought may help me figure out the answer, and asked questions before lecture started. The main websites I used to help me do this were Quora and Stack Overflow. The one thing I forgot to do in this assignment was use r functions in my descriptions of graphical display. Luckily, I realized as I was about to turn it in. Now any numbers in my R markdown file are not hardcoded, they are calculated by functions. So, if any data changes, my markdown file will change without me having to do anything since I'm using functions anywhere numerical description and data is involved.
