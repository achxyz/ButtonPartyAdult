# Load the package required to read JSON files.
library("rjson") 
library(purrr)
library(dplyr)

# Give the input file name to the function.
result <- fromJSON(file = "~/Dropbox/DMLabb/workbook1.json")

my_df <- reduce(result, bind_rows)

