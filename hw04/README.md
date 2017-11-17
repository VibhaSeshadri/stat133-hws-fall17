#### HW04 - Grades Visualizer

The purpose of this HW was to work on a small data computing and visualization project.

**Some links to websites I used when stuck on a problem:**

The Shiny App Widgets Gallery: https://shiny.rstudio.com/gallery/

ggvis basic documentation: https://ggvis.rstudio.com/ggvis-basics.html

`layer_smooth()` documentation: https://www.rdocumentation.org/packages/ggvis/versions/0.4.3/topics/layer_model_predictions

**References:** Conditional Panels app example in Stat133 git hub repository, Lecture slides String basics, and `?` and `??` on various functions such a `cat`, `prop`, and `as.symbol`


#### Comments and Reflections
I really enjoyed this homework, because I feel like at the end of it I could really see how everything we have been doing this semester came together! Also once I got the hang of it, I loved the shiny app because it was so cool to see the code I had written being used interactively in a way which was optimal to any user who wanted information about the dataset. This was not my first time writing unit tests, but writing them was helpful in making sure the rest of this homework (especially cleaning the data and the shiny app) went smoothly! On a scale of 0 to 10 I found using `testthat` to be a 1 as I think the hardest part of using it was understanding why one should use `expect_equal` and opposed to `expect_identical`. This was, however, my first time working with `ggvis`. On a scale of 0 to 10, learning the syntax was around 5 just because it was new, but having known how to use `ggplot2` prior to `ggvis` was helpful. Luckily there were great resources online to help me understand the syntax of `ggvis`. On a scale of 0 to 10 I found using the conditional panels to be a 2 or 3 because we had covered them in leture, and the app examples that are in the stat133 repository folder were very helpful. Of all the graphing paradigms we have used so far in the course (`base plot`, `ggplot`, `ggvis`), my favorite is definitely `ggvis` because it's so dynamic! I personally like the graphics of `ggvis` the best as well! It helps make the UI of the app very easy to use and friendly. I did have some help in completing the homework on the parts that I was stuck in most, such as the formatting of `print_stats`. I worked with my friend Alekya Mallina to figure the method out. It took me around 7-8 hours to finish the homework, split over a week. The most time consuming part of the homework was writing the functions and unit tests since there were so many. The next most consuming thing was the shiny app. Actually learning how to create a shiny app from scratch took time since I had to do a lot of research. But once I finished understanding `ggvis` and all the other components which went in the app, it took an hour and a half or so to complete since we had already written all the functions and cleaned up the data in previous parts of the homework!


#### Running the app
```{r}
library(shiny)

# Run an app from a subdirectory in the repo
runGitHub("stat133-hws-fall17", "VibhaSeshadri", subdir = "hw04/app")
```