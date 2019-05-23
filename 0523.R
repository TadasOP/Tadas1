plot(ChickWeight)
model <- lm(weight ~ Time, ChickWeight)
model
model$residuals
install.packages("ggplot2")
ggplot(mpg)+
        geom_point(aes(displ, cty))
ggplot(mpg, aes(displ, cty))+
        geom_point(aes(color=drv))+
             geom_smooth()
ggplot(mpg, aes(cty))+ 
        geom_histogram(aes(fill=drv)) 
ggplot(mpg, aes(displ, cty))+ 
        geom_point()+ 
        facet_grid(~ drv)
ggplot(mpg, aes(cty))+ 
        geom_density()
ggplot(mpg, aes(cty))+ 
        geom_density(aes(col=drv))
df<- data.frame(x=1:100, y=rnorm(100)) 
df[50,2] <-100
with(df, plot(x,y, type="l"))
with(df, plot(x,y, type="l", ylim=c(-4,4)))
ggplot(df, aes(x=x,y=y))+ 
        geom_line()
ggplot(df, aes(x=x,y=y))+ 
        geom_line()+ 
        scale_y_continuous(limits=c(-4,4))
ggplot(df, aes(x=x,y=y))+ 
        geom_line()+ 
        coord_cartesian(ylim=c(-4,4))
df<- data.frame(x=1:100, y=rnorm(100)) 
ggplot(df, aes(x=x,y=y))+theme_bw()+ 
        geom_line()+ 
        geom_smooth(se=FALSE, method = "loess")+ 
        coord_cartesian(ylim=c(-4,4))+ 
        labs(x="Laikotapris", y="Įvertis", title= "Vidutinė grąža", 
             subtitle = "Šaltinis Eurostat (nama_10_q)")
library(eurostat)
namq_10_gdp <- get_eurostat(id="namq_10_gdp", stringsAsFactors = FALSE)
library(dplyr)
df <- namq_10_gdp %>%
        filter(, geo==c("LT", "LV", "EE")&
                       time>="2004-01-01") %>%
        select(values, values) %>%
        
ggplot(df, aes(x=time, ))

df <- namq_10_gdp %>%
        filter(geo %in% c("LT", "LV", "EE"),
             s_adj=="SCA",
             time>="2004-01-01",
             na_item=="B1GQ",
             unit=="CLV_I10")

library(ggplot2)
ggplot(df, aes(x=time, y=values))+
        geom_line(aes(col=geo))+
labs(x="Time", y="Index", title="Real GDP in Lithuania, Latvia and Estonia, index 2010 = 100", subtitle="Source: Eurostat (namq_10_gpd). Calculations: Me :P")+
scale_x_date(date_breaks = "year", date_labels = "%Y")


library(eurostat)
gov_10a_exp <- get_eurostat("gov_10a_exp", stringsAsFactors = FALSE)
library(dplyr)
df <- gov_10a_exp %>% 
        filter(geo %in% c("BE","BG","CZ","DK","DE","EE","IE","EL","ES","FR","HR","IT","CY","LV","LT","LU","HU","MT","NL","AT","PL","PT","RO","SI","SK","FI","SE","UK"),
               cofog99=="GF02",
               sector=="S13",
               time=="2017-01-01",
               na_item=="TE",
               unit=="PC_GDP")
library(ggplot2)
ggplot(df, aes(x=reorder(geo, values), y=values))+ 
geom_bar(stat ="Identity", fill="dodgerblue3")+
        geom_text(aes(label=values), vjust=-0.3)+
        labs(x="Countries", y="As % of GDP", title="Total general government expenditure on defence, 2016 (% of GDP)", subtitle = "Source: Eurostat (gov_10a_exp). Calculations: Me :P")

