% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/enrichment_functions.R
\name{multiGSEA}
\alias{multiGSEA}
\title{Calculate pathway enrichment for multiple omics layer.}
\usage{
multiGSEA(pathways, ranks, eps = 0)
}
\arguments{
\item{pathways}{Nested list containing all pathway features for the
respective omics layer.}

\item{ranks}{Nested list containing the measured and pre-ranked features for
each omics layer.}

\item{eps}{This parameter sets the boundary for calculating the p value.}
}
\value{
Nested list containing the enrichment scores for each given pathway
  and omics layer.
}
\description{
This function calculates GSEA-based enrichments scores for multiple omics
layer at once. Input pathways or gene sets have to be prepared in advance by
means of the function \code{\link[multiGSEA]{initOmicsDataStructure}}. The function uses pre-
ranked lists for each omics layer to calculate the enrichment score. The
ranking can be calculated by means of the function
\link[multiGSEA]{rankFeatures}.
}
\examples{

# Download pathway definition and extract features
pathways <- getMultiOmicsFeatures(dbs = c("kegg"), layer = c("transcriptome", "proteome"))

# load omics data and calculate ranks
data(transcriptome)
data(proteome)
ranks <- initOmicsDataStructure(c("transcriptome", "proteome"))
ranks$transcriptome <- rankFeatures(transcriptome$logFC, transcriptome$pValue)
names(ranks$transcriptome) <- transcriptome$Symbol
ranks$proteome <- rankFeatures(proteome$logFC, proteome$pValue)
names(ranks$proteome) <- proteome$Symbol

## run the enrichment
multiGSEA(pathways, ranks)
}
