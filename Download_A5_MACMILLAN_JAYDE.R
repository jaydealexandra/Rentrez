#loads rentrez package
library(rentrez)

#creates a vector called ncbi_ids
ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1")

#creates a new object called Bburg with data that is fetched from the nuccore database in fasta format
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")

#creates a new object called Sequences that contains 
Sequences <- strsplit(Bburg, "\n\n")

#converts the object Sequences to a data frame
Sequences <- unlist(Sequences)

#separates the sequences from the headers using regex 
header <- gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences <- data.frame(Name=header,Sequence=seq)

#removes \n from the Sequences data frame
Sequences$Sequence <- gsub("\\n", "", Sequences$Sequence)

#outputs the Sequences data to a file called "Sequences_A5_MACMILLAN_JAYDE.csv"
write.csv(Sequences, "Sequences_A5_MACMILLAN_JAYDE.csv", row.names = FALSE)


