# - [1] - Import Libraries ----
library(readxl)
library(usmap)
library(ggplot2)
library(dplyr)

# - [2] - Import Data ----
stuff <- read_excel("Merged.Data/FinalData.xlsx")
str(stuff)
stuff1 = stuff[,-c(1,2,16,18:20,22,23)]
stuff1 = na.omit(stuff1)
str(stuff1)


# - [3] - Regression Model ----
model <- lm(retail ~ ., data = stuff1 )
summary(model)

X <- stuff1[,-c(14)]
y_predict = predict(model, X )
y= stuff1$retail

# - [4] - Plot Retail Rate of Movement Map ---- 
plotmaps <- function(stuff, value) {
  p.plot <- plot_usmap(data = stuff, values = value, color = "red") + 
    scale_fill_continuous(
      low = "red", high = "yellow" , name = "Retail change", label = scales::comma
    ) + theme(legend.position = "right", legend.title=element_text(size=12, face="bold"),
              legend.text = element_text(colour="black", size = 12, face = "bold")) 
  print(p.plot)
}

aa = "retail"
plotmaps(stuff_new, aa)

# - [5] - Random Forest Modeling ----
y = stuff1$retail
X = stuff1[,-c(14)]
rf <- randomForest(retail ~ .   , data= stuff1 , ntree=800)
y_predict <- predict(rf, X)
mean( (y - y_predict)^2)

# - [6] - Random Forest VI ----
#VI Plot ....
importance <- importance(rf)
importance2 <- importance/sum(importance)*100
importance_ordered <- importance2[order(importance2,decreasing = TRUE),]
varImpPlot(rf, sort= TRUE, main= "The importance of the variables and their measured impourity")

#Barplot ...
col_names <- row.names(importance2)
xx = importance_ordered
barplot(importance_ordered, col="blue", las=2, cex.names=1)

df <- data.frame(Variable=c("Working Rate","Teen Pregnancy Rate", "% Under 25", "% College Graduate","% Population Infected", 
                            "% Voting Republican","Average Crime Rate","% Smoking","Poverty Rate","Suicide Rate",
                            "Gini Coefficient", "Population","Overdose Rate","% Female"),
                 Percentage=c(20.6360352,20.3569944,8.6873560,7.9206318,7.5539118,6.8219418,6.3511327,
                              5.8526953,4.6319603,4.0731047,2.2053950,2.1202204,2.1197161,0.6689045))
p<-ggplot(data=df, aes(x=reorder(Variable,Percentage), y=Percentage)) +  
  geom_bar(stat="identity", fill="steelblue", width = .4)+ xlab("Variables")+ylab("Percentage of Importance")+ 
  geom_text(aes(label=round(Percentage,2)), position=position_dodge(width=1.1), vjust=0.2, hjust=-0.1, size= 5)+ 
  theme_bw() + ylim(0, 23) +
  theme(axis.text.x = element_text(color = "black", face = "plain",size =14),
        axis.text.y = element_text(color = "black", face = "plain",size =14),  
        axis.title.x = element_text(color = "black", face = "plain",size =14),
        axis.title.y = element_text(color = "black", face = "plain",size =14),
        panel.grid.major = element_blank(), panel.grid.minor = element_blank())

# Horizontal bar plot
p + coord_flip()

# - [7] - Correlation Matrix ----
library(corrplot)
M <- cor(X)
colnames(M) <- c("Working Rate","% Smoking","Suicide Rate","Overdose Rate","Teen Pregnancy Rate","Average Crime Rate",
                 "% College Graduate","Poverty Rate","Gini Coefficient","Population","% Population Infected","% Voting Republican",
                 "% Under 25","% Female")
rownames(M) <- colnames(M)
corrplot(M, order = "hclust", tl.col = 'black', tl.cex = 1.1)
