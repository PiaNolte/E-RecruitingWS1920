##Datacleaning Test Gruppe E-Recruiting

library(tidyverse)


#Datensatz einlesen

raw <- read_csv("pretest.csv")

source("qualtricshelpers.R")

filename <- "pretest.csv"


#Rohdaten laden/selektieren

raw <- load_qualtrics_csv(filename)

raw_short <- raw[,c(-1:-17, -29:-56,-94:-181)]

generate_codebook(raw_short, filename, "codebook.csv")

codebook <- read_codebook("codebook_final.csv")

names(raw_short) <- codebook$variable


#Faktorenzuweisung
## Demographische Daten

raw_short$gender <- as.factor(raw_short$gender)
raw_short$`marital status` <- as.factor(raw_short$`marital status`)
raw_short$age <- as.numeric(raw_short$age)
raw_short$education <- ordered(raw_short$education, levels = c("Kein Schulabschluss", 
                                                               "Volks- oder Hauptschulabschluss", 
                                                               "Mittlere Reife/Realschulabschluss", 
                                                               "Fachhochschulreife/Fachabitur", 
                                                               "Allgemeine Hochschulreife/Abitur", 
                                                               "Abgeschlossene Berufsausbildung" , 
                                                               "Bachelor", 
                                                               "Master", 
                                                               "Promotion", 
                                                               "Habilitation", 
                                                               "Keine der hier genannten"))
raw_short$activity <- as.factor(raw_short$activity)
raw_short$ausbildung <- as.factor(raw_short$ausbildung)
raw_short$studium <- as.factor(raw_short$studium)
raw_short$jobbezeichnung <- as.factor(raw_short$jobbezeichnung)
raw_short$arbeitsverhaeltnis <- as.factor(raw_short$arbeitsverhaeltnis)
raw_short$berufserfahrung <- ordered(raw_short$berufserfahrung, levels = c("gar keine",
                                                                           "weniger als ein Jahr",
                                                                           "1 - 5 Jahre",
                                                                           "5 - 10 Jahre",
                                                                           "10 - 20 Jahre",
                                                                           "mehr als 20 Jahre"))
raw_short$wochenstunden <- as.numeric(raw_short$wochenstunden)

##Themenblock E-Recruiting

scale_zustimmung <- c("Stimme völlig zu",
                      "2",
                      "3",
                      "4",
                      "5",
                      "Stimme gar nicht zu")

raw_short$oraw1_1 <- ordered(raw_short$oraw1_1, levels = scale_zustimmung)
raw_short$oraw1_2 <- ordered(raw_short$oraw1_2, levels = scale_zustimmung)
raw_short$oraw1_3 <- ordered(raw_short$oraw1_3, levels = scale_zustimmung)
raw_short$oraw1_4 <- ordered(raw_short$oraw1_4, levels = scale_zustimmung)
raw_short$oraw1_5 <- ordered(raw_short$oraw1_5, levels = scale_zustimmung)
raw_short$oraw1_6 <- ordered(raw_short$oraw1_6, levels = scale_zustimmung)
raw_short$oraw1_7 <- ordered(raw_short$oraw1_7, levels = scale_zustimmung)

raw_short$ore1 <- as.factor(raw_short$ore1)
raw_short$orej1 <- as.factor(raw_short$orej1)
raw_short$orej2 <- as.factor(raw_short$orej2)
raw_short$orej2_3_TEXT <- as.factor(raw_short$orej2_3_TEXT)
raw_short$oren1 <- as.factor(raw_short$oren1)
raw_short$oren1_3_TEXT <- as.factor(raw_short$oren1_3_TEXT)
raw_short$oren2 <- as.factor(raw_short$oren2)
raw_short$orew <- as.factor(raw_short$orew)

raw_short$orrpk_1 <- ordered(raw_short$orrpk_1, levels = scale_zustimmung)
raw_short$orrpk_2 <- ordered(raw_short$orrpk_2, levels = scale_zustimmung)

raw_short$orrpz_1 <- ordered(raw_short$orrpz_1, levels = scale_zustimmung)
raw_short$orrpz_2 <- ordered(raw_short$orrpz_2, levels = scale_zustimmung)
raw_short$orrpz_3 <- ordered(raw_short$orrpz_3, levels = scale_zustimmung)

raw_short$orrppe_1 <- ordered(raw_short$orrppe_1, levels = scale_zustimmung)
raw_short$orrppe_2 <- ordered(raw_short$orrppe_2, levels = scale_zustimmung)
raw_short$orrppe_3 <- ordered(raw_short$orrppe_3, levels = scale_zustimmung)

raw_short$orrps_1 <- ordered(raw_short$orrps_1, levels = scale_zustimmung)
raw_short$orrps_2 <- ordered(raw_short$orrps_2, levels = scale_zustimmung)
raw_short$orrps_3 <- ordered(raw_short$orrps_3, levels = scale_zustimmung)
raw_short$orrps_4 <- ordered(raw_short$orrps_4, levels = scale_zustimmung)
raw_short$orrps_5 <- ordered(raw_short$orrps_5, levels = scale_zustimmung)

raw_short$orrpzg_1 <- ordered(raw_short$orrpzg_1, levels = scale_zustimmung)
raw_short$orrpzg_2 <- ordered(raw_short$orrpzg_2, levels = scale_zustimmung)
raw_short$orrpzg_3 <- ordered(raw_short$orrpzg_3, levels = scale_zustimmung)
raw_short$orrpzg_4 <- ordered(raw_short$orrpzg_4, levels = scale_zustimmung)

raw_short$orrpi_1 <- ordered(raw_short$orrpi_1, levels = scale_zustimmung)
raw_short$orrpi_2 <- ordered(raw_short$orrpi_2, levels = scale_zustimmung)
raw_short$orrpi_3 <- ordered(raw_short$orrpi_3, levels = scale_zustimmung)
raw_short$orrpi_4 <- ordered(raw_short$orrpi_4, levels = scale_zustimmung)

raw_short$ora <- as.factor(raw_short$ora)



library(psych)

schluesselliste <- list(
  ORAW = c("oraw1_1","-oraw1_2","oraw1_3","oraw1_4","oraw1_5","oraw1_6","oraw1_7"),
  ORRPK = c("orrpk_1", "orrpk_2"),
  ORRPZ = c("-orrpz_1", "orrpz_2", "orrpz_3"),
  ORRPPE = c("orrppe_1", "-orrppe_2", "orrppe_3"),
  ORRPS = c("-orrps_1", "orrps_2", "orrps_3", "orrps_4", "orrps_5"),
  ORRPZG = c("orrpzg_1", "orrpzg_2", "-orrpzg_3", "orrpzg_4"),
  ORRPI = c("orrpi_1", "orrpi_2", "orrpi_3", "-orrpi_4"))


scores <- scoreItems(schluesselliste, raw_short, missing = TRUE, min = 1, max = 6)

scores$scores
datensatz <- raw_short %>% bind_cols(as_tibble(scores$scores))
