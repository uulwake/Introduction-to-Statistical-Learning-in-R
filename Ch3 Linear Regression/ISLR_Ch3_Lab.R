lm.fit = lm(medv~., data=Boston)
lm.fit = lm(medv~.-age, data=Boston)
summary(lm.fit)
# interaction terms and non linear model
lm.fit2 = lm(medv ~ lstat + I(lstat^2))
# anova
lm.fit = lm(medv ~ lstat, data=Boston)
anova(lm.fit, lm.fit2)
par(mfrow=c(2, 2))
plot(lm.fit2)
# qualitative predictor
names(Carseats)
attach(Carseats)
ShelveLoc
# ubah menjadi data dummy
contrasts(ShelveLoc)
# function
LoadLibraries=function(){
  library(MASS)
  library(ISLR)
  print("ini adalah contoh fungsi untuk load data MASS dan ISLR")
}
LoadLibraries()