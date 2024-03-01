#We start installing both packages for this mini project
#This Library has the dataset of penguins its body mass, flipper lenght and bill length
install.packages("palmerpenguins")

#This package is an overlord package containing tons of useful functions
install.packages("tidyverse")

#We load the penguins dataset
library("palmerpenguins")

#Among the functions in tidyverse we are focused on GGPLOT2 which is useful to plot data into charts
library("ggplot2")

install.packages("tidyr")
library("tidyr")

#We create a plot showing the relation between flipper length and body mass in penguins.
#The plot shows us that bigger the penguin, longer the flipper
ggplot(data=penguins) + 
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g))

#No relationship between bill length and bill depth
ggplot(data=penguins) + 
  geom_point(mapping=aes(x=bill_length_mm, y=bill_depth_mm))

#We add more aesthetic to the plot
penguins %>% drop_na(sex) %>%
ggplot() + 
  labs(y= "Flipper  Length (mm)", x="Body Mass (g)") +
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, shape=species, color=species)) + 
  scale_colour_manual(values = c("chartreuse4", "firebrick1","dodgerblue3" )) +
  geom_smooth(mapping=aes(x=flipper_length_mm, y=body_mass_g))

#the use of scale_colour_manual(value = c(values)) is to choose the color we want for the chart.

#We use a pipe to clear the null values first with drop_na and then plot the information
penguins %>% drop_na(sex) %>% 
ggplot() + 
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, shape=species, color=species)) +
  #we use labs to change the label name of the x and y
  labs(y= "Flipper  Length (mm)", x="Body Mass (g)") +
  scale_colour_manual(values = c("chartreuse4", "firebrick1","dodgerblue3" )) +
  #Facet_wrap allows us to create different plots for different captions we want to focus 
  facet_wrap(species~sex)

penguins %>% drop_na(sex) %>% 
  ggplot() + 
  geom_point(mapping=aes(x=flipper_length_mm, y=body_mass_g, shape=species, color=species)) +
  labs(y= "Flipper  Length (mm)", x="Body Mass (g)") +
  scale_colour_manual(values = c("chartreuse4", "firebrick1","dodgerblue3" )) +
  facet_wrap(species~sex)
              