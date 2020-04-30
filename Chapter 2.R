library(Bolstad)
library(dplyr)
library(plotly)
sscsample(20,200)


sscsample(20,200, "cluster")


df <- sscsample.data

#2.1

#Aufgabe a

mean(df$income)
plot_ly(df, y = df[, "income"], type = "box") 
  
  
df %>% 
  group_by(ethnicity) %>%
  summarise(mean = mean(neighborhood))


df[df$ethnicity == 1, "income"]
plot_ly(df, y = df[df$ethnicity == 1, "income"], type = "box") %>% 
  add_trace(y = ~df[df$ethnicity == 2, "income"]) %>%
  add_trace(y = ~df[df$ethnicity == 3, "income"])

#Aufgabe b

test_1 <- sscsample(20,200, "simple")
mean(test_1$means)
test_1$samples


test_2 <- sscsample(20,200, "stratified")
mean(test_2$means)
test_2$samples

test_3 <- sscsample(20,200, "cluster")
mean(test_3$means)
test_3$samples

summary(df$income)
summary(test_1$means)
summary(test_2$means)
summary(test_3$means)

summary(test_1$s.strata)
summary(test_2$s.strata)
summary(test_3$s.strata)



#2.2

#a

res <- xdesign(corr = 0.8, size = 25, n.treatments = 2)


boxplot(block.means~ind,data=res)


