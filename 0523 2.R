library(rsdmx)


url_meta  <- "https://osp-rs.stat.gov.lt/rest_xml/dataflow/"
meta <- readSDMX(url_meta)      
meta <- as.data.frame(meta)
write.xlsx(meta, file="./data/meta.xlsx")

S3R178_M3010509

S3R180_M3010502 <- readSDMX(providerId = "LSD",
                              resource ="data",
                              flowRef="S3R180_M3010502",
                              dsd=TRUE)

S3R180_M3010502 <- as.data.frame(S3R180_M3010502, labels=T)

df3<-S3R180_M3010502[ ,c(3,6,8,9)]

df4<-subset(df3, df3$Vietove_label.lt=="Miestas ir kaimas")

df2000<-subset(df4,df4$LAIKOTARPIS=="2000")
df2000<-df2000[c(2:10),]
df2000$Procentai<-df2000$obsValue/34146*100

df2017<-subset(df4,df4$LAIKOTARPIS=="2017")
df2017<-df2017[c(2:10),]
df2017$Procentai<-df2017$obsValue/28696*100


ggplot(df2000,aes(df2000$amziusM3010502_label.lt,df2000$Procentai),type="p")
with(df2000,plot(df2000$amziusM3010502_label.lt,df2000$Procentai))
with(df2017,plot(df2017$amziusM3010502_label.lt,df2017$Procentai,type="l"))

z<-c("Iki 15 metu"=1,"15–19"=2,"20–24"=3,"25–29"=4,"30–34"=5,"35–39"=6,"40–44"=7,"45–49"=8,"50 ir vyresni"=9)
df2000$skaicius<-z[df2000$amziusM3010502_label.lt]
df2000[1,6]<-1
df2017$skaicius<-z[df2017$amziusM3010502_label.lt]
df2017[1,6]<-1

ggplot(df2000,aes(df2000$amziusM3010502_label.lt,df2000$Procentai),type="n")

ggplot(df2000)+
        geom_point(aes(df2000$skaicius,df2000$Procentai))

ggplot(df2017)+        
        geom_point(aes(df2017$skaicius,df2017$Procentai))

df_bend<-merge.data.frame(df2000,df2017,by=c(1))

ggplot(df_bend,aes(df_bend$skaicius.x,df_bend$Procentai.x))+
        labs(x="Amžiaus grupės", y="Procentai",title="Gimusieji pagal motinos amžių")+
         geom_line(aes(y=df_bend$Procentai.x,colour="2000"))+geom_point(aes(y=df_bend$Procentai.x,colour="2000"))+
        geom_line(aes(y=df_bend$Procentai.y,colour="2017"))+geom_point(aes(y=df_bend$Procentai.y,colour="2017"))
       
        
