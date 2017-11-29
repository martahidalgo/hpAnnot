
library(hipathia)
library(devtools)

load("private/example_data/brca_data.RData")
load("private/example_data/brca_design.RData")

# load and filter graphs
pathways <- load.pathways(species = "hsa",
                          pathways.list = c("hsa03320", "hsa04012"))

# prepare data
trans_data <- translate.matrix(brca_data, "hsa")
exp_data <- normalize.data(trans_data)

results <- hipathia(exp.data, pathways, verbose=TRUE)

path_vals <- get.paths.matrix(results)
go_vals <- quantify.terms(results, pathways, "GO")
uni_vals <- quantify.terms(results, pathways, "uniprot")

sample_group <- brca_design[colnames(path_vals),"group"]
comp <- do.wilcoxon(path_vals, sample.group, g1 = "Tumor", g2 = "Normal")
path_names <- get.path.names(pathways, rownames(comp))
comp <- cbind(path_names, comp)


use_data(brca_data, pkg = ".", internal = F)
use_data(brca_design, pkg = ".", internal = F)
use_data(exp_data, pkg = ".", internal = F)
use_data(results, pkg = ".", internal = F)
use_data(path_vals, pkg = ".", internal = F)
use_data(go_vals, pkg = ".", internal = F)
use_data(uni_vals, pkg = ".", internal = F)
use_data(comp, pkg = ".", internal = F)



