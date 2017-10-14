---
title: "NBA2017 Statistics Data Dictionary"
author: "Vibha Seshadri"
date: "October 14, 2017"
output: github_dictionary
---

### Data Dictionary of NBA 2017 Statistics
The data described in this dictionary contains information regarding an NBA player's NBA statistics,
and no personal information. Personal information about the players can be found in the NBA2017 Roster Dictionary.

**Quick Facts**

- There are 441 rows in the data, each containing information about one NBA player
- There are 27 columns, described in detail below in this format
     - `R Object`: `Type` description
- Missing values are codified using `NA`

**R Objects**

- `player`: `character` First and last names of player

- `games_played`: `integer` Number of games player has contributed in for their team

- `minutes`: `integer` Number of minutes player has played total in the NBA in 2017

- `field_goals_made`: `integer` Number of field goals player has made in the NBA in 2017

- `field_goals_atts`: `integer` Number of field goals player has attempted in the NBA in 2017

- `field_goals_perc`: `double` Percentage of field goals player made in the NBA in 2017

- `points3_made`: `integer` Number of 3 pointers player has made in the NBA in 2017

- `points3_atts`: `integer` Number of 3 pointers player has attempted in the NBA in 2017

- `points3_perc`: `double` Percentage of 3 pointers player has made in the NBA in 2017

- `points2_made`: `integer` Number of 2 pointers player has made in the NBA in 2017

- `points2_atts`: `integer` Number of 2 pointers player has attempted in the NBA in 2017

- `points2_perc`: `double` Percentage of 2 pointers player has made in the NBA in 2017

- `points1_made`: `integer` Number of 1 pointers player has made in the NBA in 2017

- `points1_atts`: `integer` Number of 1 pointers player has attempted in the NBA in 2017

- `points1_perc`: `double` Percentage of 1 pointers player has made in the NBA in 2017

- `off_rebounds`: `integer` Number of offensive rebounds player has made in the NBA in 2017

- `def_rebounds`: `integer` Number of defensive rebounds player has made in the NBA in 2017

- `assists`: `integer` Number of assists player has made in the NBA in 2017

- `steals`: `integer` Number of steals player has made in the NBA in 2017

- `blocks`: `integer` Number of blocks player has made in the NBA in 2017

- `turnovers`: `integer` Number of turnovers player has made in the NBA in 2017

- `fouls`: `integer` Number of fouls player has made in the NBA in 2017

[Main Source of Data](www.basketball-reference.com)

[Data source for Golden State Warriors](www.basketball-reference.com/teams/GSW/2017.html)