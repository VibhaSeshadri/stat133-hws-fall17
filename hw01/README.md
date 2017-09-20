# HW01 - Summarizing Variables

The purpose of this HW is to summarize variables (quantatitative and categorical) graphically and numerically.

Modify the content of this file.

**Some links to websites I used when stuck on a problem:**

* Rounding: 
http://www.dummies.com/programming/r/how-to-round-off-numbers-in-r/

* How cex should be used
http://groups.linguistics.northwestern.edu/speech_comm_group/documents/Presentation_par_cex.pdf

For the problem I had with abline() I figured out after looking through my code and realizing that my y-axis scale was different than the scale b0 and b1 were calculated with.

* Y-hat:
I found the latex way to do this, but I couldn’t find a way to make it show up in the markdown file, so I just found the y hat symbol online and just copied and pasted the character into my Rmd file

**References:**
I used the ? and ?? commands in the R console when I needed a more comprehensive explanation for what a function did. I also went to office hours when I was confused about something, and the ? and ?? commands as well as any webpages I found were not enough for me to understand the concept. Examples of functions I used the help function with in the R Console: abline(), lowess(), scatterplot3D(), boxplot(), text(), lines()

**Special Note to the Graders:**
For part 7, "Exploring Position and Experience" I have included a ylab argument in my call to the boxplot function, however my ylab is cut off from the md file. I tried to change the boxwex of my boxplot, but that did not bring the ylab into view. 