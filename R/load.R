


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
        ag <- utils::data("annofuns_GO", envir = environment())
        annofuns_GO <- get(ag)
        annofuns <- annofuns_GO[[species]]
    }else if(db == "uniprot"){
        au <- utils::data("annofuns_uniprot", envir = environment())
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
        mgi <- utils::data("meta_graph_info_hsa", envir = environment())
        meta_graph_info_hsa <- get(mgi)
        return(meta_graph_info_hsa)
    }else if(species == "rno"){
        mgi <- utils::data("meta_graph_info_rno", envir = environment())
        meta_graph_info_rno <- get(mgi)
        return(meta_graph_info_rno)
    }else if(species == "mmu"){
        mgi <- utils::data("meta_graph_info_mmu", envir = environment())
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
    xr <- utils::data("xref", envir = environment())
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
    eh <- utils::data("entrez_hgnc", envir = environment())
    entrez_hgnc <- get(eh)[[species]]
    return(entrez_hgnc)
}


#' Loads GO Annotations
#'
#' @param species Species of the samples.
#'
#' @return GO Annotations
#'
load.gobp <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    gba <- utils::data("go_bp_annots", envir = environment())
    go_bp_annot <- get(gba)[[species]]
    return(go_bp_annot)
}


#' Loads Uniprot annotations
#'
#' @param species Species of the samples.
#'
#' @return Uniprot annotations
#'
load.unibp <- function(species){
    if(!is.accepted(species))
        stop("Species not accepted")
    uba <- utils::data("uni_bp_annots", envir = environment())
    uni_bp_annot <- get(uba)[[species]]
    return(uni_bp_annot)
}


#' Loads functional annotations
#'
#' Loads functional annotations from HGNC to the selected database.
#'
#' @param db Database to be used. Either "GO" or "uniprot".
#' @param species Species of the samples.
#'
#' @examples
#' load.annots("GO", "hsa")
#'
#' @return Functional annotations from HGNC to the selected database.
#'
#' @export
#'
load.annots <- function(db, species){
    if(!is.accepted(species))
        stop("Species not accepted")
    if(db == "GO"){
        annofuns <- load.gobp(species)
    }else if(db == "uniprot"){
        annofuns <- load.unibp(species)
    }else{
        stop("Database not accepted")
    }
    return(annofuns)
}


#' Loads GO graph information
#'
#' @examples
#' load.gobp.frame()
#'
#' @return GO graph information
#'
#' @export
#'
load.gobp.frame <- function(){
    gbf <- utils::data("go_bp_frame", envir = environment())
    go_bp_frame <- get(gbf)
    return(go_bp_frame)
}


#' Loads GO graph
#'
#' @examples
#' load.gobp.net()
#'
#' @return GO graph
#'
#' @export
#'
load.gobp.net <- function(){
    gbn <- utils::data("go_bp_net", envir = environment())
    go_bp_net <- get(gbn)
    return(go_bp_net)
}

