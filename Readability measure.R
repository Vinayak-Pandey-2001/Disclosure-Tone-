###############################    Required packages   ############################
require(readtext)
require(quanteda)
require(quanteda.textstats)
require(quanteda.sentiment)
require(sentimentr)
require(pdftools)

###############################    choose a file   ############################
file.choose()
x1=readtext(file.choose())
files <- list.files(pattern = "pdf$")
opinions <- lapply(files, pdf_text)
pdf.text <- pdf_text(file.choose())
x12 <- pdf.text
###############################    Extracting the text  ############################
x11=x1$text
xa=get_sentences(x11)

###############################    Readability   #############################
textstat_readability(x11, measure = "FOG")
textstat_readability(x11, measure = "Flesch")
textstat_readability(x11, measure = "Flesch.Kincaid")

