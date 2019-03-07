# 1. stock market data
library(ISLR)
names(Smarket)
dim(Smarket)
summary(Smarket)
# fix(Smarket)
# cor() dengan menghilangkan qualitative variable
cor(Smarket[, -9]) # semau baris dan semua kolom kecuali kolom 9

# 2. logistic regression
# kita menggunakan glm()
glm.fits = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Smarket, family=binomial)
summary(glm.fits)
coef(glm.fits)
summary(glm.fits)$coef
glm.probs  =predict(glm.fits, type="response")
glm.probs[1:10]
# cek yang mana naik dan turun dengan contrast
attach(Smarket)
contrasts(Direction)
# prediksi
glm.pred = rep("Down", 1250)
glm.pred[glm.probs>0.5] = "Up"
table(glm.pred, Direction)
# buat test data set
train = (Year<2005) # ini adalah boolean
Smarket.2005 = Smarket[!train, ]
dim(Smarket.2005)
dim(train)
train
Direction.2005 = Direction[!train]
glm.fits = glm(Direction ~ Lag1 + Lag2 + Lag3 + Lag4 + Lag5 + Volume, data=Smarket, family=binomial, subset=train)
glm.probs=predict(glm.fits, Smarket.2005, type="response")
glm.pred=rep("Down", 252)
glm.pred[glm.probs>0.5]="Up"
table(glm.pred, Direction.2005)
dim(Direction.2005)
dim(glm.pred)
