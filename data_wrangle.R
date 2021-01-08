library(tidyverse)
####RDA the data####
liver <- read_csv("data/indian_liver_patient.csv")


liver %>% group_by(Dataset) %>% summarise(n = n())

data_set <- liver %>% mutate(Dataset = ifelse(Dataset == 2, 0,1))

data_set %>% group_by(Dataset) %>% summarise(n = n())

liver_disease <- data_set %>% mutate(Dataset = as.factor(Dataset))

sum(is.na(data_set$Albumin_and_Globulin_Ratio))

data_set<- liver_disease %>% filter(!is.na(Albumin_and_Globulin_Ratio))

nrow(data_set)
nrow(liver_disease)

liver_disease <- data_set

save(liver_disease, file = "rda/liver_disease.rda")
