#Question 3
df = read.csv("G:/.shortcut-targets-by-id/1ehWwunuAo7CE1Vk2JYkUnQMmxh5pph3C/DATA/metabolite.csv", header = TRUE, sep = ',')
library(dplyr)
# (a)
alz_patients <- df%>%
  filter(Label == "Alzheimer") 
alz_count <- nrow(alz_patients)
print(alz_count)
# (b)
df %>%
  summarise_all(~sum(is.na(.)))
# (c)
df2 <- df %>%
  filter(!is.na(Dopamine))
head(df2)
# (d)
median_c4.OH.Pro <- median(df2$c4.OH.Pro, na.rm = TRUE)
df3 <- df2 %>%
  mutate(c4.OH.Pro = ifelse(is.na(c4.OH.Pro), median_c4.OH.Pro, c4.OH.Pro))
head(df3)
selected_col <-df3 %>%
  select(c4.OH.Pro)
print(selected_col)
selected_col <-df %>%
  select(c4.OH.Pro)
print(selected_col)
