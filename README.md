# Cluster-Analysis
Cluster Analysis of credit card data.
This is a small cluster analysis of the data in credit data downloaded from internet credit.csv.
The data has 10 variables(attributes), and 255 rows(entities). There are soe structural anamolies in the data which has been corrected by replacing the value for the particular entity by the mean of all the duplicates.
Import the data in the R studio.
Here are some visualizations of the cluster analysis.

![nbcluster_transaction](https://user-images.githubusercontent.com/33694989/32950026-e055eb7c-cbca-11e7-9d94-1deecd990d3a.jpeg)


![cluster_transaction](https://user-images.githubusercontent.com/33694989/32950166-6aa0bcb2-cbcb-11e7-9053-9528ff127e23.jpeg)


This visualization shows the optimum number of clusters for K-Means analysis.



![rplot](https://user-images.githubusercontent.com/33694989/32950256-ba56bf86-cbcb-11e7-9e1e-8f2ee5ed2f59.jpeg)

Cluster plot using clusplot() in cluster package.

![clusterplot](https://user-images.githubusercontent.com/33694989/32950359-0f9c2ff8-cbcc-11e7-8b11-00c43b4d6424.jpeg)

Cluster plot using fviz_cluster() in factoextra package.


