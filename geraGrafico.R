library(dplyr)
library(dygraphs)
library(xts)

dadosTesouro  <- read.csv2("data/precotaxatesourodireto.csv")
tesouroIPCA  <- dadosTesouro %>% filter(dadosTesouro$Tipo.Titulo == "Tesouro IPCA+")
tesouroIPCA  <- dadosTesouro %>% filter(dadosTesouro$Tipo.Titulo == "Tesouro IPCA+")
tesouroIPCA2035  <- tesouroIPCA %>% filter(tesouroIPCA$Data.Vencimento == "15/05/2035")
tesouroIPCA2035$Data.Base <- as.POSIXct(strptime(x = as.character(tesouroIPCA2035$Data.Base), format = "%d/%m/%Y"))
tesouroIPCA2035_2016  <- tesouroIPCA2035 %>% filter(format(tesouroIPCA2035$Data.Base, '%Y') == "2016")
dados2  <- as.data.frame(tesouroIPCA2035_2016$Data.Base)
dados3  <- as.data.frame(tesouroIPCA2035_2016$Taxa.Compra.Manha)
saida3  <- rbind(dados2,dados3)
saida3  <- cbind(dados2,dados3)
saida3  <- cbind(saida3,dados4)
colnames(saida3)  <- c("Data.Base","Taxa.Compra.Manha","Taxa.Venda.Manha")
saida3  <- rbind(dados2,dados3)
saida3  <- cbind(dados2,dados3)
dados4  <- as.data.frame(tesouroIPCA2035_2016$Taxa.Venda.Manha)
saida3  <- cbind(saida3,dados4)
colnames(saida3)  <- c("Data.Base","Taxa.Compra.Manha","Taxa.Venda.Manha")
resultado  <- data.frame
colnames(resultado)  <- saida3$Data.Base
resultado  <- t(saida3)
colnames(resultado)  <- resultado[1,]
resultado  <- resultado[c(-1),]
PRICE <- structure(
list(DATE = saida3$Data.Base, CLOSE = saida3$Taxa.Compra.Manha),
.Names = c("DATE", "CLOSE"), class = "data.frame",
row.names = as.character(saida3$Data.Base))
PRICE
PRICE$DATE <- as.Date(as.character(PRICE$DATE),format="%Y-%m-%d")
x <- xts(PRICE$CLOSE,PRICE$DATE)
dygraph(x) %>%
dySeries("V1", label = "Taxa.Compra.Manha") %>%
dyOptions(stackedGraph = TRUE) %>%
dyLimit(as.numeric("7.0"), color = "red")  %>%
dyEvent("2016-6-30", "Data Compra", labelLoc = "bottom") %>%
dyRangeSelector(height = 20)
