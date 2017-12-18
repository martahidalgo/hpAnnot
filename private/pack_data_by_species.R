

# Script for storing data generated in the private folder into the data folder
# as Package Data


species <- c("hsa", "mmu", "rno")

# XREF
#------------------------
xref_all <- NULL
for(spe in species){
    xref_folder <- paste0("private/xref/", spe, "/")
    xref_file <- paste0(xref_folder, "xref_", spe, ".RData")
    xr <- load(xref_file)
    xref <- get(xr)
    xref_all[[spe]] <- xref
}
xref <- xref_all
devtools::use_data(xref, pkg = ".")


# ANNOTATIONS
#------------------------
load("private/annotations/go_bp_frame.RData")
devtools::use_data(go_bp_frame, pkg = ".")
load("private/annotations/go_bp_net.RData")
devtools::use_data(go_bp_net, pkg = ".")

# GO_bp_annots
go_bp_annots <- NULL
for(spe in species){
    gba_folder <- paste0("private/annotations/", spe, "/")
    gba_file <- paste0(gba_folder, "/go_bp_", spe, ".annot")
    go_bp_annot <- read.delim(gba_file,
                              sep = "\t",
                              header = TRUE,
                              stringsAsFactors = FALSE,
                              comment.char = "!")
    go_bp_annot <- go_bp_annot[,1:2]
    colnames(go_bp_annot) <- c("gene","function")
    go_bp_annots[[spe]] <- go_bp_annot
}
devtools::use_data(go_bp_annots, pkg = ".")

# Uni_bp_annots
uni_bp_annots <- NULL
for(spe in species){
    gba_folder <- paste0("private/annotations/", spe, "/")
    uba_file <- paste0(gba_folder, "/uniprot_keywords_",
                       spe, "__biological_process.annot")
    uni_bp_annot <- read.delim(uba_file,
                              sep = "\t",
                              header = TRUE,
                              stringsAsFactors = FALSE,
                              comment.char = "!")
    uni_bp_annot <- uni_bp_annot[,1:2]
    colnames(uni_bp_annot) <- c("gene","function")
    uni_bp_annots[[spe]] <- uni_bp_annot
}
devtools::use_data(uni_bp_annots, pkg = ".")

# Entrez_HGNC
entrez_hgnc <- NULL
for(spe in species){
    eh_folder <- paste0("private/annotations/", spe, "/")
    eh_file <- paste0(eh_folder, "/entrez_hgnc_", spe, ".annot")
    eh_annot <- read.delim(eh_file,
                           sep = "\t",
                           header = FALSE,
                           stringsAsFactors = FALSE,
                           comment.char = "!")
    entrez_hgnc[[spe]] <- eh_annot
}
devtools::use_data(entrez_hgnc, pkg = ".")



# PATHWAYS
#------------------------
# Separatedly
# HSA
mgi <- load("private/pathways/hsa/temp/meta_graph_info_hsa.RData")
meta_graph_info_hsa <- get(mgi)
meta_graph_info_hsa$species <- "hsa"
devtools::use_data(meta_graph_info_hsa, pkg = ".")
rm(metaginfo, meta_graph_info_hsa, mgi)

# RNO
mgi <- load("private/pathways/rno/temp/meta_graph_info_rno.RData")
meta_graph_info_rno <- get(mgi)
meta_graph_info_rno$species <- "rno"
devtools::use_data(meta_graph_info_rno, pkg = ".")
rm(metaginfo, meta_graph_info_rno, mgi)

# MMU
mgi <- load("private/pathways/mmu/temp/meta_graph_info_mmu.RData")
meta_graph_info_mmu <- get(mgi)
meta_graph_info_mmu$species <- "mmu"
devtools::use_data(meta_graph_info_mmu, pkg = ".")
rm(metaginfo, meta_graph_info_mmu, mgi)




# ANNOFUNS
#------------------------
# GO
annofuns_GO <- NULL
for(spe in species){
    load(paste0("private/annofuns/annofuns_GO_", spe, ".RData"))
    annofuns_GO[[spe]] <- annofuns
}
devtools::use_data(annofuns_GO, pkg = ".", internal = F)

# Uniprot
annofuns_uniprot <- NULL
for(spe in species){
    load(paste0("private/annofuns/annofuns_uniprot_", spe, ".RData"))
    annofuns_uniprot[[spe]] <- annofuns
}
devtools::use_data(annofuns_uniprot, pkg = ".", internal = F)



# PSEUDO PATHWAYS
#------------------------
# HSA
pmgi <- load("private/pathways/pseudo/pmgi_hsa_genes.RData")
pmgi_hsa_genes <- get(pmgi)
devtools::use_data(pmgi_hsa_genes, pkg = ".")
rm(pmgi_hsa_genes, pmgi)

pmgi <- load("private/pathways/pseudo/pmgi_hsa_uniprot.RData")
pmgi_hsa_uniprot <- get(pmgi)
devtools::use_data(pmgi_hsa_uniprot, pkg = ".")
rm(pmgi_hsa_uniprot, pmgi)

pmgi <- load("private/pathways/pseudo/pmgi_hsa_GO.RData")
pmgi_hsa_GO <- get(pmgi)
devtools::use_data(pmgi_hsa_GO, pkg = ".")
rm(pmgi_hsa_GO, pmgi)

# RNO
pmgi <- load("private/pathways/pseudo/pmgi_rno_genes.RData")
pmgi_rno_genes <- get(pmgi)
devtools::use_data(pmgi_rno_genes, pkg = ".")
rm(pmgi_rno_genes, pmgi)

pmgi <- load("private/pathways/pseudo/pmgi_rno_uniprot.RData")
pmgi_rno_uniprot <- get(pmgi)
devtools::use_data(pmgi_rno_uniprot, pkg = ".")
rm(pmgi_rno_uniprot, pmgi)

pmgi <- load("private/pathways/pseudo/pmgi_rno_GO.RData")
pmgi_rno_GO <- get(pmgi)
devtools::use_data(pmgi_rno_GO, pkg = ".")
rm(pmgi_rno_GO, pmgi)

# MMU
pmgi <- load("private/pathways/pseudo/pmgi_mmu_genes.RData")
pmgi_mmu_genes <- get(pmgi)
devtools::use_data(pmgi_mmu_genes, pkg = ".")
rm(pmgi_mmu_genes, pmgi)

pmgi <- load("private/pathways/pseudo/pmgi_mmu_uniprot.RData")
pmgi_mmu_uniprot <- get(pmgi)
devtools::use_data(pmgi_mmu_uniprot, pkg = ".")
rm(pmgi_mmu_uniprot, pmgi)

pmgi <- load("private/pathways/pseudo/pmgi_mmu_GO.RData")
pmgi_mmu_GO <- get(pmgi)
devtools::use_data(pmgi_mmu_GO, pkg = ".")
rm(pmgi_mmu_GO, pmgi)


