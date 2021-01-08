library(tidyverse)
library(caret)
load("rda/liver_disease.rda")

####Machine Learnin preparation####
#Defining the training and test set
set.seed(0)
index <- createDataPartition(liver_disease$Dataset, times = 1, p = 0.25, list =  FALSE)
train_set <- liver_disease[-index, ]
test_set <- liver_disease[index, ]

train_set <- train_set %>% 
  select(Dataset, Gender,  Albumin_and_Globulin_Ratio, Alkaline_Phosphotase, 
         Direct_Bilirubin, Albumin, Total_Protiens)


###GLM

fit_GLM<- train(Dataset ~ ., data = train_set, method = "glm" )

predict_GLM <- predict(fit_GLM, test_set)
confusionMatrix(predict_GLM, test_set$Dataset)

###knn
set.seed(10)
fit_knn<- train(Dataset ~ ., data = train_set, method = "knn")

predict_knn <- predict(fit_knn, test_set)
confusionMatrix(predict_knn, test_set$Dataset)

####QDA
fit_QDA<- train(Dataset ~ ., data = train_set, method = "qda")
predict_qda <- predict(fit_QDA, test_set)
confusionMatrix(predict_qda, test_set$Dataset)

####LDA
fit_lda<- train(Dataset ~ ., data = train_set, method = "lda")
predict_lda <- predict(fit_lda, test_set)
confusionMatrix(predict_lda, test_set$Dataset)

####Randon Forest
set.seed(10)
fit_Randon<- train(Dataset ~ ., data = train_set, method = "rf")
predict_randon <- predict(fit_Randon, test_set)
confusionMatrix(predict_randon, test_set$Dataset)

