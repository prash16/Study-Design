suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("stringr"))

main <- function() {
#Reads the raw data from the data folder
#Writes the cleaned data into the docs folder
#  

# Read in raw data
survey <- read.csv("data/survey_responses.csv", stringsAsFactors = FALSE)[-c(1,2)] 

# Change column names
names(survey) <- c("background", "experience", "attitude", "first", 
                   "preference", "task", "active")

# Aggregate background and first_language variables
survey <- survey %>% 
  rowwise() %>% 
  mutate(background = ifelse(background %in% c("Computer Science / Computer Engineering", "Mathematics / Statistics"), background, 
                             ifelse(sum((str_detect(tolower(background), c("economics", "business", "finance")))) > 0 , "Business / Economics",
                                    ifelse((str_detect(tolower(background), "eng")), "Engineering", "Other")
                             ))) %>% 
  mutate(first = ifelse(first %in% c("Python", "R", "Matlab", "SAS", "C", "Java"), first, "Other"))

# Write cleaned data into csv file
write.csv(survey, "docs/survey_results_clean.csv", row.names = FALSE)

}

# call main function
main()