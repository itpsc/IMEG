install.packages('BiocManager', repos = "http://cran.ism.ac.jp/", dependencies = TRUE)
if (!requireNamespace("BiocManager"))
    install.packages("BiocManager")
BiocManager::install()

pkgs <- c(
    "edgeR",
    "Biostrings",
    "GenomicRanges",
    "rtracklayer",
    
    "Biobase",
    "biomaRt",
    "Biostrings",
    "BSgenome",
    "IRanges",
    "GenomicRanges",
    "GenomicAlignments",
    "GenomicFeatures",
    "SummarizedExperiment",
    "VariantAnnotation",
    "GSEABase",
    "Gviz",
    "graph",
    "RBGL",
    "Rgraphviz",
    "rmarkdown",
    "httr",
    "knitr",
    "BiocStyle",
    "ChIPpeakAnno",
    "org.Hs.eg.db",
    "org.Mm.eg.db",
    "BSgenome.Hsapiens.UCSC.hg19",
    "TxDb.Mmusculus.UCSC.mm10.knownGene",
    "TxDb.Hsapiens.UCSC.hg38.knownGene",
    "BSgenome.Hsapiens.UCSC.hg38",
    "BSgenome.Mmusculus.UCSC.mm10",
    "EnsDb.Hsapiens.v86",
    "TxDb.Mmusculus.UCSC.mm10.ensGene"
    )

## 1. CRANから一覧を取得
cran_list.db <- available.packages(contriburl=contrib.url("http://cran.md.tsukuba.ac.jp/"))
cran_db <- rownames(cran_list.db)
fnd1 <- pkgs %in% cran_db
pkgs_to_install1 <- pkgs[fnd1]
install.packages(fnd1[,1],contriburl=contrib.url("http://cran.md.tsukuba.ac.jp/"))

## 2. bioconductorから一覧を取得
ap.db <- available.packages(contrib.url(BiocManager::repositories()))
ap <- rownames(ap.db)
fnd2 <- pkgs %in% ap
pkgs_to_install2 <- pkgs[fnd2]

ok <- BiocManager::install(pkgs_to_install2, update=FALSE, ask=FALSE) %in% rownames(installed.packages())

if (!all(fnd))
    message("Packages not found in a valid repository (skipped):\n  ",
            paste(pkgs[!fnd], collapse="  \n  "))
if (!all(ok))
    stop("Failed to install:\n  ",
         paste(pkgs_to_install[!ok], collapse="  \n  "))

suppressWarnings(BiocManager::install(update=TRUE, ask=FALSE))

install.packages('Seurat')
devtools::install_github('alyssafrazee/RSkittleBrewer')
