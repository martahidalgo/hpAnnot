##
## make-metadata.R
## Script to write the metadata.csv in inst/extdata for AnnotationHub
##
## Written by Marta R. Hidalgo
##

## LIBRARIES
library(AnnotationHubData)

setwd("~/appl/hpAnnot/inst/extdata/")
version <- "v2"
files <- list.files(version)

species <- sapply(files, function(file){
    if(grepl(pattern = "hsa", file)){
        return("Homo sapiens")
    }else if(grepl("mmu", file)){
        return("Mus musculus")
    }else if(grepl("rno", file)){
        return("Rattus norvegicus")
    }else{
        return(NA)
    }
})

description <- sapply(files, function(file){
    if(grepl("annofuns", file)){
        des <- "Annotations from pathways to"
    }else if(grepl("annot", file)){
        des <- "Annotations from genes to"
    }else if(grepl("entrez", file)){
        des <- "Annotations from EntrezID to GeneSymbol"
    }else if(grepl("go_bp_frame", file)){
        des <- "Annotations for GO Biological Process terms"
    }else if(grepl("go_bp_net", file)){
        des <- "Annotations for GO Biological Process net"
    }else if(grepl("meta_graph_info", file)){
        des <- "Pathways topologies"
    }else if(grepl("pmgi", file)){
        des <- "Pseudo-pathways topologies grouped by"
    }else if(grepl("xref", file)){
        des <- "XRef transformation of genes"
    }else{
        des <- NA
    }
    
    if(grepl("GO", file)){
        des <- paste(des, "GO terms")
    }else if(grepl("uniprot", file)){
        des <- paste(des, "Uniprot keywords")
    }else if(grepl("genes", file)){
        des <- paste(des, "genes")
    }
    
    if(grepl("hsa", file)){
        des <- paste(des, "for HSA species")
    }else if(grepl("mmu", file)){
        des <- paste(des, "for MMU species")
    }else if(grepl("rno", file)){
        des <- paste(des, "for RNO species")
    }
    
    return(des)
})

biocversion <- 3.9
genome <- NA
SourceType <- "RData"

SourceUrl <- sapply(files, function(file){
    if(grepl("annofuns", file)){
        des <- "https://www.ensembl.org/biomart"
    }else if(grepl("annot", file)){
        des <- "https://www.ensembl.org/biomart"
    }else if(grepl("entrez", file)){
        des <- "https://www.ensembl.org/biomart"
    }else if(grepl("go_bp_frame", file)){
        des <- "http://www.geneontology.org/"
    }else if(grepl("go_bp_net", file)){
        des <- "http://www.geneontology.org/"
    }else if(grepl("meta_graph_info", file)){
        des <- "http://www.genome.jp/kegg/"
    }else if(grepl("pmgi", file)){
        des <- "http://www.genome.jp/kegg/"
    }else if(grepl("xref", file)){
        des <- "https://www.ensembl.org/biomart"
    }else{
        des <- NA
    }
    return(des)
})

SourceVersion <- NA_character_
TaxonomyId <- NA_character_
Coordinate_1_based <- NA_character_

DataProvider <- sapply(files, function(file){
    if(grepl("annofuns", file)){
        des <- "BioMart"
    }else if(grepl("annot", file)){
        des <- "BioMart"
    }else if(grepl("entrez", file)){
        des <- "BioMart"
    }else if(grepl("go_bp_frame", file)){
        des <- "GeneOntology"
    }else if(grepl("go_bp_net", file)){
        des <- "GeneOntology"
    }else if(grepl("meta_graph_info", file)){
        des <- "KEGG"
    }else if(grepl("pmgi", file)){
        des <- "KEGG"
    }else if(grepl("xref", file)){
        des <- "BioMart"
    }else{
        des <- NA
    }
    return(des)
})

Maintainer <- "Marta R. Hidalgo marta.hidalgo@outlook.es"

RDataClass <- sapply(files, function(file){
    if(grepl("annofuns", file)){
        des <- "data.frame"
    }else if(grepl("annot", file)){
        des <- "data.frame"
    }else if(grepl("entrez", file)){
        des <- "data.frame"
    }else if(grepl("go_bp_frame", file)){
        des <- "data.frame"
    }else if(grepl("go_bp_net", file)){
        des <- "igraph"
    }else if(grepl("meta_graph_info", file)){
        des <- "list"
    }else if(grepl("pmgi", file)){
        des <- "list"
    }else if(grepl("xref", file)){
        des <- "list"
    }else{
        des <- NA
    }
    return(des)
})

DispatchClass <- "Rda"
RDataPath <- paste0("hpAnnot/", version , "/", files)
tags <- c("pathways", "HiPathia", "hpAnnot", "Signaling", "Annotation")
    

csv <- data.frame(Title = files, 
                  Description = description, 
                  BiocVersion = biocversion, 
                  Genome = genome, 
                  SourceType = SourceType, 
                  SourceUrl = SourceUrl,
                  SourceVersion = SourceVersion, 
                  Species = species, 
                  TaxonomyId = TaxonomyId, 
                  Coordinate_1_based = Coordinate_1_based, 
                  DataProvider = DataProvider,
                  Maintainer = Maintainer, 
                  RDataClass = RDataClass, 
                  DispatchClass = DispatchClass,
                  RDataPath = RDataPath,
                  Tags = paste(tags, collapse = ", "),
                  ResourceName = files,
                  stringsAsFactors = FALSE)

write.csv(csv, file = paste0("metadata_", version, ".csv"), row.names = FALSE)
# write.csv(csv, file = "metadata.csv", row.names = FALSE)

makeAnnotationHubMetadata("~/appl/hpAnnot/")
