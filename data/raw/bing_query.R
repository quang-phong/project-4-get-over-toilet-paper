library(readr)

list_of_files <- list.files(path = "D:/OneDrive/.../BingCoronavirusQuerySet/data/2020",
                            full.names = TRUE)

df <- readr::read_tsv(list_of_files[1:12], id = "file_name")


library(dplyr)

count <- df %>% 
  filter(grepl('toilet', Query))

count2 <- count %>%
  group_by(Date) %>%
  summarize(n=n())
         
df2 <- df %>%
  group_by(Date) %>%
  summarize(n=n())         


count3 <- left_join(count2, df2, by="Date")
count3$percentage <- count3$n.x / count3$n.y *100

plot(count3$percentage)

library("writexl")
write_xlsx(count3, "D:/OneDrive/.../toilet-paper-bing-query.xlsx")
