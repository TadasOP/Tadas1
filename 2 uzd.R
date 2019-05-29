# Packages
if(!require(eurostat)) install.packages("eurostat"); require(eurostat)
if(!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)

# 	General government expenditure by function (COFOG) (FILTERED)
gov_10a_exp <- get_eurostat("gov_10a_exp",
                            stringsAsFactors = FALSE,
                            filters = list(cofog99="GF02",
                                           na_item="TE",
                                           sector="S13",
                                           time="2017",
                                           unit="PC_GDP"))
# Data GEO FILTERED

df <- gov_10a_exp %>% filter(geo %in% c("BE","BG","CZ","DK","DE","EE","IE","EL",
                                        "ES","FR","HR","IT","CY","LV","LT","LU",
                                        "HU","MT","NL","AT","PL","PT","RO","SI",
                                        "SK","FI","SE","UK"))

# Graph

png(filename = "Total_government_expenditure_defence_EU.png", width = 960, height = 540, units = "px")

ggplot(df, aes(x=reorder(geo, values), values))+
  geom_bar(stat = "identity",
           fill="steel blue")+
           geom_text(aes(label=values), vjust=-0.5, size=3.5)+
  labs(title="Total general government expenditure on defence, 2017 (% of GDP)",
       subtitle = "Source: Eurostat (gov_10a_exp)",
       x = "Countries",
       y = "As % of GDP")
       
dev.off()
