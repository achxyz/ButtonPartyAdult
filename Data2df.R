rm(list=ls())

# Load the package required to read JSON files.
library("rjson") 
library(purrr)
library(dplyr)


# Give the input file name to the function.
result <- fromJSON(file = "~/Dropbox/DMLabb/Button Party_old/Data/30TB_BasicData.json")

my_df <- reduce(result, bind_rows)

df_sorted <- my_df %>% arrange(image_index)

#Ratio <- c(rep(rep(c("0.75","0.80","0.83","0.86","0.88"), each = 6), times = 2), "0.5","0.5")

Ratio <- rep(rep(c("0.75","0.80","0.83","0.86","0.88"), each = 6), times = 2)

df_sorted$Ratio <- Ratio

df_summary <- df_sorted %>% group_by(Ratio) %>% 
  summarize(ratio_perf = mean(correct, na.rm =TRUE),
            rt_perf = mean(rt, na.rm =TRUE))
  
