library("pacman")
p_load(tidyr,readr,DiagrammeR,ggplot2,dplyr,lubridate,NHSRplotthedots,readxl,stringr,NHSRdatasets, purrr, rlang,glue,pdftools)

# testing <- data.frame(quarter= c(1,2,3,4,5,6),
#                       quarter_label= c("Jul-Sep 14","Oct-Dec 14","Jan-Mar 15",
#                                        "Apr-Jun 15","Jul-Sep 15","Oct-Dec 15"))
# 
# testing %>%
#   separate(quarter_label, into=c("start", "end"), sep="-") %>%
#   mutate(quarters = lubridate::quarter(my(end), fiscal_start = 8)) %>%
#   mutate(year_after = year(my(end)) - my("08-2014"))

# need numeric quarters
# and label


# some good ideas

# r isn't one thing, it's lots of things
# packages

# definitely evidence
# fancy graphs
# maps
# data munging

map_dfr(list.files(path = "data/csv",  full.names = T), read_csv) %>%
  distinct() %>%
  mutate(Date = dmy(Date)) %>%
  mutate(Status = case_when(str_detect(Status, "Complete") ~ "Completed", 
                   TRUE ~ Status)) %>%
  count(month = month(Date, label=T), Training, Status) %>%
  ggplot() +
  geom_col(aes(x=month, y=n, fill=Status)) +
  facet_wrap(~Training + Status)
  


# automation + RAP
# portable - GitHub integration
# qualitative tools