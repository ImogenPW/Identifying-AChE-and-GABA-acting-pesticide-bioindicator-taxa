#title: "Chpater 3 - AChE/GABA bioindicators"
#author: "Imogen Poyntz-Wright"
#date: "2024-02-29"


#Library
library(readr)
library(ggplot2)
library(openxlsx)
library(dplyr)
library(tidyverse)
library(sp)
library(spData)
library(ape)

#Load datasets
Anglia <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Anglian_MInvAbundance.csv")
long_lat<-read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Annual range datasets for mapping/ACHE_ALL_TAXA_longlat.csv")
tolerant_taxa_only <-read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Culex_lymnaea_long_lat_dataset.csv") #merged lymnaea_taxa_only and culex_taxa_only excel spreadsheets
sensitive_taxa_only <-read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Anopheles_cloeon_ischnura_long_lat_dataset.csv") #merged anopheles_taxa_only, cloeon_taxa_only and ischnura_taxa_onlyexcel spreadsheets

#Anopheles_dataset_edited <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Anopheles_dataset.csv")
#Cloeon_dataset_edited <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Cloeon_dataset.csv")
#Ischnura_dataset_edited <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Ischnura_dataset.csv")
#Culex_dataset_edited <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Culex_dataset.csv")
#Lymnaea_dataset_edited <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Lymnaea_dataset.csv")
#combined_dataset6 <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/combined_dataset6.csv")
#combined_dataset_final <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/dataset with presence of taxa_FINAL.csv")
#Longlate_anglian <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/EA anglia dataset/Longlate anglian.csv")
#ang_landuse <- read.csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Land-use/Anglian land-use.csv")


#Section 2
ACHE_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/AChE.csv")
#GABA_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/GABA.csv")
ACHE_data_FULL <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/AChE_FULL.csv")
#GABA_data_FULL <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/GABA_FULL.csv")
site_variables_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvSiteVariables.csv")
alkalinity_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Alkalinity.csv")
ammonia_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Ammonia.csv")
ammoniacalNitrogen_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_AmmoniacalNitrogen.csv")
BOD_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_BOD.csv")
COD_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_COD.csv")
conductivity_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Conductivity.csv")
hardness_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Hardness.csv")
nitrate_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Nitrate.csv")
nitrite_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Nitrite.csv")
orthophosphate_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Orthophosphate.csv")
oxygenDissolved_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_OxygenDissolved.csv")
oxygenSaturation_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_OxygenSaturation.csv")
PAH_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_PAH.csv")
pH_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_pH.csv")
suspendedSolids_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_SuspendedSolids.csv")
turbidity_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Turbidity.csv")
#GABA_taxa_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/GABA_ALL_TAXA_toler_not_toler.csv")
ACHE_taxa_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/ACHE_ALL_TAXA_toler_not_toler.csv")
temperature_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvAirTemperature.csv")
flow_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvRiverFlowStats.csv")
dissolved_copper_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_CopperDissolved.csv")
copper_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Copper.csv")
zinc_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_Zinc.csv")
dissolved_zinc_data <- read_csv("C:/Users/imoge/OneDrive/phd/Research/Objective 6/Anglian Chemical data/Anglian_MInvWIMSStats_ZincDissolved.csv")


################################################################################
#SECTION 1:
##Identify which sites each genus has been recorded present - add long and lats to data
###No Aedes recorded by EA in Anglia

#Genus 1
Anopheles_dataset <- Anglia[Anglia$Genus %in% c('Anopheles'),]
Anopheles_dataset2 <- Anopheles_dataset[, c("SITE_ID", "Genus")] 
Anopheles_dataset3 <- merge(Anopheles_dataset2, long_lat, by = "SITE_ID", all.x = TRUE) #ignore presence not applicable
#write.xlsx(Anopheles_dataset3, file= "Anopheles_long_lat_dataset.xlsx", sep = ',')

#Genus 2
Cloeon_dataset <- Anglia[Anglia$Genus %in% c('Cloeon'),]
Cloeon_dataset2 <- Cloeon_dataset[, c("SITE_ID", "Genus")] 
Cloeon_dataset3 <- Cloeon_dataset2[!duplicated(Cloeon_dataset2$SITE_ID), ]
Cloeon_dataset4 <- merge(Cloeon_dataset3, long_lat, by = "SITE_ID", all.x = TRUE) #ignore presence not applicable
#write.xlsx(Cloeon_dataset4, file= "Cloeon_long_lat_dataset.xlsx", sep = ',')

#Genus 3
Ischnura_dataset <- Anglia[Anglia$Genus %in% c('Ischnura'),]
Ischnura_dataset2 <- Ischnura_dataset[, c("SITE_ID", "Genus")] 
Ischnura_dataset3 <- Ischnura_dataset2[!duplicated(Ischnura_dataset2$SITE_ID), ]
Ischnura_dataset4 <- merge(Ischnura_dataset3, long_lat, by = "SITE_ID", all.x = TRUE) #ignore presence not applicable
#write.xlsx(Ischnura_dataset4, file= "Ischnura_long_lat_dataset.xlsx", sep = ',')

#Genus 4
Culex_dataset <- Anglia[Anglia$Genus %in% c('Culex'),]
Culex_dataset2 <- Culex_dataset[, c("SITE_ID", "Genus")] 
Culex_dataset3 <- Culex_dataset2[!duplicated(Culex_dataset2$SITE_ID), ]
Culex_dataset4 <- merge(Culex_dataset3, long_lat, by = "SITE_ID", all.x = TRUE) #ignore presence not applicable
#write.xlsx(Culex_dataset4, file= "Culex_long_lat_dataset.xlsx", sep = ',')

#Genus 5
Lymnaea_dataset <- Anglia[Anglia$Genus %in% c('Lymnaea'),]
Lymnaea_dataset2 <- Lymnaea_dataset[, c("SITE_ID", "Genus")] 
Lymnaea_dataset3 <- Lymnaea_dataset2[!duplicated(Lymnaea_dataset2$SITE_ID), ]
Lymnaea_dataset4 <- merge(Lymnaea_dataset3, long_lat, by = "SITE_ID", all.x = TRUE) #ignore presence not applicable
#write.xlsx(Lymnaea_dataset4, file= "Lymnaea_long_lat_dataset.xlsx", sep = ',')

################################################################################
#SECTION 2 (figure 3) :
##Dataset with sites all tolerant and sites all sensitive

#Find sites only sensitive taxa

#step 1 add all sites to dataset
Anglia2 <- Anglia[!duplicated(Anglia$SITE_ID), ] #remove duplicate sites
Anglia3 <- data.frame(SITE_ID = Anglia2$SITE_ID) #select just sites (213) and make new dataframe with sites
Longlate_anglian_DISTINCT<-  Longlate_anglian[!duplicated(Longlate_anglian$SITE_ID ),] #get all site long/lats


#find sites with only sensitive taxa
sensitive_taxa_only1 <- anti_join(sensitive_taxa_only, tolerant_taxa_only, by = "SITE_ID") #removes sites which have tolerant taxa

#find sites with only tolerant taxa 
tolerant_taxa_only1 <- anti_join(tolerant_taxa_only, sensitive_taxa_only, by = "SITE_ID") #removes sites which have sensitive taxa


#find sites with both tolerant and sensiitve taxa
lymnaea_culex <- merge(Lymnaea_dataset4, Culex_dataset4, by = "SITE_ID", all = TRUE)
lymnaea_culex2 <- lymnaea_culex[, c("SITE_ID", "Genus.x")]
cloeon_anopheles <- merge(Cloeon_dataset4, Anopheles_dataset3, by = "SITE_ID", all = TRUE) #merge datasets
cloeon_anopheles_ischnura <- merge(cloeon_anopheles, Ischnura_dataset4, by = "SITE_ID", all = TRUE) #merge datasets
cloeon_anopheles_ischnura2 <- cloeon_anopheles_ischnura[, c("SITE_ID","Genus.x")] #select just SITE_IDs
both_tol_and_sen_sites <- merge(cloeon_anopheles_ischnura2, lymnaea_culex2, by = "SITE_ID") #find sites with both tol and sen taxa
Longlate_anglian
both_tol_and_sen_sites_corrs <- merge(both_tol_and_sen_sites, Longlate_anglian_DISTINCT, by = "SITE_ID") #add long and lat
#write.xlsx(both_tol_and_sen_sites_corrs, file= "sens and tol taxa sites.xlsx", sep = ',')

################################################################################

#SECTION 3 (figure 4):
##Identifying sites with Ichsnura and/or Lymnaea


#find sites with only lymnaea and no other taxa - showing missing sites
lymnaea_taxa_only1 <- anti_join(Lymnaea_dataset4, sensitive_taxa_only, by = "SITE_ID") #filter out sites with any sensitive taxa
lymnaea_taxa_only2 <- anti_join(lymnaea_taxa_only1, Culex_dataset4, by = "SITE_ID") #filter out sites with culex taxa (more sensitive taxa)
lymnaea_taxa_only3 <- merge(lymnaea_taxa_only2, Anglia3, by = "SITE_ID", all = TRUE) #add all site values
lymnaea_taxa_only4 <- merge(lymnaea_taxa_only3, long_lat, by = "SITE_ID", all = TRUE) # add long and lat 
#write.xlsx(lymnaea_taxa_only4, file= "Sites with only Lymnaea.xlsx", sep = ',')

#find sites with ischnura showing missing sites
Ischnura_dataset5 <- merge(Ischnura_dataset4, Anglia3, by = "SITE_ID", all = TRUE) # sites which contain Ischnura - add long/lat
Ischnura_dataset6 <- merge(Ischnura_dataset5, long_lat, by = "SITE_ID", all = TRUE) # sites which contain Ischnura
#write.xlsx(Ischnura_dataset6, file= "All sites which contain Ischnura.xlsx", sep = ',')

#find sites with both Lymnaea and Ischnura
ischun_lymna <- inner_join(Ischnura_dataset4, Lymnaea_dataset4, by = "SITE_ID") #merge sites which only contain Ischnura and Lymnaea
ischun_lymna2 <- merge(ischun_lymna, Anglia3, by = "SITE_ID", all = TRUE) # add all site_IDs to dataframe
ischun_lymna3 <- merge(ischun_lymna2, long_lat, by = "SITE_ID", all = TRUE) # add all long + lats
#write.xlsx(ischun_lymna3, file= "All sites which contain Ischnura and Lymnaea.xlsx", sep = ',')


################################################################################

#Section 4:
## Looking at physical and chemical parameters (other than pesticides) at sites with Ichnura and Lymnaea vs sites with only Lymnaea 


#For each dataset select only rows in years 1984 - 2011

#sum chemicals per sample/site
ACHE_data1 <- ACHE_data %>%
  group_by(SITE_ID, sample.sampleDateTime, DAY, MONTH, YEAR) %>%
  summarize(Sum_result = sum(result))

ACHE_data_FULL1 <- ACHE_data_FULL %>% #ALL sites include those which overlap biota/chem distance has not been established
  group_by(SITE_ID, sample.sampleDateTime, DAY, MONTH, YEAR) %>%
  summarize(Sum_result = sum(result))


#Add Year to datasets
zinc_data$SAMPLE_DATE  <- as.Date(zinc_data$SAMPLE_DATE , format = "%Y-%m-%d")
zinc_data$YEAR <- format(zinc_data$SAMPLE_DATE, format = "%Y")
dissolved_zinc_data$SAMPLE_DATE  <- as.Date(dissolved_zinc_data$SAMPLE_DATE , format = "%Y-%m-%d")
dissolved_zinc_data$YEAR <- format(dissolved_zinc_data$SAMPLE_DATE, format = "%Y")
copper_data$SAMPLE_DATE  <- as.Date(copper_data$SAMPLE_DATE , format = "%Y-%m-%d")
copper_data$YEAR <- format(copper_data$SAMPLE_DATE, format = "%Y")
dissolved_copper_data$SAMPLE_DATE  <- as.Date(dissolved_copper_data$SAMPLE_DATE , format = "%Y-%m-%d")
dissolved_copper_data$YEAR <- format(dissolved_copper_data$SAMPLE_DATE, format = "%Y")
flow_data$SAMPLE_DATE  <- as.Date(flow_data$SAMPLE_DATE , format = "%d/%m/%Y")
flow_data$YEAR <- format(flow_data$SAMPLE_DATE, format = "%Y")
temperature_data$SAMPLE_DATE  <- as.Date(temperature_data$SAMPLE_DATE , format = "%d/%m/%Y")
temperature_data$YEAR <- format(temperature_data$SAMPLE_DATE, format = "%Y")
alkalinity_data$SAMPLE_DATE  <- as.Date(alkalinity_data$SAMPLE_DATE , format = "%Y-%m-%d")
alkalinity_data$YEAR <- format(alkalinity_data$SAMPLE_DATE, format = "%Y")
ammonia_data$SAMPLE_DATE  <- as.Date(ammonia_data$SAMPLE_DATE , format = "%Y-%m-%d")
ammonia_data$YEAR <- format(ammonia_data$SAMPLE_DATE, format = "%Y")
ammoniacalNitrogen_data$SAMPLE_DATE  <- as.Date(ammoniacalNitrogen_data$SAMPLE_DATE , format = "%Y-%m-%d")
ammoniacalNitrogen_data$YEAR <- format(ammoniacalNitrogen_data$SAMPLE_DATE, format = "%Y")
BOD_data$SAMPLE_DATE  <- as.Date(BOD_data$SAMPLE_DATE , format = "%Y-%m-%d")
BOD_data$YEAR <- format(BOD_data$SAMPLE_DATE, format = "%Y")
COD_data$SAMPLE_DATE  <- as.Date(COD_data$SAMPLE_DATE , format = "%Y-%m-%d")
COD_data$YEAR <- format(COD_data$SAMPLE_DATE, format = "%Y")
conductivity_data$SAMPLE_DATE  <- as.Date(conductivity_data$SAMPLE_DATE , format = "%Y-%m-%d")
conductivity_data$YEAR <- format(conductivity_data$SAMPLE_DATE, format = "%Y")
hardness_data$SAMPLE_DATE  <- as.Date(hardness_data$SAMPLE_DATE , format = "%Y-%m-%d")
hardness_data$YEAR <- format(hardness_data$SAMPLE_DATE, format = "%Y")
nitrate_data$SAMPLE_DATE  <- as.Date(nitrate_data$SAMPLE_DATE , format = "%Y-%m-%d")
nitrate_data$YEAR <- format(nitrate_data$SAMPLE_DATE, format = "%Y")
nitrite_data$SAMPLE_DATE  <- as.Date(nitrite_data$SAMPLE_DATE , format = "%Y-%m-%d")
nitrite_data$YEAR <- format(nitrite_data$SAMPLE_DATE, format = "%Y")
orthophosphate_data$SAMPLE_DATE  <- as.Date(orthophosphate_data$SAMPLE_DATE , format = "%Y-%m-%d")
orthophosphate_data$YEAR <- format(orthophosphate_data$SAMPLE_DATE, format = "%Y")
oxygenDissolved_data$SAMPLE_DATE  <- as.Date(oxygenDissolved_data$SAMPLE_DATE , format = "%Y-%m-%d")
oxygenDissolved_data$YEAR <- format(oxygenDissolved_data$SAMPLE_DATE, format = "%Y")
oxygenSaturation_data$SAMPLE_DATE  <- as.Date(oxygenSaturation_data$SAMPLE_DATE , format = "%Y-%m-%d")
oxygenSaturation_data$YEAR <- format(oxygenSaturation_data$SAMPLE_DATE, format = "%Y")
PAH_data$SAMPLE_DATE  <- as.Date(PAH_data$SAMPLE_DATE , format = "%Y-%m-%d")
PAH_data$YEAR <- format(PAH_data$SAMPLE_DATE, format = "%Y")
pH_data$SAMPLE_DATE  <- as.Date(pH_data$SAMPLE_DATE , format = "%Y-%m-%d")
pH_data$YEAR <- format(pH_data$SAMPLE_DATE, format = "%Y")
suspendedSolids_data$SAMPLE_DATE  <- as.Date(suspendedSolids_data$SAMPLE_DATE , format = "%Y-%m-%d")
suspendedSolids_data$YEAR <- format(suspendedSolids_data$SAMPLE_DATE, format = "%Y")
turbidity_data$SAMPLE_DATE  <- as.Date(turbidity_data$SAMPLE_DATE , format = "%Y-%m-%d")
turbidity_data$YEAR <- format(turbidity_data$SAMPLE_DATE, format = "%Y")

#Extract rows 1984 - 2011
ACHE_data_1984 <- ACHE_data1[ACHE_data1$YEAR >= 1984 & ACHE_data1$YEAR <= 2011, ]
ACHE_data_FULL_1984 <- ACHE_data_FULL1[ACHE_data_FULL1$YEAR >= 1984 & ACHE_data_FULL1$YEAR <= 2011, ]
alkalinity_data_1984 <- alkalinity_data[alkalinity_data$YEAR >= 1984 & alkalinity_data$YEAR <= 2011, ]
ammonia_data_1984 <- ammonia_data[ammonia_data$YEAR >= 1984 & ammonia_data$YEAR <= 2011, ]
ammoniacalNitrogen_data_1984 <- ammoniacalNitrogen_data[ammoniacalNitrogen_data$YEAR >= 1984 & ammoniacalNitrogen_data$YEAR <= 2011, ]
BOD_data_1984 <- BOD_data[BOD_data$YEAR >= 1984 & BOD_data$YEAR <= 2011, ]
COD_data_1984 <- COD_data[COD_data$YEAR >= 1984 & COD_data$YEAR <= 2011, ]
conductivity_data_1984 <- conductivity_data[conductivity_data$YEAR >= 1984 & conductivity_data$YEAR <= 2011, ]
hardness_data_1984 <- hardness_data[hardness_data$YEAR >= 1984 & hardness_data$YEAR <= 2011, ]
nitrate_data_1984 <- nitrate_data[nitrate_data$YEAR >= 1984 & nitrate_data$YEAR <= 2011, ]
nitrite_data_1984 <- nitrite_data[nitrite_data$YEAR >= 1984 & nitrite_data$YEAR <= 2011, ]
orthophosphate_data_1984 <- orthophosphate_data[orthophosphate_data$YEAR >= 1984 & orthophosphate_data$YEAR <= 2011, ]
oxygenDissolved_data_1984 <- oxygenDissolved_data[oxygenDissolved_data$YEAR >= 1984 & oxygenDissolved_data$YEAR <= 2011, ]
oxygenSaturation_data_1984 <- oxygenSaturation_data[oxygenSaturation_data$YEAR >= 1984 & oxygenSaturation_data$YEAR <= 2011, ]
PAH_data_1984 <- PAH_data[PAH_data$YEAR >= 1984 & PAH_data$YEAR <= 2011, ]
pH_data_1984 <- pH_data[pH_data$YEAR >= 1984 & pH_data$YEAR <= 2011, ]
suspendedSolids_data_1984 <- suspendedSolids_data[suspendedSolids_data$YEAR >= 1984 & suspendedSolids_data$YEAR <= 2011, ]
turbidity_data_1984 <- turbidity_data[turbidity_data$YEAR >= 1984 & turbidity_data$YEAR <= 2011, ]
flow_data_1984 <- flow_data[flow_data$YEAR >= 1984 & flow_data$YEAR <= 2011, ]
temperature_data_1984 <- temperature_data[temperature_data$YEAR >= 1984 & temperature_data$YEAR <= 2011, ]
zinc_data_1984 <- zinc_data[zinc_data$YEAR >= 1984 & zinc_data$YEAR <= 2011, ]
dissolved_zinc_data_1984 <- dissolved_zinc_data[dissolved_zinc_data$YEAR >= 1984 & dissolved_zinc_data$YEAR <= 2011, ]
copper_data_1984 <- copper_data[copper_data$YEAR >= 1984 & copper_data$YEAR <= 2011, ]
dissolved_copper_data_1984 <- dissolved_copper_data[dissolved_copper_data$YEAR >= 1984 & dissolved_copper_data$YEAR <= 2011, ]

#Find max for each site per variable

#ACHE

ACHE_data_1984_max <- ACHE_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(avg_ACHE = max(Sum_result, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_ACHE = max(avg_ACHE, na.rm = TRUE))

ACHE_data_FULL_1984_Max <- ACHE_data_FULL_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_FULL_ACHE = max(Sum_result, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_FULL_ACHE= max(max_FULL_ACHE, na.rm = TRUE))


#other variables have mean and max already calculated - LOQ1 is values with LOQ counted as LOQ

alkalinity_data_1984_Max <- alkalinity_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_alkalinity = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_alkalinity = max(max_alkalinity, na.rm = TRUE))


ammonia_data_1984_Max <- ammonia_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_ammoonia = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_ammoonia = max(max_ammoonia, na.rm = TRUE))


ammoniacalNitrogen_data_1984_Max <- ammoniacalNitrogen_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_ammoniacalNitrogen = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_ammoniacalNitrogen = max(max_ammoniacalNitrogen, na.rm = TRUE))


BOD_data_1984_Max <- BOD_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_BOD = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_BOD = max(max_BOD, na.rm = TRUE))


COD_data_1984_Max <- COD_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_COD = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_COD = max(max_COD, na.rm = TRUE))


conductivity_data_1984_Max <- conductivity_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_conductivity = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_conductivity = max(max_conductivity, na.rm = TRUE))


hardness_data_1984_Max <- hardness_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_hardness = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_hardness = max(max_hardness, na.rm = TRUE))

nitrate_data_1984_Max <- nitrate_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_nitrate = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_nitrate = max(max_nitrate, na.rm = TRUE))


nitrite_data_1984_Max <- nitrite_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_nitrite = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_nitrite = max(max_nitrite, na.rm = TRUE))


orthophosphate_data_1984_Max <- orthophosphate_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_Orthophospahte = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_Orthophospahte= max(max_Orthophospahte, na.rm = TRUE))


oxygenDissolved_data_1984_Max <- oxygenDissolved_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_OxygenDissolved = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_OxygenDissolved= max(max_OxygenDissolved, na.rm = TRUE))


oxygenSaturation_data_1984_Max <- oxygenSaturation_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_oxygenSaturation = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_oxygenSaturation = max(max_oxygenSaturation, na.rm = TRUE))


PAH_data_1984_Max <- PAH_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_PAH = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_PAH= max(max_PAH, na.rm = TRUE))


pH_data_1984_Max <- pH_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_ph = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_ph = max(max_ph, na.rm = TRUE))


suspendedSolids_data_1984_Max <- suspendedSolids_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_suspendedsolids = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_suspendedsolids = max(max_suspendedsolids, na.rm = TRUE))



turbidity_data_1984_Max <- turbidity_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_turbidity = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_turbidity= max(max_turbidity, na.rm = TRUE))



flow_data_1984_Max <- flow_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_flow = max(mean, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_flow= max(max_flow, na.rm = TRUE))


temperature_data_1984_Max <- temperature_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_temperature = max(max, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_temperature= max(max_temperature, na.rm = TRUE))

boulder_cobble <- site_variables_data %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_boulder_cobble = max(BOULDERS_COBBLES, na.rm = TRUE))

pebbles_gravel <- site_variables_data %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_pebbles_gravel = max(PEBBLES_GRAVEL , na.rm = TRUE))

sand <- site_variables_data %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_sand = max(SAND  , na.rm = TRUE))

silt_clay <- site_variables_data %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_silt_clay = max(SILT_CLAY  , na.rm = TRUE))

arable <- site_variables_data %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_arable = max(Area_sq_km_arable  , na.rm = TRUE))

urban <- site_variables_data %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_urban = max(Area_sq_km_urban  , na.rm = TRUE))




dissolved_copper_data_1984_Max <- dissolved_copper_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_dissolvedCopper = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_dissolvedCopper = max(max_dissolvedCopper, na.rm = TRUE))



copper_data_1984_Max <- copper_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_copper = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_copper = max(max_copper, na.rm = TRUE))



dissolved_zinc_data_1984_Max <- dissolved_zinc_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_dissolvedzinc = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_dissolvedzinc = max(max_dissolvedzinc, na.rm = TRUE))



zinc_data_1984_Max <- zinc_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_zinc = max(Max_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_max_zinc = max(max_zinc, na.rm = TRUE))

#Find mean for each site per variable

ACHE_data_1984_Mean <- ACHE_data_1984 %>%
  group_by(SITE_ID) %>%
  summarize(mean_ACHE = mean(Sum_result))


ACHE_data_FULL_1984_Mean <- ACHE_data_FULL_1984 %>%
  group_by(SITE_ID) %>%
  summarize(mean_FULL_ACHE = mean(Sum_result))


#other variables have mean and max already calculated - LOQ1 is values with LOQ counted as LOQ

alkalinity_data_1984_mean <- alkalinity_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_alkalinity = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_alkalinity = mean(max_alkalinity, na.rm = TRUE))


ammonia_data_1984_mean <- ammonia_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_ammoonia = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_ammoonia = mean(max_ammoonia, na.rm = TRUE))


ammoniacalNitrogen_data_1984_mean <- ammoniacalNitrogen_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_ammoniacalNitrogen = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_ammoniacalNitrogen = mean(max_ammoniacalNitrogen, na.rm = TRUE))


BOD_data_1984_mean <- BOD_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_BOD = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_BOD = mean(max_BOD, na.rm = TRUE))


COD_data_1984_mean <- COD_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_COD = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_COD = mean(max_COD, na.rm = TRUE))


conductivity_data_1984_mean <- conductivity_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_conductivity = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_conductivity = mean(max_conductivity, na.rm = TRUE))


hardness_data_1984_mean <- hardness_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_hardness = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_hardness = mean(max_hardness, na.rm = TRUE))

nitrate_data_1984_mean <- nitrate_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_nitrate = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_nitrate = mean(max_nitrate, na.rm = TRUE))


nitrite_data_1984_mean <- nitrite_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_nitrite = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_nitrite = mean(max_nitrite, na.rm = TRUE))


orthophosphate_data_1984_mean <- orthophosphate_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_Orthophospahte = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_Orthophospahte= mean(max_Orthophospahte, na.rm = TRUE))


oxygenDissolved_data_1984_mean <- oxygenDissolved_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_OxygenDissolved = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_OxygenDissolved= mean(max_OxygenDissolved, na.rm = TRUE))


oxygenSaturation_data_1984_mean <- oxygenSaturation_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_oxygenSaturation = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_oxygenSaturation = mean(max_oxygenSaturation, na.rm = TRUE))


PAH_data_1984_mean <- PAH_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_PAH = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_PAH= mean(max_PAH, na.rm = TRUE))


pH_data_1984_mean <- pH_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_ph = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_ph = mean(max_ph, na.rm = TRUE))


suspendedSolids_data_1984_mean <- suspendedSolids_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_suspendedsolids = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_suspendedsolids = mean(max_suspendedsolids, na.rm = TRUE))



turbidity_data_1984_mean <- turbidity_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_turbidity = mean(Mean_LOQ1, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_turbidity= mean(max_turbidity, na.rm = TRUE))



flow_data_1984_mean <- flow_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_flow = mean(mean, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_flow= mean(max_flow, na.rm = TRUE))


temperature_data_1984_mean <- temperature_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(max_temperature = mean(mean, na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_temperature= mean(max_temperature, na.rm = TRUE))

dissolved_copper_data_1984_mean <- dissolved_copper_data_1984  %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(mean_dissolvedCopper = mean(Mean_LOQ1   , na.rm = TRUE)) %>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_dissolvedCopper= mean(mean_dissolvedCopper, na.rm = TRUE))

copper_data_1984_mean <- copper_data_1984  %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(mean_copper = mean(Mean_LOQ1   , na.rm = TRUE))%>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_copper= mean(mean_copper, na.rm = TRUE))

dissolved_zinc_data_1984_mean <- dissolved_zinc_data_1984 %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(mean_dissolvedzinc = mean(Mean_LOQ1    , na.rm = TRUE))%>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_dissolvedzinc= mean(mean_dissolvedzinc, na.rm = TRUE))

zinc_data_1984_mean <- zinc_data_1984  %>%
  group_by(SITE_ID, YEAR) %>%
  summarize(mean_zinc = max(Mean_LOQ1   , na.rm = TRUE))%>%
  group_by(SITE_ID) %>%
  summarize(avg_yearly_mean_zinc= mean(mean_zinc, na.rm = TRUE))
#MERGE all Datasets based on SITE

# List of dataframes to merge - ACHE mean
dataframes_to_merge_ACHE_MEAN <- list(
  ACHE_data_1984_Mean,
  ACHE_data_FULL_1984_Mean,
  alkalinity_data_1984_mean,
  ammonia_data_1984_mean,
  ammoniacalNitrogen_data_1984_mean,
  BOD_data_1984_mean,
  COD_data_1984_mean,
  conductivity_data_1984_mean,
  hardness_data_1984_mean,
  nitrate_data_1984_mean,
  nitrite_data_1984_mean,
  orthophosphate_data_1984_mean,
  oxygenDissolved_data_1984_mean,
  oxygenSaturation_data_1984_mean,
  PAH_data_1984_mean,
  pH_data_1984_mean,
  suspendedSolids_data_1984_mean,
  turbidity_data_1984_mean, 
  flow_data_1984_mean,
  temperature_data_1984_mean,
  silt_clay,
  sand,
  pebbles_gravel,
  boulder_cobble, urban, arable,
  zinc_data_1984_mean,
  dissolved_zinc_data_1984_mean,
  copper_data_1984_mean,
  dissolved_copper_data_1984_mean
  
)

dataframes_to_merge_ACHE_Max <- list(
  ACHE_data_1984_max,
  ACHE_data_FULL_1984_Max,
  alkalinity_data_1984_Max,
  ammonia_data_1984_Max,
  ammoniacalNitrogen_data_1984_Max,
  BOD_data_1984_Max,
  COD_data_1984_Max,
  conductivity_data_1984_Max,
  hardness_data_1984_Max,
  nitrate_data_1984_Max,
  nitrite_data_1984_Max,
  orthophosphate_data_1984_Max,
  oxygenDissolved_data_1984_Max,
  oxygenSaturation_data_1984_Max,
  PAH_data_1984_Max,
  pH_data_1984_Max,
  suspendedSolids_data_1984_Max,
  turbidity_data_1984_Max,
  flow_data_1984_Max,
  temperature_data_1984_Max,
  zinc_data_1984_Max,
  dissolved_zinc_data_1984_Max,
  copper_data_1984_Max,
  dissolved_copper_data_1984_Max
)


# Merge dataframes by "SITE_ID" with dataframe that specifies if sites contain Lymanaea and Ichnurna or just Lymnaea
MEAN_ACHE_completedataset_forsites <- ACHE_taxa_data
for (df in dataframes_to_merge_ACHE_MEAN) {
  MEAN_ACHE_completedataset_forsites <- left_join(MEAN_ACHE_completedataset_forsites, df, by = "SITE_ID")
}

MAX_ACHE_completedataset_forsites <- ACHE_taxa_data
for (df in dataframes_to_merge_ACHE_Max) {
  MAX_ACHE_completedataset_forsites <- left_join(MAX_ACHE_completedataset_forsites, df, by = "SITE_ID")
}

#MERGE ACHE datasets - mean and max
ACHE_completedataset_forsites <- left_join(MEAN_ACHE_completedataset_forsites, MAX_ACHE_completedataset_forsites, by = "SITE_ID")


#Run comparison analysis

#Select sites which have chemical data accurately matched to biota site (only 30 sites):
ACHE_completedataset_forsites_SUBSET <- ACHE_completedataset_forsites[ACHE_completedataset_forsites$SITE_ID %in% c(
  "55006", "55088", "55359", "55436", "55566", "55833", "54717", "54794", "54902", "54962", "55022", "55023", "55127", "56083", "55171", 
  "55186", "55245", "55311", "55312", "55321", "55376", "56109", "55429", "55433", "55539", "55598", "55683", "55854", "56041", "56404"), ]

#gather all variable names
variable_names_ACHE <- c("mean_ACHE", "avg_yearly_mean_alkalinity", "avg_yearly_mean_ammoonia", "avg_yearly_mean_ammoniacalNitrogen", "avg_yearly_mean_BOD", "avg_yearly_mean_COD",
                         "avg_yearly_mean_conductivity", "avg_yearly_mean_hardness", "avg_yearly_mean_nitrate", "avg_yearly_mean_nitrite", "avg_yearly_mean_Orthophospahte", "avg_yearly_mean_OxygenDissolved", "avg_yearly_mean_oxygenSaturation",
                         "avg_yearly_mean_PAH", "avg_yearly_mean_ph", "avg_yearly_mean_suspendedsolids", "avg_yearly_mean_turbidity",  "avg_yearly_max_alkalinity", "avg_yearly_max_ammoonia",
                         "avg_yearly_max_ammoniacalNitrogen", "avg_yearly_max_BOD", "avg_yearly_max_COD", "avg_yearly_max_conductivity", "avg_yearly_max_hardness", "avg_yearly_max_nitrate", "avg_yearly_max_nitrite",
                         "avg_yearly_max_Orthophospahte", "avg_yearly_max_OxygenDissolved", "avg_yearly_max_oxygenSaturation","avg_yearly_mean_oxygenSaturation", "avg_yearly_max_PAH", "avg_yearly_max_ph", "avg_yearly_max_suspendedsolids",
                         "avg_yearly_max_turbidity", "avg_yearly_mean_flow", "avg_yearly_max_flow", "avg_yearly_mean_temperature", "avg_yearly_max_temperature", "avg_yearly_max_silt_clay", "avg_yearly_max_sand", 
                         "avg_yearly_max_pebbles_gravel","avg_yearly_max_boulder_cobble", "avg_yearly_max_arable", "avg_yearly_max_urban", "avg_yearly_mean_dissolvedCopper", "avg_yearly_mean_copper",
                         "avg_yearly_mean_dissolvedzinc", "avg_yearly_mean_zinc", "avg_yearly_max_zinc", "avg_yearly_max_dissolvedzinc", "avg_yearly_max_dissolvedCopper", "avg_yearly_max_copper")

#make custome labels
custom_labels <- c("Mean AChE", "Mean alkalinity (mg/l)", "Mean ammonia (mg/l)", "Mean Ammonicaial nitrogen (mg/l)", "Mean BOD (mg/l)", "Mean COD",
                   "Mean conductivity (us/cm)", "Mean hardness (mg/l)", "Mean nitrate (mg/l)", "Mean nitrite (mg/l)", "Mean orthophosphate (mg/l)", "Mean dissolved oxygen (mg/l)", "Mean Oxygen Saturation",
                   "Mean PAH", "Mean pH", "Mean suspended solids (mg/l)", "Mean turbidity (NTU)",  "Max alkalinity (mg/l)", "Max ammoonia (mg/l)",
                   "Max ammoniacal nitrogen (mg/l)", "Max BOD (mg/l)", "Max COD", "Max conductivity (us/cm)", "Max hardness (mg/l)", "Max nitrate (mg/l)", "Max nitrite (mg/l)",
                   "Max orthophospahte (mg/l)", "Max dissolved oxygen (mg/l)", "Max oxygen Saturation (%)", "Mean oxygen Saturation (%)","Max PAH", "Max pH", "Max suspended solids (mg/l)",
                   "Max turbidity (NTU)", "Mean flow (m2/s)", "Max flow (m2/s)", "Mean temperature (°C)", "Max temperature (°C)", "Max silt/clay (%)", "Max sand (%)", 
                   "Max pebbles/gravel (%)","Max boulder/cobble (%)", "Max arable (%)", "Max urban (%)", "Mean dissolved copper (µg/l)", "Mean copper (µg/l)",
                   "Mean dissolved zinc (µg/l)", "Mean zinc (µg/l)", "Max Zinc (µg/l)", "Max dissolved zinc(µg/l)", "Max dissolved copper(µg/l)", "Max copper(µg/l)")

ACHE_completedataset_forsites_SUBSET$presence.x <- as.character(ACHE_completedataset_forsites_SUBSET$presence.x) #change columne to character


#make Boxplots

boxplots_list <- list()

for (i in seq_along(variable_names_ACHE)) {
  variable <- variable_names_ACHE[i]
  
  boxplot <- ggplot(ACHE_completedataset_forsites_SUBSET, aes(x = factor(presence.x), y = .data[[variable]], fill = factor(presence.x))) +
    geom_boxplot() +
    theme_minimal() +
    labs(title = NULL, x=NULL) +  # Set y-axis label directly
    guides(fill = FALSE)  +
    theme(text = element_text(size = 20))  # Set the font size to 20
  
  boxplots_list[[variable]] <- boxplot
  ggsave(paste("boxplot_", variable, ".png", sep = ""), boxplot)
  
}

# Print or save the boxplots
for (variable in variable_names_ACHE) {
  print(boxplots_list[[variable]])
}
# Print boxplots
print(boxplots_list)   