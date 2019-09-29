Retail Marketing – An in-depth Analysis of uncovering hidden growth opportunities using Data Analytics
Shazeb Asad

Instacart is a grocery ordering and delivery app, which helps consumers purchase grocery online through the Instacart app. After the selection of the products, company personnel assigned to each customer reviews your order and does the in-store shopping and delivers the product. The company has been looking for an analysis of their data so that new customer insights could be derived and new and effective marketing strategies to retain existing customers as well as to gain new customers could be formed.

For this purpose, the use of explorative data techniques and the use of association rules has been applied, which has led to substantive and useful insights such as the identification of trends related to customer purchase behavior, discovering of key customers for the business, the association of certain products with each other, the need to manage potential bottlenecks with regard to higher than expected traffic and better management of inventories.

Data:

The data has been acquired from an online open source data repository called Kaggle. The data has been made available for everyone to use by the Instacart Company itself. The dataset is a relational set of files describing customers' orders over time. The dataset is anonymized and contains a sample of over 3 million grocery orders from more than 200,000 Instacart users. For each user, between 4 and 100 of orders, are provided, with the sequence of products purchased in each order. The week and hour of day the order was placed, and a relative measure of time between orders has also been made available. The data contains all the necessary information needed to answer the questions discussed above since it contains the relevant information to conduct a market basket analysis.

Data Processing:

The dataset is divided into six separate data files which pertain to the following information: information on the department within the store, information on the aisle within the store, information of orders that are divided into three different sets (prior, training and test), information of prior orders, information on the training set data, and information related to the products. Each data set is separately analyzed so as to ascertain whether no missing values are there. There is only one data set that has some missing values and that is the orders data set. The missing values are in the prior orders column. We will however not remove them since it will not impact our analysis.

Analysis:

I have used the ggplot2,arules packages among other packages in R to derive insights. The full Analysis documentation is not being published because of privacy reasons. The code and the visuals will be shared. 
