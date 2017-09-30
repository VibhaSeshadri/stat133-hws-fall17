---
title: "nba2017-player-statistics-dictionary"
author: "Vibha Seshadri"
date: "September 29, 2017"
output: github_document
---

### Data Dictionary of Data Regarding NBA players
The data described in this dictionary contains information about NBA players on 30 major teams from 2017. The data is described in more detail below.

**Quick Facts**

- There are 441 rows in the data, each containing information about one NBA player
- There are 24 columns, described in detail below in this format
     - `R Object`: `Type` description
- Missing values are codified using `NA`

**R Objects**

- `Player`: `character` First and last names of player

- `Team`: `character` 3 Letter team abbreviation of the team player belongs to

- `Position`: `character` Player's position. Abbreviations are as follows:
     - `C` = Center
     - `PF` = Power Forward
     - `PG` = Point Guard
     - `SF` = Short Forward
     - `SG` = Shooting Guard

- `Experience`: `character` Years of experience in NBA, R stands for Rookie

- `Salary`: `double` Player salary in dollars

- `Rank`: `integer` Rank of player in his team

- `Age`: `integer` Age of player at the start of February 1st of that season.

- `GP`: `integer` Games played during regular season

- `GS`: `integer` Games started

- `MIN`: `integer` Minutes played during regular season

- `FGM`: `integer` Field goals made

- `FGA`: `integer` Field goals attempted

- `Points3`: `integer` 3 Point Field Goals

- `Points3_atts`: `integer` 3 Point Field Goal attempts

- `Points2`: `integer` 2-Point Field Goals

- `Points2_atts`: `integer` 2-Point Field Goal Attempts

- `FTM`: `integer` Free Throws Made

- `FTA`: `integer` Free Throw Attempts

- `OREB`: `integer` Offensive rebounds

- `DREB`: `integer` Defensive Rebounds

- `AST`: `integer` Assists

- `STL`: `integer` Steals

- `BLK`: `integer` Blocks

- `TO`: `integer` Turnovers

[Main Source of Data](www.basketball-reference.com)

[Data source for Golden State Warriors](www.basketball-reference.com/teams/GSW/2017.html)