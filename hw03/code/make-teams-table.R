"===============================================================================
Title: Data Preperation for HW03
Description: Cleaning and creating data to use in the RMD file for HW03 in
            which we create ggplots relating to the data and conduct 
            PCA with the cleaned data. Also creating summary and image outputs
            in the process.
Inputs: nba2017-stats.csv, nba2017-roster.csv
Outputs: nba2017-teams.csv, efficiency-summary.txt, teams-summary.txt,
         teams_star_plot.pdf, experience_salary.pdf
==============================================================================="

# load packages
library(readr)
library(dplyr)
library(ggplot2)

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
teams <- merged_tbl %>% group_by(team) %>%
                                    summarise(
                                      experience = round(sum(experience), digits = 2),
                                      salary = round(sum(salary), digits = 2),
                                      points3 = sum(points3_made),
                                      points2 = sum(points2_made),
                                      free_throws = sum(points1_made),
                                      points = sum(points),
                                      off_rebounds = sum(off_rebounds),
                                      def_rebounds = sum(def_rebounds),
                                      assists = sum(assists),
                                      steals = sum(steals),
                                      blocks = sum(blocks),
                                      turnovers = sum(turnovers),
                                      fouls = sum(fouls),
                                      efficiency = sum(efficiency)
                                    )

# Sending teams summary to output
sink(file = "output/teams-summary.txt")
summary(teams)
sink()

# Writing CSV of teams data to output
write_csv(teams, path = "data/nba2017-teams.csv")

# Create a star plot of teams
pdf(file = "images/teams_star_plot.pdf")
stars(teams[ ,-1], labels = teams$team)
dev.off()

# Create a ggplot scatterplot between experience and salary
gplot <- ggplot(teams, aes(x = experience, y = salary)) +
  geom_point() + geom_label(aes(label = team))
ggsave("images/experience_salary.pdf", plot = gplot)
