---
title: "Cleanscores Data Dictionary"
author: "Vibha Seshadri"
date: "November 16, 2017"
output: github_document
---

### Data Dictionary of Cleanscores
The data described in this dictionary contains information regarding a student's overall grade
as well as individual components of the student's grade.

**Quick Facts**

- There are 334 rows in the data, each containing information about one student
- There are 23 columns, described in detail below in this format
     - `R Object`: `Type` description
- Missing values generally codified using `NA`, but all missing values were converted to `0`
so this dataset should only contain data that can be manipulated

**R Objects**

- `HW1`: `numeric` Score for HW1, out of 100 points
- `HW2`: `numeric` Score for HW2, out of 100 points
- `HW3`: `numeric` Score for HW3, out of 100 points
- `HW4`: `numeric` Score for HW4, out of 100 points
- `HW5`: `numeric` Score for HW5, out of 100 points
- `HW6`: `numeric` Score for HW6, out of 100 points
- `HW7`: `numeric` Score for HW7, out of 100 points
- `HW8`: `numeric` Score for HW8, out of 100 points
- `HW9`: `numeric` Score for HW9, out of 100 points
- `ATT`: `numeric` Total lab attendance for the semester
- `QZ1`: `numeric` Score for QZ1, out of 100 points
- `QZ2`: `numeric` Score for QZ2, out of 100 points
- `QZ3`: `numeric` Score for QZ3, out of 100 points
- `QZ4`: `numeric` Score for QZ4, out of 100 points
- `EX1`: `numeric` Score for Exam 1, out of 80 points
- `EX2`: `numeric` Score for Exam 2, out of 90 points
- `Test1`: `numeric` Score for Exam 1, rescaled out of 100
- `Test2`: `numeric` Score for Exam 2, rescaled out of 100
- `Homework`: `numeric` Average score of the 9 homeworks, with lowest homework grade dropped
- `Quiz`: `numeric` Average score of the four quizzes, with lowest quiz grade dropped
- `Lab`: `numeric` Lab score based on amount of lab attendance. Rescaled to be out of 100.
- `Overall`: `numeric` Students overall grade in course, scaled out of 100.
- `Grade`: `character` Letter grade corresponding to `Overall`
