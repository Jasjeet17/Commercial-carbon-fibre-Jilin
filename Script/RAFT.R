# load the library tidyverse
library(tidyverse)
# load the library excel
library(readxl)
#load library cowplot
library(cowplot)
#read datafile into excel
read_excel("Data/RAFT favimat.xlsx")
read_excel("Data/ALL DENSITY RESULTS.xlsx")
#assign variable to datasets
Favimat <- read_excel("Data/RAFT favimat.xlsx")
Density <- read_excel("Data/ALL DENSITY RESULTS.xlsx")
#select columns you are interested in Favimat spreadsheet
Favimat_selected <- select(Favimat, 'CSIRO Ident', Details, 'Brk. Ten. (GPa)', 'Diameter (mm)') 
#make sure that you include any spaces in the column headings in select function and also include backticks if there is space b/w names
#select columns in Density spreadsheet
Density_selected <- select(Density,'White Fibre Trial Number', 'PAN name (if known)','Density Result Mean')
#rename columns in density dataset to have common info for both spreadsheet so that you can do a inner join
Density_renamed <- rename(Density_selected, 'Details' = 'White Fibre Trial Number', 'CSIRO Ident' = 'PAN name (if known)')
# full join
Combined_dataset <- full_join(Favimat_selected, Density_renamed, by = 'CSIRO Ident') 

