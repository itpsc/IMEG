pkgs <- c(
    "OrganismDbi",
    "ExperimentHub",
    "Biobase",
    "BiocParallel",
    "biomaRt",
    "Biostrings",
    "BSgenome",
    "ShortRead",
    "IRanges",
    "GenomicRanges",
    "GenomicAlignments",
    "GenomicFeatures",
    "SummarizedExperiment",
    "VariantAnnotation",
    "DelayedArray",
    "GSEABase",
    "Gviz",
    "graph",
    "RBGL",
    "Rgraphviz",
    "rmarkdown",
    "httr",
    "knitr",
    "BiocStyle"
    "ChIPpeakAnno"
    "org.Hs.eg.db"
    "org.Mm.eg.db"
    "BSgenome.Hsapiens.UCSC.hg19"
    "TxDb.Mmusculus.UCSC.mm10.knownGene"
    "TxDb.Hsapiens.UCSC.hg38.knownGene"
    "BSgenome.Hsapiens.UCSC.hg38"
    "BSgenome.Mmusculus.UCSC.mm10"
    "EnsDb.Hsapiens.v86"
    "TxDb.Mmusculus.UCSC.mm10.ensGene"
    )

ap.db <- available.packages(contrib.url(BiocManager::repositories()))
ap <- rownames(ap.db)
fnd <- pkgs %in% ap
pkgs_to_install <- pkgs[fnd]

ok <- BiocManager::install(pkgs_to_install, update=FALSE, ask=FALSE) %in% rownames(installed.packages())

if (!all(fnd))
    message("Packages not found in a valid repository (skipped):\n  ",
            paste(pkgs[!fnd], collapse="  \n  "))
if (!all(ok))
    stop("Failed to install:\n  ",
         paste(pkgs_to_install[!ok], collapse="  \n  "))

suppressWarnings(BiocManager::install(update=TRUE, ask=FALSE))
