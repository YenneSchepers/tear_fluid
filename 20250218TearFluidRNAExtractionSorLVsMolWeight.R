read_elibrary(readxl)
library(tidyverse)
library(writexl)
X20250217_TapeStation <- read_excel("C:/Users/yenne/Documents/tutorials/R/20250217_TapeStation.xlsx", col_types = c('text', 'text', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
X20250217_TapeStation[!is.na(X20250217_TapeStation$Av.size),]
ggplot(data = X20250217_TapeStation, aes(x = molecular_weight, y = Sample) ) + geom_point() + geom_line()
X20250217_TapeStation |> 
  mutate(molecular_weight = Conc./Reg.Mol,.before = 1,
         str_extract(Sample, 'short|long') ) |> 
  ggplot(aes(x = molecular_weight, y = Sample)) + geom_point()



ggplot(data = X20250217_TapeStation, aes(x = Conc.)) + geom_bar()
ggplot(data = X20250217_TapeStation, aes(x = Conc., y= Sample) ) + geom_curve(xend = '2500', yend = 'd37356 short' )  

str_extract(X20250217_TapeStation$Sample, 'short|long')

X20250217_TapeStation |> 
  mutate(molecular_weight = Conc./Reg.Mol,.before = 1,
         sorl = str_extract(Sample, "short|long")) |>
  ggplot(aes(x = molecular_weight, y = sorl )) + geom_boxplot() 


