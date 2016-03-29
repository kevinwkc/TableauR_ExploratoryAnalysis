# This file is sourced when Rserve is started

# Set a CRAN repository for the Rserve session
# Comment or remove this code if you want to use
# the CRAN repository from your R installation
repos <- getOption("repos")
repos["CRAN"] <- "https://cloud.r-project.org/"
options(repos=repos)

# You can specify a set of R packages, comma 
# separated without quotes, inside the p_load function
# These will be loaded/installed when starting Rserve
if(!require("pacman")) install.packages("pacman") 
pacman::p_load(mgcv)
