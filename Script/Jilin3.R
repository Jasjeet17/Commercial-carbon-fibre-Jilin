library(tidyverse)
library(readxl)
library(cowplot)
Jilin_carbonisation_data_july2019 <- read_excel("Data/Jilin_carbonisation_July_2019JK.xlsx", sheet=1)
str(Jilin_carbonisation_data_july2019)
# From the data, I want to select experiment 1,2,3 and plot strength, Emax, Diameter, work, linear density, initial modulus for LT and HT samples
Experiment_a <- Jilin_carbonisation_data_july2019 %>%
  filter(Experiment %in% c(1,2,3)) %>%
  filter(Zones %in% c("Zone 1","Zone 2","Zone 3", "Zone 4", "LT3", "HT2"))
view(Experiment_a)
str(Experiment_a)
#Make a plot with variables strength, diameter, modulus, elongation with line speed

# Recode your variables because there was no graph displayed
Experiment_a$Zones<-as.factor(Experiment_a$Zones)
Experiment_a$Tensile_Strength<- as.numeric(Experiment_a$Tensile_Strength)
Experiment_a$Diameter <- as.numeric(Experiment_a$Diameter)
Experiment_a$Experiment<-as.factor(Experiment_a$Experiment)
str(Experiment_a)
Experiment_b <- Experiment_a%>% 
  mutate(Zones=fct_relevel(Zones,"Zone 1","Zone 2","Zone 3", "Zone 4", "LT3", "HT2","Tow"))
str(Experiment_b)
# Retry plotting it
Line_speed_plot <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, colour = Zones)) +
  geom_point() 
Line_speed_plot
Line_speed_plot1 <- ggplot(data=Experiment_b,mapping = aes(x = Tensile_Strength, y = Diameter, colour = Experiment, shape = Zones)) +
  geom_point() + scale_colour_manual(values = c("red","green","purple")) + scale_shape_manual(values=c(1,2,3,4,5,6,7,8))
Line_speed_plot1
Plot_4 <- ggplot(Experiment_b, aes(x=Experiment, y=Tensile_Strength, color=Zones))+ geom_point(width=0.05)+scale_x_discrete()
Plot_4