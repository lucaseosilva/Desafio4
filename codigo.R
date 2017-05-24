### nome <- "Lucas E. O. Silva"
### programa <- "Mestrado em Ciência Política"
### n_usp <- 1023663
### data_entrega: "23/05/2017"

require(dplyr)
require(openxlsx)
require(stringr)
require(tmap)
require(leaflet)
require(ggplot2)

# definindo o wd onde os arquivos baixados serão armazenados
setwd("C://Users//user03//Desktop//desafio4")

# definindo o caminho dos arquivos
caminho <- "C://Users//user03//Desktop//desafio4"

# criando um objeto com cada base
base_ibge <- Ibge(caminho)
base_siconfi <- Siconfi(caminho)
base_data_sus <- DataSus(caminho)
base_atlas <- AtlasBrasil(caminho)

# para a construção dos gráficos, decidi manipular com a biblioteca "tmap"
# por acreditar que ela possa gerar os plots com uma qualidade melhor

# carregando o shape 
rmsp <- read_shape("MunRM07.shp")

# mapa limpo
qtm(rmsp)

# analisando a estrutura do data frame que contem as informações referentes aos municipios
str(rmsp@data)

# adicionando a variável COD_IBGE6 para mergir com as outras bases
rmsp@data$CodIbge6 <- as.integer(str_sub(as.character(rmsp@data$COD_IBGE),1,6))

# irei realizar a ordenação de todas as bases de acordo com a variável de interesse
rmsp <- rmsp[order(rmsp@data$CodIbge6),]
base_ibge <- base_ibge[order(base_ibge$CodIbge6),]
base_siconfi <- base_siconfi[order(base_siconfi$CodIbge6),]
base_data_sus <- base_data_sus[order(base_data_sus$CodIbge6),]
base_atlas <- base_atlas[order(base_atlas$CodIbge6),]

# selecionarei algumas variáveis de cada base para não tumultuar as variáveis

base_ibge2 <- base_ibge %>%
              select(CodIbge6,ClassPop)
base_siconfi2 <- base_siconfi %>%
                 select(CodIbge6,TotalDesp)
base_data_sus2 <- base_data_sus %>%
                  select(CodIbge6,TxObResTot)
base_atlas2 <- base_atlas %>%
               select(CodIbge6,AguaEnc)

#mergindo
rmsp <- tmap::append_data(rmsp, base_ibge2, key.shp = "CodIbge6", key.data="CodIbge6",
                                  fixed.order = F)
rmsp <- tmap::append_data(rmsp, base_siconfi2, key.shp = "CodIbge6", key.data="CodIbge6",
                          fixed.order = F)
rmsp <- tmap::append_data(rmsp, base_data_sus2, key.shp = "CodIbge6", key.data="CodIbge6",
                          fixed.order = F)
rmsp <- tmap::append_data(rmsp, base_atlas2, key.shp = "CodIbge6", key.data="CodIbge6",
                          fixed.order = F)
# removendo as variáveis em excesso
for(i in 1:4){
  rmsp@data$CodIbge6.data <- NULL 
}

ibge.mapa <- tm_shape(rmsp)+
  tm_fill("ClassPop", palette = "Oranges")+
  tm_borders(alpha = 0.4)+
  tm_layout(frame = F)

tesouro.mapa<-tm_shape(rmsp)+
  tm_fill("TotalDesp", palette = "GnBu")+
  tm_borders(alpha = 0.4)+
  tm_layout(frame = F)

datasus.mapa<-tm_shape(rmsp)+
  tm_fill("TxObResTot", n = 4, palette = "Greys")+
  tm_borders(alpha = 0.4)+
  tm_layout(frame = F)

atlas.mapa<-tm_shape(rmsp)+
  tm_fill("AguaEnc", palette = "OrRd")+
  tm_borders(alpha = 0.4)+
  tm_layout(frame = F)

