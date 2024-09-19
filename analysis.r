install.packages("quanteda.textstats")
install.packages("quanteda textplots")
install.packages("readtext")
install.packages("ggplot2")
install.packages("text2vec")
install.packages("dplyr")

library(quanteda)
library(quanteda.textstats)
library(quanteda.textplots)
library(readtext)
library(ggplot2)
library(text2vec)
library(dplyr)
library(tidytext)  

reviews <- read.csv("reviews.csv")
View(reviews)
head(reviews) 
tail (reviews) 

tweet_text <- reviews %>% select (text)
tweet_corpus <- corpus(tweet_text)
ndoc(tweet_corpus) 
summary(tweet_corpus) 
     
tweet_toks <- tokens(tweet_corpus) 
tweet_toks
tweet_dfm <- dfm (tweet_toks)
tweet_dfm

textstat_frequency(tweet_dfm) 
tweet_toks_clean <- tokens(tweet_corpus,remove_punct = TRUE,remove_numbers = TRUE,remove_symbols = TRUE)
tweet_toks_clean <- tokens_tolower(tweet_toks_clean)

stopwords("en")
my_stopwords <- stopwords("en")
my_stopwords
my_stopwords <- c("amp","00pme", my_stopwords)
my_stopwords
my_stopwords <- c(my_stopwords, more_stopwords)

tweet_toks_clean <- tokens_select(tweet_toks_clean, pattern = my_stopwords, selection = "remove")
tweet_dfm2 <- dfm (tweet_toks_clean)
textstat_frequency(tweet_dfm2)
tweet_toks_clean <- tokens_select(tweet_toks_clean, min_nchar=2L)
tweet_dim3 <- dtm(tweet_toks_cleanz)
textstat_frequency(tweet_dfm3)
tstat_tweet <- textstat_frequency(tweet_dfm3)
tstat_ttweet

ggplott(stat_ttweet[1:20, ], aes(x = reorder(feature, frequency), y = frequency)) 
        + geom_point() + coord_flip() + labs(x = NULL, y = "Frequency")
dev.new(width = 1000, height = 1000, unit = "x")
textplot_wordcloud (tweet_dfm3, max_words = 100)
toks_ngram <- tokens_ngrams(tweet_toks_clean, n = 2)
head (toks_ngram)
View(toks_ngram)

ngram_dfm <- dfm(toks_ngram)
textstat_frequency(ngram_dfm)
tstat_ttweet_2ngram <- textstat_frequency(ngram_dfm)
tstat_ttweet_2ngram

ggplot(tstat_ttweet_2ngram[1:20, ], aes(x = reorder(feature, frequency), y = frequency)) +
      geom_point() + coord_fір() + labs(x = NULL, y = "Frequency")
dev.new(width = 1000, height = 1000, unit = "px") 
textplot_wordcloud(ngram_dfm, max_words = 100)

data_dictionary_LSD2015
toks_ngram_compound <- tokens_compound(toks_ngram, data_dictionary_LSD2015)
toks_ngram_sentiment <- dfm_lookup(dfm(toks_ngram_compound), data_dictionary_LSD2015)
toks_ngram_sentiment
toks_ngram [["text1"]]
View(toks_ngram_sentiment)

toks_ngram_sentiment <- convert(toks_ngram_sentiment, to = "data.frame")
View(toks_ngram_sentiment)

colnames(toks_ngram_sentiment)
toks_ngram_sentiment$net_sentiment <- ((toks_ngram_sentiment$positive +
toks_ngram_sentiment$neg_negative) - (toks_ngram_sentiment$negative + toks_ngram_sentiment$neg_positive))

colnames(toks_ngram_sentiment)
View(toks_ngram_sentiment)

toks_ngram_sentiment <-
toks_ngram_sentiment[order(toks_ngram_sentimentSnet_sentiment),]
View(toks_ngram_sentiment)

tweet_toks_clean2_compound <- tokens_compound(tweet_toks_clean2, data_dictionary_LSD2015)
tweet_toks_clean2_sentiment <- fm_lookup(dfm(tweet_toks_clean2_compound),

data_dictionary_LSD2015)
tweet_toks_clean2_sentiment
tweet_toks_clean2[["text1"]]
View(tweet_toks_clean2_sentiment)

tweet_toks_clean2_sentiment <- convert(tweet_toks_clean2_sentiment, to = "data frame")
View(tweet_toks_clean2_sentiment)

colnames (tweet_toks_clean2_sentiment)
tweet_toks_clean2_sentiment$net_sentiment <- ((tweet_toks_clean2_sentiment$positive +tweet_toks_clean2_sentiment$neg_negative) - (tweet_toks_clean2_sentiment$negative +tweet_toks_clean2_sentiment$neg_positive))

colnames (tweet_toks_clean2_sentiment)
View(tweet_toks_clean2_sentiment)

tweet_toks_clean2_sentiment <-
tweet_toks_clean2_sentiment[order(tweet_toks_clean2_sentimentSnet_sentiment),]
View(tweet_toks_clean2_sentiment)
View(tweet_text)

ggplot(toks_ngram_sentiment[1:20,], aes(x = reorder(doc_id, net_sentiment), y = net_sentiment)) + geom_point() +
      coord_flip () + labs(x = NULL, y = "net_sentiment")

tweet_text 
ggplot(tweet_toks_clean2_sentiment[1:20,], aes(x = reorder(doc_id, net_sentiment), y =net_sentiment)) + geom_point ()+
      coord_flip () +labs(x = NULL, y = "net_sentiment")

tweet_text[c(371, 337, 2579, 40), ] 
ggplot(toks_ngram_sentiment[3176:3196,], aes(x = reorder(doc_id, net_sentiment), y = net_sentiment)) + geom_point() +
      coord_flip() +labs(x = NULL, y = "net_sentiment")

ggplot(tweet_toks_clean2_sentiment[3176:3196,], aes(x = reorder(doc_id, net_sentiment), y = net_sentiment)) + geom_point() +
      coord_flip() +labs(x = NULL, y = "net_sentiment")

ggplot(toks_ngram_sentiment[1:3196,], aes(x = reorder(doc_id, net_sentiment), y = net_sentiment)) + geom_point() +
      coord_flip() +labs(x = NULL, y = "net_sentiment")

ggplot(tweet_toks_clean2_sentiment[1:3196,], aes(x = reorder(doc_id, net_sentiment), y = net_sentiment)) + geom_point()+
      coord_flip() +labs(x = NULL, y = "net _sentiment")
