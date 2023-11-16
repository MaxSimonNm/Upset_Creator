# Library Import
require(ggplot2); require(plyr); require(gridExtra); require(grid);
require(UpSetR);require(readxl)

#Dataset Import
"""
Dataset Head View
                                Name ReleaseDate Action Adventure Children Comedy Crime Documentary Drama Fantasy Noir Horror Musical ... 
1                   Toy Story (1995)        1995      0         0        1      1     0           0     0       0    0      0       0
2                     Jumanji (1995)        1995      0         1        1      0     0           0     0       1    0      0       0
3            Grumpier Old Men (1995)        1995      0         0        0      1     0           0     0       0    0      0       0
4           Waiting to Exhale (1995)        1995      0         0        0      1     0           0     1       0    0      0       0
5 Father of the Bride Part II (1995)        1995      0         0        0      1     0           0     0       0    0      0       0 
6                        Heat (1995)        1995      1         0        0      0     1           0     0       0    0      0       0
"""
movies <- read.csv(system.file("extdata", "movies.csv", package = "UpSetR"), 
                   header = T, sep = ";")

# Top Largest Set Choosing and Plot Formatting
"""
upset([Dataframe],
      nsets = [Selects the n largest sets from the data], 
      number.angles = [determines the angle (in degrees) of the numbers above the intersection size bars], 
      point.size = [changes the size of the circles in the matrix], 
      line.size = [changes the size of the lines connecting the circles in the matrix], 
      mainbar.y.label = [change the axis labels on the intersection size bar plot], 
      sets.x.label = [change the axis labels on the set size bar plot], 
      text.scale = c(intersection size title, 
                      intersection size tick labels, 
                      set size title, 
                      set size tick labels, 
                      set names, 
                      numbers above bars)) [allows scaling]
"""
upset(movies,
      nsets = 6, 
      number.angles = 30, 
      point.size = 3.5, 
      line.size = 2, 
      mainbar.y.label = "Genre Intersections", 
      sets.x.label = "Movies Per Genre", 
      text.scale = c(1.3, 1.3, 1, 1, 2, 0.75))

# Specific Sets Choosing and Matrix Ordering
"""
upset(movies, 
      sets = c("Action", "Adventure", "Comedy", "Drama", "Mystery", "Thriller",
      "Romance", "War", "Western") [Col names to be considered for Sets], 
      mb.ratio = c(0.55, 0.45) [change the proportions of the plot heights by entering as percentages], 
      order.by = [Options are: Frequency, Degree and Degree & Frequency])
"""
## Matrix Ordering by Frequency
upset(movies, sets = c("Action", "Adventure", "Comedy", "Drama", "Mystery", 
                       "Thriller", "Romance", "War", "Western"), mb.ratio = c(0.55, 0.45), order.by = "freq")

## Matrix Ordering by Degree
upset(movies, sets = c("Action", "Adventure", "Comedy", "Drama", "Mystery", 
                       "Thriller", "Romance", "War", "Western"), mb.ratio = c(0.55, 0.45), order.by = "degree")

## Matrix Ordering by first Degree and then Frequency
upset(movies, sets = c("Action", "Adventure", "Comedy", "Drama", "Mystery", 
                       "Thriller", "Romance", "War", "Western"), mb.ratio = c(0.55, 0.45), order.by = c("degree", "freq"))

#
