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
# From the tidy data, I want to select only experiment 1 and plot strength for all zones
Experiment1 <- Jilin_carbonisation_data_july2019 %>%
  filter(Experiment==1)
  Experiment1
  view(Experiment1)
# I want to select two columns, zones and break.stress
  
    Strength1 <- Experiment1 %>%
    select(Zones, Break.Stress) %>%
    rename('Tensile Strength'= Break.Stress) %>%
    filter(!is.na('Tensile Strength')) #do not include NA values
    view(Strength1)
# I want to plot the above
   
Strengthplot1 <- ggplot(data=Strength1, mapping=aes (x=Zones, y=Break.Stress)) + geom_point() 
Strengthplot1    
    # how do I filter out NA from experiment1
# how do i remove lt1,lt2 and ht1 from datatable?
    # how do I have zones in sequence in x-axis
    # why I am getting so much noise in the left end of graph
  #how can i rename break stress to tensile strength