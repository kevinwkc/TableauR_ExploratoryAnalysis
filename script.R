# ####### fitting a model for the trend line
#       # common variables
#       x <- df$total_bill
#       y <- df$tip
#       conf_interval <- 0.05
#       fit_type <- "loess" # not used for now
# 
#       # Local Polynomial Regression Fitting
#       p_loess <- predict(loess(y ~ x), se=TRUE) 
#       
#       # lower bound
#       loess_lower <- p_loess$fit - qt(1 - conf_interval / 2, p_loess$df) * p_loess$se
#       
#       # fit
#       loess_fit <- p_loess$fit
#       
#       # upper bound
#       loess_upper <- p_loess$fit + qt(1 - conf_interval / 2, p_loess$df) * p_loess$se

if (!require("pacman")) install.packages("pacman")
pacman::p_load(downloader, data.table, dplyr)

# download and load the data (Windows setup)
if(!file.exists("./data/insertion_raw.csv")) {
      if(!file.exists("./data")) {dir.create("./data")}
      dataUrl <- paste0("https://data.enseignementsup-recherche.gouv.fr/explore/dataset/", 
                        "fr-esr-insertion_professionnelle-master/download?format=csv")
      download(dataUrl, dest="./data/insertion_raw.csv", mode="wb")
} else message("The dataset had previously been downloaded.")

# read data with fread(), with list of strings to ignore
insertion <- fread("./data/insertion_raw.csv", sep = ";", encoding = "UTF-8", 
                   na.strings = c("NA", "ns", "nd", "fe", ".", paste0(1,"\U00A0",710), ""))

# remove data if sample is too small (nombre_de_reponses < 30) 
# or if the response rate is too low (taux_de_reponse < 30)
# also remove rows with "UNIV" as univerisity code (this is a grouping)
insertion <- filter(insertion, nombre_de_reponses >= 30, taux_de_reponse >= 30, 
                    numero_de_l_etablissement != "UNIV")

# export data in csv for Tableau
# note: we remove R "NAs" and replace with empty cells since Tableau doesn't handle them
insertion_noNa <- insertion
insertion_noNa[is.na(insertion_noNa)] <- ""
write.csv(insertion_noNa, "./data/insertion_Tableau.csv", row.names = FALSE)
remove(insertion_noNa)

# show sample
str(insertion)

# unique cases
strings <- paste(insertion$cle_etab,
                 insertion$annee,
                 insertion$cle_disc,
                 sep = " | ")
length(unique(strings))





# download and load the data (Windows setup)
if(!file.exists("./data/etablissements_raw.csv")) {
      if(!file.exists("./data")) {dir.create("./data")}
      dataUrl <- paste0("http://data.enseignementsup-recherche.gouv.fr/explore/dataset/", 
                        "fr-esr-principaux-etablissements-enseignement-superieur_2014/", 
                        "download/?format=csv&timezone=Europe/Berlin&use_labels_for_header=true")
      download(dataUrl, dest="./data/etablissements_raw.csv", mode="wb")
} else message("The dataset had previously been downloaded.")

# read and subset data, rename column names
etablissements <- read.csv2("./data/etablissements_raw.csv", encoding = "UTF-8", check.names = FALSE)
etablissements <- etablissements[c("uai - identifiant", "Libellé", "type d'établissement", "Site internet",
                                   "Géolocalisation", "Code postal", "Commune", "Unité urbaine", 
                                   "Département", "Région", "Pays")]


schools <- unique(insertion$numero_de_l_etablissement)
length(schools)
ins <- schools %in% etablissements[,"uai - identifiant"]
schools[!ins]
