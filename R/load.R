


#' Checks whether a species is accepted
#'
#' @param species Species of the samples.
#'
#' @examples
#' is.accepted("hsa")
#' is.accepted("fca")
#'
#' @return Boolean, whether \code{species} is accepted or not.
#'
#' @export
#'
is.accepted <- function(species){
    isacc <- species %in% c("hsa", "mmu", "rno")
    return(isacc)
}


#' Loads annotations object
#'
#' @param db Database to be used. Either "GO" or "uniprot".
#' @param species Species of the samples.
#'
#' @examples
#' load.annofuns("GO", "hsa")
#' load.annofuns("uniprot", "hsa")
#'
#' @return Annotations object
#'
#' @export
#'
load.annofuns <- function(db, species){
    if(!is.accepted(species))
        stop("Species not accepted")
    if(db == "GO"){
        ag <- data("annofuns_GO", envir = environment())
        annofuns_GO <- get(ag)
        annofuns <- annofuns_GO[[species]]
    }else if(db == "uniprot"){
        au <- data("annofuns_uniprot", envir = environment())
        annofuns_uniprot <- get(au)
        annofuns <- annofuns_uniprot[[species]]
    }else{
        stop("Database not accepted")
    }
    return(annofuns)
}


#' Loads object with graph information
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.mgi("hsa")
#'
#' @return Graph information object
#'
#' @export
#'
load.mgi <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    if(species == "hsa"){
        mgi <- data("meta_graph_info_hsa", envir = environment())
        meta_graph_info_hsa <- get(mgi)
        return(meta_graph_info_hsa)
    }else if(species == "rno"){
        mgi <- data("meta_graph_info_rno", envir = environment())
        meta_graph_info_rno <- get(mgi)
        return(meta_graph_info_rno)
    }else if(species == "mmu"){
        mgi <- data("meta_graph_info_mmu", envir = environment())
        meta_graph_info_mmu <- get(mgi)
        return(meta_graph_info_mmu)
    }else{
        stop("Species not accepted")
    }
}


#' Loads table of references
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.xref("hsa")
#'
#' @return Table of references
#'
#' @export
#'
load.xref <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    xr <- data("xref", envir = environment())
    xref_spe <- get(xr)[[species]]
    return(xref_spe)
}


#' Loads table of translation from HGNC to Entrez
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.entrez.hgnc("hsa")
#'
#' @return Table of translation from HGNC to Entrez
#'
#' @export
#'
load.entrez.hgnc <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    eh <- data("entrez_hgnc", envir = environment())
    entrez_hgnc <- get(eh)[[species]]
    return(entrez_hgnc)
}


#' Loads GO Annotations
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.gobp("hsa")
#'
#' @return GO Annotations
#'
#' @export
#'
load.gobp <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    gba <- data("go_bp_annots", envir = environment())
    go_bp_annot <- get(gba)[[species]]
    return(go_bp_annot)
}


#' Loads Uniprot annotations
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.unibp("hsa")
#'
#' @return Uniprot annotations
#'
#' @export
#'
load.unibp <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    uba <- data("uni_bp_annots", envir = environment())
    uni_bp_annot <- get(uba)[[species]]
    return(uni_bp_annot)
}


#' Loads GO graph information
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.gobp.frame("hsa")
#'
#' @return GO graph information
#'
#' @export
#'
load.gobp.frame <- function(){
    data("go_bp_frame", envir = environment())
    return(go_bp_frame)
}


#' Loads GO graph
#'
#' @param species Species of the samples.
#'
#' @examples
#' load.gobp.net("hsa")
#'
#' @return GO graph
#'
#' @export
#'
load.gobp.net <- function(){
    data("go_bp_net", envir = environment())
    return(go_bp_net)
}

