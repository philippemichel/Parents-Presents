#  ------------------------------------------------------------------------
#
# Title : Import Parents-Presents
#    By : Philippe MICHEL
#  Date : 2025
#
#  ------------------------------------------------------------------------

library("tidyverse")
library("readODS")
library("janitor")
library("labelled")

#
nax <- c("", " ", "NA", "D")

# Questionnaire version Hospitalisation Conventionnelle (HC)
hc <- read_ods("datas/questionnaire_hc.ods", na = nax) |>
  clean_names() |>
  mutate(across(where(is.character), as.factor))
bn_hc <- read_ods("datas/questionnaire_hc.ods", sheet = "bnom", na = nax)
var_label(hc) <- bn_hc$titres

# Questionnaire version Urgences Pédiatriques (URG)
urg <- read_ods("datas/questionnaire_urg.ods", na = nax) |>
  clean_names() |>
  mutate(across(where(is.character), as.factor))
bn_urg <- read_ods("datas/questionnaire_urg.ods", sheet = "bnom", na = nax)
var_label(urg) <- bn_urg$titres

rm(bn_hc, bn_urg)
save(hc, urg, file = "datas/parents_presents.RData")
