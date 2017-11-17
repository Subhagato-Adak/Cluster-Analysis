#Loading the necessary packages for the whole process
pkgs <- c("factoextra","NbClust")
install.packages(pkgs)
library(factoextra)
library(NbClust)
library(cluster)

#Data prpeparation
credit.data <- as.data.frame(cbind(credit$TransactionNumber,credit$Amount))
colnames(credit.data)<-c("transactionID","Amount")
#The data has a number of structural anamolies, same transaction number for different
#values of Amount. Removinf the duplicate values.
credit.dup1 <- credit[credit$TransactionNumber == 14052747, ]
credit.data.unique<-credit.data[duplicated(credit.data$transactionID),]
credit.dup2 <-(credit[credit$TransactionNumber == 14053806, ])
credit.dup3<-(credit[credit$TransactionNumber == 14053647, ])
credit.dup4<-(credit[credit$TransactionNumber == 14053595, ])
credit.dup5<-(credit[credit$TransactionNumber == 14053503, ])
credit.dup6<-(credit[credit$TransactionNumber == 14053522, ])
credit.dup7<-(credit[credit$TransactionNumber == 14053401, ])
credit.dup8<-(credit[credit$TransactionNumber == 14053075, ])
credit.dup9<-(credit[credit$TransactionNumber == 14052447, ])
credit.dup1<-credit.dup1[,c(4,10)]
credit.dup2<-credit.dup2[,c(4,10)]
credit.dup3<-credit.dup3[,c(4,10)]
credit.dup4<-credit.dup4[,c(4,10)]
credit.dup5<-credit.dup5[,c(4,10)]
credit.dup6<-credit.dup6[,c(4,10)]
credit.dup7<-credit.dup7[,c(4,10)]
credit.dup8<-credit.dup8[,c(4,10)]
credit.dup9<-credit.dup9[,c(4,10)]
#Calculating the means of the duplicates
mean(credit.dup1$Amount)
mean(credit.dup2$Amount)
mean(credit.dup3$Amount)
mean(credit.dup4$Amount)
mean(credit.dup5$Amount)
mean(credit.dup6$Amount)
mean(credit.dup7$Amount)
mean(credit.dup8$Amount)
mean(credit.dup9$Amount)
credit.data.unique<-credit.data[!duplicated(credit.data$transactionID),]
crdt <- credit.data.unique
#Replacing the values of the duplicate transaction numbers with means
crdt[crdt$transactionID==14052747,][2]=6048.227
crdt[crdt$transactionID==14053806,][2]=42800.27
crdt[crdt$transactionID==14053647,][2]=17074.64
crdt[crdt$transactionID==14053595,][2]=1075
crdt[crdt$transactionID==14053503,][2]=1720
crdt[crdt$transactionID==14053522,][2]=2800
crdt[crdt$transactionID==14053401,][2]=25082.18
crdt[crdt$transactionID==14053075,][2]=9913.983
crdt[crdt$transactionID==14052447,][2]=881.5
credit.data.unique <- crdt
rownames(credit.data.unique)<-credit.data.unique$transactionID
credit.data.unique$transactionID <- NULL
#standardizing the data
credit.data.unique <- scale(credit.data.unique)

#Using second method to find the optimum number of clusters
nb <- NbClust(credit.data.unique,distance="euclidean",method = "kmeans")
fviz_nbclust(nb)
#The optimum number of clusters in 5
#Appling cluster analysis method using the K-Means algorithm.
set.seed(123)
clustr.credit <- kmeans(credit.data.unique,5,30,50)
clustr.credit
par(mfrow=c(1,1))
clusplot(scale(crdt),clustr.credit$cluster,color = TRUE, shade = TRUE)
fviz_cluster(clustr.credit,data = crdt)
#Applying 