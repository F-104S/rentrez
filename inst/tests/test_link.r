test_that("The recor-linking funcitons work",{
    #setup
    elinks <- entrez_link(dbfrom = "pubmed", id = 20674752, db = "all")
    #tests
    expect_that(elinks, is_a("elink"))
    expect_that(names(elinks), is_a("character"))
    expect_that(elinks$file, is_a("XMLInternalDocument"))
    expect_true(length(elinks$pubmed_nuccore) > 0)
})