#https://github.com/jaydealexandra/Rentrez.git

#loads rentrez package
library(rentrez)

#creates a new object called sarsSeq with the SARS-CoV-2 genome that is fetched from the nuccore database in fasta format
sarsSeq <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")


#According to Huang et al. 2020, the SARS-CoV-2 S protein is highly conserved.
#Huang, Y., Yang, C., Xu, X., Xu, W., & Liu, S. (2020). Structural and functional properties of SARS-CoV-2 spike protein: potential antivirus drug development for COVID-19. Acta Pharmacologica Sinica, 41(9), 1141–1149. https://doi.org/10.1038/s41401-020-0485-4