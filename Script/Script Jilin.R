library(tidyverse)
library(readxl)
library(cowplot)
Jilin_carbonisation_data_july2019 <- read_excel("Data/Jilin_carbonisation_July_2019JK.xlsx", sheet=1)
str(Jilin_carbonisation_data_july2019)
# From the data, I want to select only experiment 1 and plot strength for all zones
Experiment1 <- Jilin_carbonisation_data_july2019 %>%
  filter(Experiment==1)
Experiment1
view(Experiment1)
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
Strengthplot1 <- ggplot(Strength3, aes(x=Zones, y=Tensile_Strength)) + geom_jitter(width=0.1) 
Strengthplot1    

