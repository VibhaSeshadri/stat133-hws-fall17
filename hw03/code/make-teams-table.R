#===============================================================================
#Title:
#Description:
#Inputs:
#Outputs:
#===============================================================================

# load packages
library(readr)
library(dplyr)

# Creating data frame for nba2017-stats.csv
stat <- read_csv('data/nba2017-stats.csv')

# Creating data from for nba2017-roster.csv
roster <- read_csv('data/nba2017-roster.csv')

# Mutating stat
stat <- mutate(stat, missed_fg = field_goals_atts - field_goals_made)
stat <- mutate(stat, missed_ft = points1_atts - points1_made)
stat <- mutate(stat, points = points1_made + points2_made*2 + points3_made * 3)
stat <- mutate(stat, rebounds = off_rebounds + def_rebounds)
stat <- mutate(stat, efficiency = (points + rebounds + assists + steals + blocks 
                            - missed_fg - missed_ft - turnovers) / games_played)

# Sending summary of stat efficiency to output/efficiency-summary.txt
sink(file = "output/efficiency-summary.txt")
summary(stat$efficiency)
sink()

# Joining Stat dataframe and Roster together
merged_tbl <- left_join(stat, roster)

# Creating data frame teams
cols <- c("team", "experience", "salary", "points3_made", "points2_made", 
          "points1_made", "points", "off_rebounds", "def_rebounds",
          "assists", "steals", "blocks", "turnovers", "fouls", "efficiency")
teams <- merged_tbl %>% group_by(team) %>% select(cols)
