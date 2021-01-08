library(tidyverse)
install.packages("kableExtra")

load("rda/liver_disease.rda")

liver_disease %>% head()
class(liver_disease$Dataset)
sum(is.na(liver_disease))


####Gender and age####

liver_disease %>% ggplot(aes(Dataset, Age, fill = Gender)) +
  geom_boxplot()

ggsave("figures/gander_and_age.jpg")

####Others factors####

liver_disease %>% gather(variable, value, - Dataset, -Gender) %>%
  ggplot(aes(Dataset, value, fill = Gender)) +
  geom_boxplot() +
  facet_wrap(~variable, scales = "free") 


ggsave("figures/others_factors.jpg", width = 7.5, height = 5.0 )

?ggsave

#width = NA,
#height = NA,