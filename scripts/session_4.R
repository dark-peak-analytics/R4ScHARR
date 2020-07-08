#=============
# R4ScHARR 
# Robert Smith & Paul Schneider
# Session 4 Script
#=============

#=================================================================#
# Ignore this section
# pre-loaded the gapminder package from the library & wrote to github
# install.packages("gapminder")
# library(gapminder)
# write.csv(x = df_gapminder,file = "data/df_gapminder.csv",row.names = F)
#=================================================================#

# clear environment
rm(list = ls())

# read in the data from github
df_gapminder <- read.csv(file = "https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_gapminder.csv")

# lets look at the start of the data-set
head(df_gapminder)

# now lets see some basic summary stats:
str(df_gapminder)
summary(df_gapminder)

# lets see just data from 2007
df_2007 <- df_gapminder[df_gapminder$year == 2007,]
head(df_2007)

# lets see just data from 1800
df_1952 <- df_gapminder[df_gapminder$year == 1952,]
head(df_1952)


# which country had the highest GDPpc in 2007?
df_2007[which.max(df_2007$gdpPercap),]

#============== QUESTION =======
# which country had the highest GDPpc in 1952?
# df_1952[which.max(df_1952$gdpPercap),]

#============== QUESTION =======
# which country had the longest life expectancy in 2007?
# df_2007[which.max(df_2007$lifeExp),]

# lets create a simple scatter plot for GDPpc & life expectancy in 2007
plot(x = df_2007$gdpPercap,
     y = df_2007$lifeExp,
     type = "p",
     xlab = "GDP per Capita ($)",
     ylab = "Life Expectancy",
     main = "Life Expectancy and GDP per capita in 2007"
      )

#============== QUESTION =======
# Can we recreate the plot for 1800?
plot(x = df_1952$gdpPercap,
     y = df_1952$lifeExp,
     type = "p",
     xlab = "GDP per Capita ($)",
     ylab = "Life Expectancy",
     main = "Life Expectancy and GDP per capita in 2007"
)

#there is a problem, can we remove the outlier?
df_plot <- df_1952[-which.max(df_1952$gdpPercap),]

plot(x = df_plot$gdpPercap,
     y = df_plot$lifeExp,
     type = "p",
     xlab = "GDP per Capita ($)",
     ylab = "Life Expectancy",
     main = "Life Expectancy and GDP per capita in 1952"
)

#### these plots are very basic ... enter ggplot2

#install.packages(ggplot2)
library(ggplot2)
head(df_gapminder)

# we can use ggplot as above.
ggplot(data = df_gapminder[df_gapminder$year %in% 1952,],
       aes(x = gdpPercap, y = lifeExp))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")

# but we can change sizes to represent populations
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952),],
       aes(x = gdpPercap, y = lifeExp, size = pop))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")

# and add in colors to represent continents
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952),],
       aes(x = gdpPercap, y = lifeExp, size = pop, col = continent))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")

# and put two plots together to show the change from 1952 to 2007
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
       aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
facet_grid(~year)


# the gdp data is not very uniformly distributed, 
# lot of poorer countries and a few rich ones.
hist(df_gapminder[df_gapminder$year %in% c(2007),"gdpPercap"])

# can therefore change the x axis to be on a log scale
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
       aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  scale_x_log10()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  facet_grid(~year) 

# can also change the theme to classic
ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
       aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  scale_x_log10()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  theme_classic() + 
  facet_grid(~year) 

# we can store ggplot plots as objects
plot1 <- ggplot(data = df_gapminder[df_gapminder$year %in% c(1952,2007),],
                aes(x = gdpPercap, y = lifeExp, col = continent,size = pop))+
  geom_point()+
  scale_x_log10()+
  labs(title = "Life Expectancy and GDP per capita in 1952",
       x = "GDP per Capita ($)",
       y = "Life Expectancy")+
  theme_classic() + 
  facet_grid(~year) 

ggsave(plot = plot1,
       filename = "outputs/gapminderplot.png")


#========================================================#
# create an animation

rm(list = ls())
# install.packages("gganimate")
# this is a development version of gganimate (currently in production)
# devtools::install_github('thomasp85/gganimate')

library(gganimate)
#library(gapminder)

df_gapminder <- read.csv("https://raw.githubusercontent.com/ScHARR-PHEDS/R4ScHARR/master/data/df_gapminder.csv")

theme_set(theme_bw())

# a single animation plot
ggplot(data = df_gapminder,
       aes(x = gdpPercap, y=lifeExp, size = pop, colour = country)) +
  geom_point(show.legend = FALSE, alpha = 0.7) +
  scale_color_viridis_d() +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  labs(x = "GDP per capita ($)", y = "Life expectancy")+
    # animation specific
  transition_time(year) +
  labs(title = 'Year: {frame_time}',x = 'GDP per capita', y = 'life expectancy')

# with a facet
  ggplot(df_gapminder, 
         aes(gdpPercap, lifeExp, size = pop, colour = country)) +
    geom_point(alpha = 0.7, show.legend = FALSE) +
    scale_colour_manual(values = country_colors) +
    scale_size(range = c(2, 12)) +
    scale_x_log10() +
    facet_wrap(~continent) +
    # Here comes the gganimate specific bits
    labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
    transition_time(year) +
    ease_aes('linear')

















