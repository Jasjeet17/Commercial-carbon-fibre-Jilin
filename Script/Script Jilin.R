# load the library tidyverse
library(tidyverse)
# load the library excel
library(readxl)
#load library cowplot
library(cowplot)
#read datafile into excel
read_excel("Data/Jilin_carbonisation_July_2019JK.xlsx")
#Asking it to read first sheet of excel file
Jilin_carbonisation_data_july2019 <- read_excel("Data/Jilin_carbonisation_July_2019JK.xlsx", sheet=1)
# Now I would like to read in a messy excel file and will try to tidy it
Jilin_messy_excel <- read_excel("Data/Jilin_carbonisation_July_2019JK.xlsx", sheet= "July Trial cond")
# From the tidy data, I want to select only experiment 1 and plot strength, modulus and diameter for all zones
Experiment1 <- Jilin_carbonisation_data_july2019 %>%
  filter(Experiment==1)
  Experiment1
# I want to select three columns
    First_plot <- Experiment1 %>%
    select('Zone names', 'Break.Stress')

# I want to plot the above
   
  ggplot (First_plot, mapping=aes(x ='Zonenames', y = 'Break.Stress))
                           + geom_point()
    
    
   
  