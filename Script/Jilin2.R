library(tidyverse)
library(readxl)
library(cowplot)
Jilin_carbonisation_data_july2019 <- read_excel("Data/Jilin_carbonisation_July_2019JK.xlsx", sheet=1)
str(Jilin_carbonisation_data_july2019)
# From the data, I want to select experiment 1,2,3 and plot strength, Emax, Diameter, work, linear density, initial modulus for LT and HT samples
Experiment_a <- Jilin_carbonisation_data_july2019 %>%
  filter(Experiment %in% c(1,2,3)) %>%
  filter(Zones %in% c("Zone 1","Zone 2","Zone 3", "Zone 4"))

str(Experiment_a)
#Make a plot with variables strength, diameter, modulus, elongation with line speed

# Recode your variables because there was no graph displayed
Experiment_a$Zones<-as.factor(Experiment_a$Zones)
Experiment_a$Tensile_Strength<- as.numeric(Experiment_a$Tensile_Strength)
Experiment_a$Diameter <- as.numeric(Experiment_a$Diameter)
Experiment_a$Experiment<-as.factor(Experiment_a$Experiment)
Experiment_a$Emax <- as.numeric(Experiment_a$Emax)
Experiment_a$Ini.Modul <- as.numeric(Experiment_a$Ini.Modul)
str(Experiment_a)
Experiment_b <- Experiment_a%>% 
  mutate(Zones=fct_relevel(Zones,"Zone 1","Zone 2","Zone 3", "Zone 4"))
str(Experiment_b)
# Retry plotting it
Line_speed_plot <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, shape = Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple")) 
Line_speed_plot
Line_speed_plot1 <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, colour = Experiment, shape = Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple"))  + scale_shape_manual(values=c(1,2,6,15,3,4))
Line_speed_plot1
# plot graph by changing variables on various axis
Line_speed_plot2<- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Ini.Modul,colour = Experiment, shape=Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple"))  + scale_shape_manual(values=c(1,2,6,7,5,3,4))
Line_speed_plot2

# Do this for low temperature, high temperature and Tow zones
Experiment_a <- Jilin_carbonisation_data_july2019 %>%
  filter(Experiment %in% c(1,2,3)) %>%
  filter(Zones %in% c("LT3","HT2"))
view(Experiment_a)
str(Experiment_a)
#Make a plot with variables strength, diameter, modulus, elongation with line speed

# Recode your variables because there was no graph displayed
Experiment_a$Zones<-as.factor(Experiment_a$Zones)
Experiment_a$Tensile_Strength<- as.numeric(Experiment_a$Tensile_Strength)
Experiment_a$Diameter <- as.numeric(Experiment_a$Diameter)
Experiment_a$Experiment<-as.factor(Experiment_a$Experiment)
Experiment_a$Emax <- as.numeric(Experiment_a$Emax)
Experiment_a$Ini.Modul <- as.numeric(Experiment_a$Ini.Modul)
str(Experiment_a)
Experiment_b <- Experiment_a%>% 
  mutate(Zones=fct_relevel(Zones,"LT3","HT2"))
str(Experiment_b)
# Retry plotting it
Line_speed_plot <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, shape = Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple")) 
Line_speed_plot
Line_speed_plot1 <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, colour = Experiment, shape = Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple"))  + scale_shape_manual(values=c(1,2,3,4,5,6,7))
Line_speed_plot1
Line_speed_plot2 <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, colour = Experiment, shape = Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple"))  + scale_shape_manual(values=c(1,2,3,4,5,6,7))
Line_speed_plot2
Line_speed_plot3<- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Ini.Modul,colour = Experiment, shape=Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple"))  + scale_shape_manual(values=c(1,2,6,7,5,3,4))
Line_speed_plot3










# I want to select two columns, zones and break.stress
Strength1 <- Experiment1 %>%
  select(Zones, Tensile_Strength) 
Strength2 <- drop_na(Strength1) #do not include NA values
view(Strength2)
str(Strength2)

# Recode your variables
Strength2$Zones<-as.factor(Strength2$Zones)
Strength2$Tensile_Strength<- as.numeric(Strength2$Tensile_Strength)
str(Strength2)
Strength3 <- Strength2 %>%
  mutate(Zones=fct_relevel(Zones,"Zone 1","Zone 2","Zone 3", "Zone 4", "LT 3", "HT2","Winder"))
Strengthplot1 <- ggplot(Strength3, aes(x=Zones, y=Tensile_Strength)) + geom_jitter(alpha= 0.1, width=0.05) 
Strengthplot1    

# Now I would like to create a similar graph for all different experiments from all zones
All_experiments <- Jilin_carbonisation_data_july2019 %>%
  select(Experiment,Zones,Tensile_Strength) %>%
  drop_na() 
View(All_experiments)
str(All_experiments)
All_experiments$Zones<-as.factor(All_experiments$Zones)
All_experiments$Experiment<-as.factor(All_experiments$Experiment)
All_experiments$Tensile_Strength<- as.numeric(All_experiments$Tensile_Strength)
str(All_experiments)
All_experiments1 <- All_experiments %>%
  mutate(Zones=fct_relevel(Zones,"Zone 1","Zone 2","Zone 3", "Zone 4", "LT 3","HT2","Winder"))

Strength_All_experiments <- ggplot(All_experiments1, aes(x=Zones, y=Tensile_Strength, color=Experiment)) + geom_jitter(alpha= 0.1, width=0.05) + 
  Strength_All_experiments
Strength_All_experiments <- ggplot(All_experiments1, aes(x=Zones, y=Tensile_Strength, color=Experiment)) + geom_point(alpha= 0.1, width=0.02) + scale_colour_discrete()
Strength_All_experiments
Strength_All_experiments2 <- ggplot(All_experiments1, aes(x=Experiment, y=Tensile_Strength, color=Zones))+ geom_point(width=0.02)
Strength_All_experiments2
Strength_All_experiments3 <- ggplot(All_experiments1, aes(x=Experiment, y=Tensile_Strength, color=Zones))+ geom_jitter(alpha= 0.1, width=0.05)+scale_x_discrete(limits= c("Zone 1","Zone 2","Zone 3","Zone 4", "LT 3","HT2","Winder"))
Strength_All_experiments3
Strength_All_experiments4 <- ggplot(All_experiments1, aes(x=Experiment, y=Tensile_Strength, color=Zones))+ geom_jitter(alpha= 0.1, width=0.05)+scale_x_discrete()
Strength_All_experiments4
# Want to make a histogram for each experiment to see the distribution
Strength_All_experiments5 <- ggplot(All_experiments1, aes(x=Experiment))+ geom_histogram()
Strength_All_experiments5
histogram1 <- ggplot(All_experiments1, aes(x = Experiment)) + geom_histogram() 
histogram1
# Only considering samples after HT
All_experiments2 <- All_experiments1 %>%
  filter(Zones=="HT2")
All_experiments2
histogram2 <- ggplot(All_experiments2, aes(x = Tensile_Strength)) + geom_histogram(bins=100) + facet_wrap(~ Experiment)
histogram2
# Making box plots
boxplot2 <- ggplot(All_experiments2, aes(x= Experiment, y = Tensile_Strength)) + geom_boxplot()
boxplot2
boxplot3 <- ggplot(All_experiments2, aes(x= Experiment, y = Tensile_Strength)) + geom_boxplot() + geom_jitter()
boxplot3
# Using rnorm to work out the normal distribution
Apply_rnorm <- apply(All_experiments2,  3, rnorm(n=50)