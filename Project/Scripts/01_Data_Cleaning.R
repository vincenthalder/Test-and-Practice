source("Project/Scripts/05_Packages.R")
titanic_raw <- as_tibble(read.csv("Project/Data/Raw/titanic.csv"))

## Important First Cleaning Step: Put NA's where empty cells are empty character strings.
titanic_raw <- titanic_raw %>%
  mutate(across(where(is.character), ~ na_if(.x, "")))

## Now inspect 
view(titanic)
summary(titanic)
str(titanic)
glimpse(titanic)


## (1) Building a Data-Audit Table 
audit_table <- tibble(
  vars = colnames(titanic_raw),
  number_non_missing = sapply(titanic_raw, function(x) sum(!is.na(x)))
  )




?count
## (2) Clean Names to snake case 
titanic_clean <- titanic_raw |>  
  clean_names(case = "snake") |> 
  mutate(across(where(is.character), trimws)) 
  


