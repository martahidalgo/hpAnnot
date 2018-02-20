##
## make-data.R
## Script to show how data in hpAnnot has been generated
##
## Written by Marta R. Hidalgo
##


species <- c("hsa", "mmu", "rno")
dbs <- c("GO", "uniprot")
edpath <- "inst/extdata/"
setwd("private/")

# 1.- Unzip xref/refs.tar.gz in xref/

# 2.- Run xref/xref.R

# 3.- Run 
for(spe in species){
    xref_folder <- paste0("private/xref/", spe, "/")
    xref_file <- paste0(xref_folder, "xref_", spe, ".RData")
    xr <- load(xref_file)
    xref <- get(xr)
    save(xref, file=paste0(edpath, "xref_", spe, ".rda"), compress = "bzip2")
}


# 4.- Unzip annotations/raw_data.tar.gz in annotations/

# 5.- Run annotations/prepare_annotations.R

# 6.- Run 
load("private/annotations/annotations/go_bp_frame.RData")
save(go_bp_frame, file = paste0(edpath, "go_bp_frame.rda"), compress = "bzip2")
load("private/annotations/annotations/go_bp_net.RData")
save(go_bp_net, file = paste0(edpath, "go_bp_net.rda"), compress = "bzip2")

# GO_bp_annots
for(spe in species){
    gba_folder <- paste0("private/annotations/annotations/", spe, "/")
    gba_file <- paste0(gba_folder, "/go_bp_", spe, ".annot")
    go_bp_annot <- read.delim(gba_file,
                              sep = "\t",
                              header = FALSE,
                              stringsAsFactors = FALSE,
                              comment.char = "!")
    go_bp_annot <- go_bp_annot[,1:2]
    colnames(go_bp_annot) <- c("gene","function")
    bpfile <- paste0(edpath, "annot_GO_", spe, ".rda")
    save(go_bp_annot, file = bpfile, compress = "bzip2")
}


# Uni_bp_annots
for(spe in species){
    gba_folder <- paste0("private/annotations/annotations/", spe, "/")
    uba_file <- paste0(gba_folder, "/uniprot_keywords_",
                       spe, "__biological_process.annot")
    uni_bp_annot <- read.delim(uba_file,
                               sep = "\t",
                               header = FALSE,
                               stringsAsFactors = FALSE,
                               comment.char = "!")
    uni_bp_annot <- uni_bp_annot[,1:2]
    colnames(uni_bp_annot) <- c("gene","function")
    ubpfile <- paste0(edpath, "annot_uniprot_", spe, ".rda")
    save(uni_bp_annot, file = ubpfile, compress = "bzip2")
}

# Entrez_HGNC
for(spe in species){
    eh_folder <- paste0("private/annotations/annotations/", spe, "/")
    eh_file <- paste0(eh_folder, "/entrez_hgnc_", spe, ".annot")
    entrez_hgnc <- read.delim(eh_file,
                              sep = "\t",
                              header = FALSE,
                              stringsAsFactors = FALSE,
                              comment.char = "!")
    ehfile <- paste0(edpath, "entrez_hgnc_", spe, ".rda")
    save(entrez_hgnc, file = ehfile, compress = "bzip2")
}



# 7.- Unzip pathways/XMLs.tar.gz in pathways/

# 8.- Run pathways/scripts/create_metaginfo.R

# 9.- Run 
for(spe in species){
    path <- paste0("private/pathways/", spe, "/temp/meta_graph_info_",
                   spe, ".RData")
    mgi <- load(path)
    meta_graph_info <- get(mgi)
    meta_graph_info$species <- spe
    mgifile <- paste0(edpath, "meta_graph_info_", spe, ".rda")
    save(meta_graph_info, file = mgifile, compress = "bzip2")
}


# 10.- Run annofuns/create_annofuns.R

# 11.- Run 
for(db in dbs){
    for(spe in species){
        load(paste0("private/annofuns/annofuns_", db, "_", spe, ".RData"))
        save(annofuns, file = paste0(edpath, "annofuns_", db, "_", spe, ".rda"), 
             compress = "bzip2")
    }
}

# 12.- Run pathways/scripts/create_pseudo_mgi.R

# 13.- Run 
feats <- c("genes", "uniprot", "GO")
for(spe in species){
    for(feat in feats){
        file <- paste0("private/pathways/pseudo/pmgi_", spe, "_", feat,".RData")
        pseudo <- load(file)
        pmgi <- get(pseudo)
        save(pmgi, file = paste0(edpath, "pmgi_", spe, "_", feat, ".rda"), 
             compress = "bzip2")
        rm(list = pseudo)
    }
}
