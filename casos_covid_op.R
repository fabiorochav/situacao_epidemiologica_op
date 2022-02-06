
#####Carregar pacote

library(readxl)
library(readr)
library(magrittr)
library(ggplot2)
library(scales)
library(zoo)
library(dplyr)
library(lubridate)

################# Carregando dados ##########

dados_covid_op <- read_xlsx("Casos Covid_19.xlsx", col_types = c("date",
                                                                 "guess",
                                                                 "guess",
                                                                 "guess",
                                                                 "guess",
                                                                 "guess",
                                                                 "guess"
                                                                 ))

################ Seleção de variaveis #########

covid <- dados_covid_op %>%
    select(
    "Data" = `DATA`,
    "Novos_casos" =  `Novos Casos`,
    "Novos_óbitos" = `Novos óbt`,
    "Variação_internação" = `Var. Inter.`,
    "inter" = `internados`) %>%
  mutate(mes = month(Data, label = TRUE)) %>%
  mutate(ano = year(Data))

########## Visualizar dados

#ggplot(covid, aes(x=Data, y=internados))+
ggplot(covid, aes(x=mes, y=Novos_óbitos))+
#ggplot(covid, aes(x=Data, y=Novos_casos))+
 geom_col()+
  facet_wrap(~ano)+
  theme(axis.text.x=element_text(angle=65, hjust=1, vjust=1))+
  theme(legend.position = "top",
        legend.key.size = unit(0.3, "cm"),
        legend.title = element_blank())+
  labs(x='', y='Óbitos',
       
    #title="Internação por Covid-19 - Ouro Preto (2020-2022) Enfermaria e UTI",
    #title="Casos de Covid-19 - Ouro Preto (2020-2022)",
    title="Óbitos por Covid-19 em Ouro Preto (2020-2022)",
    subtitle = 'Fonte: Boletim Prefeitura de Ouro Preto',
    caption='Elaboração: Fábio Rocha')

  














