
library(igraph)
library(devtools)
library(hipathia)
library(hpAnnot)

species <- c("hsa","mmu","rno")

for(spe in species){

    print(spe)
    metaginfo <- load.mgi(spe)
    entrez2hgnc <- load.entrez.hgnc(spe)

    # Uniprot

    uniannot <- load.unibp(spe)
    annofuns <- annotate.paths(metaginfo$pathigraphs, uniannot, entrez2hgnc)
    save(annofuns, file=paste0("private/annofuns/annofuns_uniprot_", spe, ".RData"))

    # GO

    goannot <- load.gobp(spe)
    annofuns <- annotate.paths(metaginfo$pathigraphs, goannot, entrez2hgnc)
    save(annofuns, file=paste0("private/annofuns/annofuns_GO_", spe, ".RData"))

}

