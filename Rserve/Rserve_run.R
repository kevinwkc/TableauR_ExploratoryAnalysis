# Check if Rserve is installed:
if (!require("Rserve")) install.packages("Rserve", repos="https://cloud.r-project.org/")

# Start Rserve, using the conf file located in the same directory.
# This file is simply sourcing Rserve_preload.R when starting Rserve.
Rserve::Rserve(args = "--RS-conf Rserve.conf")
