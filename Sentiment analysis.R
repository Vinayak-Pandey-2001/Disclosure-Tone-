###############################    Required packages   ############################
require(readtext)
require(quanteda)
require(quanteda.textstats)
require(stringr)
#################### Choose a folder ###########################
files <- list.files(pattern = "pdf$")
############################## Sentiment Analysis #############################
pos=readtext(file.choose())
neg=readtext(file.choose())
positive=tolower(pos)
p=str_split(positive,pattern = " ")
pp=unlist(p)
negative=tolower(neg)
n=str_split(negative,pattern = " ")
nn=unlist(n)
################### RUN #########################33
cond=TRUE
for(i in files){
  x3=readtext(i)
  x3=x3$text
  x3=tolower(x3)
  s=str_split(x3, pattern = " ")
  
  ss=unlist(s)
  m=match(ss,pp)
  POSITIVE_WORDS=sum(!is.na(m))
  m=match(ss,nn)
  NEGATIVE_WORDS=sum(!is.na(m))
  if (cond==TRUE){
    df=data.frame(POSITIVE_WORDS,NEGATIVE_WORDS)
    cond=FALSE
  }
  else{
    df[nrow(df)+1,]=c(POSITIVE_WORDS,NEGATIVE_WORDS)
  }
}
df$document=c(letters[1:5])
df2=merge(df,df1,by="document")
write.csv(df2, "Winsome Breweries.csv")
