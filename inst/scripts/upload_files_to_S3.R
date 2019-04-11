##
## upload_files_to_S3.R
## Script for uploading data to amazon S3 bucket
##
## Written by Marta R. Hidalgo
##

version <- "v2"
setwd("~/appl/hpAnnot/inst/extdata/")

## FOR INDIVIDUAL FILES
setwd(version)
files <- list.files()
for(file in files){
    order <- paste0("aws --profile AnnotationContributor s3 cp ", 
                    file, 
                    " s3://annotation-contributor/hpAnnot/", version, "/", 
                    file, 
                    " --acl public-read")
    system(order)
}

## FOR WHOLE VERSION FOLDER
order <- paste0("aws --profile AnnotationContributor s3 cp ", 
                version, 
                " s3://annotation-contributor/hpAnnot/", 
                version, 
                " --recursive --acl public-read")
system(order)
