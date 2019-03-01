df <- read.csv("https://goo.gl/j6lRXD")

df
table(df$treatment, df$improvement)
# Chi-sq test
chisq.test(df$treatment, df$improvement, correct=FALSE)

# conclusion: the two variables are dependent
