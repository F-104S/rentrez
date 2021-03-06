% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/entrez_summary.r
\name{entrez_summary}
\alias{entrez_summary}
\title{Get summaries of objects in NCBI datasets from a unique ID
Constructs a query from the given arguments, including a database name and
list of of unique IDs for that database.}
\usage{
entrez_summary(db, version = c("2.0", "1.0"), config = NULL, ...)
}
\arguments{
\item{db}{character Name of the database to search for}

\item{version}{either 1.0 or 2.0 see above for description}

\item{config}{vector configuration options passed to \code{httr::GET}}

\item{\dots}{character Additional terms to add to the request. Requires either
id (unique id(s) for records in a given database) or WebEnv (a character
containing a cookie created by a previous entrez query).}
}
\value{
A list of esummary records (if multiple IDs are passed) or a single
record.

file XMLInternalDocument xml file resulting from search, parsed with
\code{\link{xmlTreeParse}}
}
\description{
The NCBI offer two distinct formats for summary documents.
Version 1.0 is a relatively limited summary of a database record based on a
shared Document Type Definition. Version 1.0 summaries are only available as
XML and are not available for some newer databases
Version 2.0 summaries generally contain more information about a given
record, but each database has its own distinct format. 2.0 summaries are
available for records in all databases and as JSON and XML files.
As of version 0.4, rentrez fetches version 2.0 summaries by default and
uses JSON as the exchange format (as JSON object can be more easily converted
into native R types). Existing scripts which relied on the structure and
naming of the "Version 1.0" summary files can be updated by setting the new
\code{version} argument to "1.0".
}
\examples{
pop_ids = c("307082412", "307075396", "307075338", "307075274")
 pop_summ <- entrez_summary(db="popset", id=pop_ids)
 sapply(pop_summ, "[[", "title")

 # clinvar example
 res <- entrez_search(db = "clinvar", term = "BRCA1", retmax=10)
 cv <- entrez_summary(db="clinvar", id=res$ids)
 cv[[1]] # get the names of the list for each result
 sapply(cv, "[[", "title") # titles
 lapply(cv, "[[", "trait_set")[1:2] # trait_set
 sapply(cv, "[[", "gene_sort") # gene_sort
}
\seealso{
\code{\link[httr]{config}} for available configs
}

