##
## upload_files_to_S3.R
## Script for uploading data to amazon S3 bucket
##
## Written by Marta R. Hidalgo
##


setwd("~/appl/hpAnnot/inst/extdata/v1/")
files <- list.files()

for(file in files){
    order <- paste0("aws --profile AnnotationContributor s3 cp ", 
                    file, 
                    " s3://annotation-contributor/hpAnnot/v1/", 
                    file, 
                    " --acl public-read")
    system(order)
}
