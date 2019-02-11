#############################  
##   Batch Web Harvest     ##
##   by do-me 31.05.2018   ##
#############################  

# Batch download specific files from a web directory to working directory
# Here: only files > year 2000

library(raster)
library(sp)
library(bitops)
library(rgdal)
library(RCurl)
# if necessary set working directory with setwd("C:/your_directory") 

url = "ftp://ftp.chg.ucsb.edu/pub/org/chg/products/CHIRPS-2.0/global_monthly/tifs/"
filenames = getURL(url, ftp.use.epsv = FALSE, dirlistonly=TRUE, crlf=TRUE)
name = unlist(strsplit(filenames,"\r\n")) # paragraph split

for (i in 1:i) # start loop
  {yearmonth = unlist(strsplit(name[i], "[.]"))  # split by '.'
  finyear[i] = (yearmonth[3])
  finmonth[i] = (yearmonth[4])
  
  if (finyear[i] > "2000") # if condition
  currentfilename = paste(finyear[i],".", finmonth[i],".tif.gz", sep = '')
  currenturl = paste(url,"chirps-v2.0.", finyear[i],".", finmonth[i],".tif.gz", sep='')
  
  # if condition is true, download
  {download.file(currenturl, currentfilename, quiet = FALSE, mode = "w",cacheOK = TRUE) 
  }
  }
