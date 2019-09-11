gov_10a_exp <- get_eurostat("gov_10a_exp", stringsAsFactors = F,
                            filters = list(cofog99="GF02",
                                           na_item="TE",
                                           sector="S13",
                                           time="2017",
                                           unit="PC_GDP"))

df <-  gov_10a_exp %>% filter(geo %in% c("LT","EE", "LV", "RO"))

ggplot(df, aes(x=reorder(geo, values), values))+
  geom_bar(stat = "identity",
           fill="steel blue")+
  geom_text(aes(label=values), vjust=-0.5, size=3.5)+
  labs(title="Total general government expenditure on defence, 2017 (% of GDP)",
       subtitle = "Source: Eurostat (gov_10a_exp)",
       x = "Countries",
       y = "As % of GDP")

ggplot(df, aes(x=reorder(geo,values), y=values))+ 
  geom_bar(stat = "identity",
           fill="pink")+
  geom_text(aes(label=values), vjust=-0.5, size=3.5, angle=45)+
  labs(title = "test",
       subtitle = "help",
       x="Salys",
       y="reiksmes")

##############################################


S3R180_M3010502 <- readSDMX(providerId = "LSD",
                            resource ="data",
                            flowRef="S3R180_M3010502",
                            dsd=TRUE)
S3R180_M3010502 <- as.data.frame(S3R180_M3010502, labels=T)
df3<-S3R180_M3010502[ ,c(3,6,8,9)]
df4<-subset(df3, df3$Vietove_label.lt=="Miestas ir kaimas")
df5<-subset(df4,df4$LAIKOTARPIS=="2000")
df6<-df2000[c(2:10),]
df6$Procentai<-df6$obsValue/34146*100


ggplot(df6, aes(x=amziusM3010502_label.lt, y=Procentai))+
  geom_point(col="black", size=1.75)+
  labs(title = "a",
       x="amziaus grupes",
       y="procentai")
