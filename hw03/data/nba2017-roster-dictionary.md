---
title: "NBA2017 Roster Data Dictionary"
author: "Vibha Seshadri"
date: "October 14, 2017"
output: github_document
---

### Data Dictionary of NBA 2017 Roster
The data described in this dictionary contains information regarding an NBA player's personal and professional information, but does not contain any information about the player's basketball statistics.

**Quick Facts**

- There are 441 rows in the data, each containing information about one NBA player
- There are 8 columns, described in detail below in this format
     - `R Object`: `Type` description
- Missing values are codified using `NA`

**R Objects**

- `player`: `character` First and last names of player

- `team`: `character` 3 Letter team abbreviation of the team player belongs to

- `position`: `character` Player's position. Abbreviations are as follows:
     - `C` = Center
     - `PF` = Power Forward
     - `PG` = Point Guard
     - `SF` = Short Forward
     - `SG` = Shooting Guard

- `height`: `integer` Height of the player (in inches)

- `weight`: `integer` Weight of player (in pounds)

- `age`: `integer` Player's age (in years)

- `experience`: `integer` How much experience player has playing professionally in NBA (in years)

- `salary`: `double` How much player makes in a season from their NBA salary (in US dollars)

[Main Source of Data](www.basketball-reference.com)

[Data source for Golden State Warriors](www.basketball-reference.com/teams/GSW/2017.html)