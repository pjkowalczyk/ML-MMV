library(readxl)
library(magrittr)
library(dplyr)

gsk <- read.delim('../data/chemblntd_gsk.txt.gz') %>%
  select(COMPOUND_ID, pXC50_3D7, SMILES) %>%
  na.omit() %>%
  rename(ACTIVITY = pXC50_3D7) %>%
  mutate(SOURCE = 'gsk')

gnf <- readxl::read_excel('../data/Novartis_GNF.xls') %>%
  rename(COMPOUND_ID = `GNF-Pf identifier`) %>%
  rename(ACTIVITY = `PF proliferation inhibition 3D7 EC50 uM`) %>%
  rename(SMILES = `JC_XSMILES`) %>%
  na.omit() %>%
  mutate(SOURCE = 'gnf') %>%
  select(COMPOUND_ID, ACTIVITY, SMILES, SOURCE)

hts <- read.delim('../data/malariahts_trainingset.txt.gz') %>%
  rename(COMPOUND_ID = `X.SAMPLE`) %>%
  rename(ACTIVITY = `Pf3D7_pEC50`) %>%
  rename(SMILES = `Canonical_Smiles`) %>%
  rename(HIT = `Pf3D7_ps_hit`) %>%
  na.omit() %>%
  mutate(SOURCE = 'hts') %>%
  select(COMPOUND_ID, ACTIVITY, SMILES, HIT, SOURCE)
