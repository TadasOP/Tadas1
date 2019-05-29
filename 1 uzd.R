# Packages
if(!require(eurostat)) install.packages("eurostat"); require(eurostat)
if(!require(tidyverse)) install.packages("tidyverse"); require(tidyverse)

# 	GDP and main components (output, expenditure and income) (namq_10_gdp)
namq_10_gdp <- get_eurostat("namq_10_gdp",
                            stringsAsFactors = FALSE)
# Data

df <- namq_10_gdp %>%
  filter(geo %in% c("EE", "LV", "LT"),
         na_item=="B1GQ",
         s_adj=="SCA",
         time>="2004-01-01",
         unit=="CLV_I10")

# Graph

png(filename = "Real_GDP_Quartely_LT_LV_EE.png", width = 960, height = 540, units = "px")
ggplot(df, aes(x=time, y=values, col=geo))+
  geom_line(size=1.1)+
  scale_x_date(date_labels = "%Y", date_breaks = "1 year")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  labs(title = "Real GDP in Lithuania, Latvia and Estonia, index 2010=100",
       subtitle = "Source: Eurostat (namq_10_gdp)",
       x="Time",
       y="Index")
dev.off()
