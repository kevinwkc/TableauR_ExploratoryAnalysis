# Check if Rserve is installed
if (!require("Rserve")) install.packages("Rserve", repos="https://cran.univ-paris1.fr/")

####################################################
# You can add packages to load at startup here
# Example:
# if (!require("pacman")) install.packages("pacman")
# pacman::p_load(data.table, dplyr)
####################################################

# Start Rserve
Rserve::Rserve()
