Retail Marketing – An in-depth Analysis of uncovering hidden growth opportunities using Data Analytics
Shazeb Asad

Instacart is a grocery ordering and delivery app, which helps consumers purchase grocery online through the Instacart app. After the selection of the products, company personnel assigned to each customer reviews your order and does the in-store shopping and delivers the product. The company has been looking for an analysis of their data so that new customer insights could be derived and new and effective marketing strategies to retain existing customers as well as to gain new customers could be formed.

For this purpose, the use of explorative data techniques and the use of association rules has been applied, which has led to substantive and useful insights such as the identification of trends related to customer purchase behavior, discovering of key customers for the business, the association of certain products with each other, the need to manage potential bottlenecks with regard to higher than expected traffic and better management of inventories.

Data:

The data has been acquired from an online open source data repository called Kaggle. The data has been made available for everyone to use by the Instacart Company itself. The dataset is a relational set of files describing customers' orders over time. The dataset is anonymized and contains a sample of over 3 million grocery orders from more than 200,000 Instacart users. For each user, between 4 and 100 of orders, are provided, with the sequence of products purchased in each order. The week and hour of day the order was placed, and a relative measure of time between orders has also been made available. The data contains all the necessary information needed to answer the questions discussed above since it contains the relevant information to conduct a market basket analysis.

Data Processing:

The dataset is divided into six separate data files which pertain to the following information: information on the department within the store, information on the aisle within the store, information of orders that are divided into three different sets (prior, training and test), information of prior orders, information on the training set data, and information related to the products. Each data set is separately analyzed so as to ascertain whether no missing values are there. There is only one data set that has some missing values and that is the orders data set. The missing values are in the prior orders column. We will however not remove them since it will not impact our analysis.

Analysis:

For this purpose, the use of explorative data techniques and the use of association rules has been applied, which has led to substantive and useful insights such as the identification of trends related to customer purchase behavior, discovering of key customers for the business, the association of certain products with each other, the need to manage potential bottlenecks with regard to higher than expected traffic and better management of inventories.

![image](https://user-images.githubusercontent.com/55930875/65837607-f4f31a80-e312-11e9-9452-93783ee3b23b.png)

![image](https://user-images.githubusercontent.com/55930875/65838708-69cc5180-e31f-11e9-89b8-e4e5fdacd2be.png)

![image](https://user-images.githubusercontent.com/55930875/65838748-d5aeba00-e31f-11e9-894d-a037b9a0b2d7.png)

![image](https://user-images.githubusercontent.com/55930875/65838818-887f1800-e320-11e9-86a2-cb7624b29271.png)

![image](https://user-images.githubusercontent.com/55930875/65838996-a8174000-e322-11e9-88a5-1e71dc156aac.png)

![image](https://user-images.githubusercontent.com/55930875/65839449-24138700-e327-11e9-9351-5c0abf0608f8.png)

![image](https://user-images.githubusercontent.com/55930875/65839781-f2e88600-e329-11e9-8331-82ec7e0435ed.png)

![image](https://user-images.githubusercontent.com/55930875/65839866-e9abe900-e32a-11e9-85e3-8d948c592411.png)

![image](https://user-images.githubusercontent.com/55930875/65839889-ff211300-e32a-11e9-83b0-8382726f65c1.png)

![image](https://user-images.githubusercontent.com/55930875/65839895-1d870e80-e32b-11e9-9a86-18e5b7ad0fc7.png)

![image](https://user-images.githubusercontent.com/55930875/65839449-24138700-e327-11e9-9351-5c0abf0608f8.png)

lhs                                           rhs                                                 support confidence      lift count
[1]  {Nonfat Icelandic Style Strawberry Yogurt} => {Icelandic Style Skyr Blueberry Non-fat Yogurt} 0.001166079  0.4226519 78.660621   153
[2]  {Organic Yellow Squash}                    => {Organic Zucchini}                              0.001379479  0.4677003 13.372518   181
[3]  {Non Fat Acai & Mixed Berries Yogurt}      => {Icelandic Style Skyr Blueberry Non-fat Yogurt} 0.001288021  0.4023810 74.887947   169
[4]  {Lime Sparkling Water,                                                                                                              
      Sparkling Lemon Water}                    => {Sparkling Water Grapefruit}                    0.001127971  0.4512195 17.625502   148
[5]  {Sparkling Lemon Water,                                                                                                             
      Sparkling Water Grapefruit}               => {Lime Sparkling Water}                          0.001127971  0.4498480 30.022436   148
[6]  {Organic Broccoli,                                                                                                                  
      Organic Hass Avocado}                     => {Bag of Organic Bananas}                        0.001196564  0.5048232  4.278898   157
[7]  {Organic Broccoli,                                                                                                                  
      Organic Strawberries}                     => {Bag of Organic Bananas}                        0.001288021  0.4435696  3.759710   169
[8]  {Organic Carrot Bunch,                                                                                                              
      Organic Hass Avocado}                     => {Bag of Organic Bananas}                        0.001074621  0.4731544  4.010472   141
[9]  {Organic Carrot Bunch,                                                                                                              
      Organic Strawberries}                     => {Bag of Organic Bananas}                        0.001074621  0.4462025  3.782028   141
[10] {Organic Hass Avocado,                                                                                                              
      Organic Unsweetened Almond Milk}          => {Bag of Organic Bananas}                        0.001249914  0.5141066  4.357585   164


![image](https://user-images.githubusercontent.com/55930875/65861448-b34f8780-e385-11e9-8ea0-987f10381f37.png)

![image](https://user-images.githubusercontent.com/55930875/65861500-ceba9280-e385-11e9-926e-6769ed543ade.png)

![image](https://user-images.githubusercontent.com/55930875/65861805-61f3c800-e386-11e9-8eb4-8251a67c5d4c.png)

![image](https://user-images.githubusercontent.com/55930875/65861909-92d3fd00-e386-11e9-9503-a1666f9385c6.png)

![image](https://user-images.githubusercontent.com/55930875/65862015-c6af2280-e386-11e9-9ddc-70a2448fbb8c.png)

![image](https://user-images.githubusercontent.com/55930875/65862056-dcbce300-e386-11e9-8205-5c1d2889d0d9.png)

![image](https://user-images.githubusercontent.com/55930875/65862142-05dd7380-e387-11e9-825b-547adbc570d9.png)
