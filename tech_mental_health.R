# H null: whether the technology company provides health benefits or not, there is no diff
#   in the population proportion of employees who seek for mental health treatment and 
#   employees who do not
# H alt: there is a difference ...

# find critical value at 95% confidence interval
alpha = 0.025  
z.alpha = qnorm(1-alpha)
c(-z.alpha, z.alpha) # cv z = 1.96, 1.96

# import dataset
df <- read.csv("https://storage.googleapis.com/kaggle-datasets/311/673/survey.csv?GoogleAccessId=web-data@kaggle-161607.iam.gserviceaccount.com&Expires=1551488512&Signature=e2O0X8S9T4X59CU%2BndemIDwYghetFuXNWpWLpA2QiNo2fDPnM63a%2FVa%2FNnCw%2Fd5FGf%2FoDmFA0NZql8OaX%2BupP6A5Sf4VEgPsbi71YXGk5GnQz2lNgol0%2FMHvOz3mkff052O%2BiOqyNPDPYRRxjUDyn3dxit4bc4oDUbK%2F%2BTbr2zn9tPfcn92jOGcRXB9NqeXU%2FH7Mzo68BdjONbuK9GfW2nAnKlj4eJZVbQJ74B%2BHTeHaU04vKN4lixmd3ViVrLeCcxNGXHKRYqYDUgeOn3vekH%2BHo0%2Fhu28v1lxyNtVtUm%2FDkp2rXqADpLHSy9cCFYeFjZeq6%2FKG6d4%2BjtxKkODzWQ%3D%3D")

# variables:
# benefits -- does your employer provide mental health benefits?
# treatment -- have you sought treatment for a mental health condition?

mydata <- data.frame(df$benefits, df$treatment)
# mydata$df.benefits[mydata$df.benefits == "Don't know"] <- "No"
colnames(mydata) <- c("has.benefits", "sought.treatment")
colnames(mydata)
my_table <-table(mydata$has.benefits, mydata$sought.treatment)
# contingency table
margin_table <- addmargins(my_table)
mydata
margin_table

chisq.test(df$benefits, df$treatment, correct=FALSE)


