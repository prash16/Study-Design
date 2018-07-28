suppressPackageStartupMessages(library("googlesheets"))
suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("readr"))


main <- function() {
#Reads the data in from google sheets
#Stores raw data in data folder
#Stores the processed data in docs folder
my_sheets <- gs_ls()
title <- gs_title(my_sheets$sheet_title)
responses <- gs_read(title)
write_csv(x = responses, path = "data/survey_responses.csv")
}

# call main function
main()