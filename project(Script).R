install.packages("arules")
install.packages("arulesViz")
install.packages("ggplot2")
install.packages("dplyr")
install.packages("treemap")
install.packages("RColorBrewer")
library("arules")
library("arulesViz")
library("ggplot2")
library("dplyr")
library("treemap")
library("RColorBrewer")

Aisles <- read.csv("aisles.csv")
View(Aisles)
head(Aisles)
Aisles$aisle <- as.factor(Aisles$aisle)
Amissing <- is.na(Aisles)
table(Amissing)

Departments <- read.csv("departments.csv")
View(Departments)
head(Departments)
Departments$department <- as.factor(Departments$department)
Dmissing <- is.na(Departments)
table(Dmissing)

Prior_order <- read.csv("order_products__prior.csv")
View(Prior_order)
head(Prior_order)
PO_missing <- is.na(Prior_order)
table(PO_missing)

Training_order <- read.csv("order_products__train.csv")
View(Training_order)
head(Training_order)
TO_missing <- is.na(Training_order)
table(TO_missing)

Orders <- read.csv("orders.csv")
View(Orders)
head(Orders)
Orders$order_hour_of_day <- as.numeric(Orders$order_hour_of_day)
Orders$eval_set <- as.factor(Orders$eval_set)
O_missing <- is.na(Orders)
table(O_missing)

Products <- read.csv("products.csv")
View(Products)
head(Products)
Products$product_name <- Products$product_name
Pmissing <- is.na(Products)
table(Pmissing)

ggplot(Orders,aes(x= order_hour_of_day)) +theme_bw() + geom_bar(fill = "blue") + labs(title = "Most orders with respect to Hour of Day") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)
ggplot(Orders,aes(x= order_hour_of_day)) +theme_bw() + facet_wrap(~eval_set) + geom_bar(fill = "blue") + labs(title = "Most orders with respect to Hour of Day") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)
ggplot(Orders,aes(x= order_dow)) +theme_bw() + geom_bar(fill = "purple") + labs(title = "Most orders with respect to Day of Week") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)
ggplot(Orders,aes(x= order_dow)) +theme_bw() + facet_wrap(~eval_set) + geom_bar(fill = "purple") + labs(title = "Most orders with respect to Day of Week") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)

ggplot(Orders,aes(x= days_since_prior_order)) +theme_bw() + geom_bar(fill = "orange") + labs(title = "Days since Customers reorder the most") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)
ggplot(Orders,aes(x= days_since_prior_order)) +theme_bw() + facet_wrap(~eval_set) + geom_bar(fill = "orange") + labs(title = "Most orders with respect to Hour of Day") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)

Training_order %>%
  group_by(order_id) %>%
  summarise(n_items = last(add_to_cart_order)) %>%
  ggplot(aes(x=n_items))+ geom_bar(stat="count",fill="brown") + labs(title = "No of Items bought by customers")

Most_sold <- Training_order %>% 
  group_by(product_id) %>% 
  summarize(count = n()) %>% 
  top_n(15, wt = count) %>%
  left_join(select(Products,product_id,product_name),by="product_id") %>%
  arrange(desc(count))
Most_sold
  ggplot(Most_sold, aes(x = reorder(product_name, -count), y = count)) + geom_col() + theme(axis.text.x=element_text(angle=90, hjust=1)) + labs(title = "Most items Sold")
  

Training_order$reordered[Training_order$reordered==1] <- "Reordered"
Training_order$reordered[Training_order$reordered==0] <- "Did not Reorder"
Reordered <- Training_order %>% 
  group_by(reordered) %>% 
  summarize(count = n())
Reordered
ggplot(Reordered, aes(x=reordered,y=count,fill=reordered))+ geom_bar(stat="identity") + scale_y_continuous(name="Fluorescent intensity/arbitrary units", labels = scales::comma)

Training_order$reordered[Training_order$reordered=="Reordered"] <- 1
Training_order$reordered[Training_order$reordered=="Did not Reorder"] <- 0
Training_order$reordered <- as.integer(Training_order$reordered)
Most_Reordered <-Training_order %>% 
  group_by(product_id) %>% 
  summarize(mean_reorder = mean(reordered), n=n()) %>% 
  filter(n>40) %>% 
  top_n(10,wt=mean_reorder) %>% 
  arrange(desc(mean_reorder)) %>% 
  left_join(Products,by="product_id")
Most_Reordered
ggplot(Most_Reordered, aes(x = reorder(product_name, -mean_reorder), y = mean_reorder)) + geom_col() + theme(axis.text.x=element_text(angle=90, hjust=1)) + labs(title = "Most Reordered Items")

Training_order %>% 
  left_join(Orders,by="order_id") %>% 
  group_by(days_since_prior_order) %>%
  summarise(avg_reorder = mean(reordered)) %>%
  ggplot(aes(x=days_since_prior_order,y=avg_reorder)) + geom_bar(stat="identity",fill="red")


Data_tree <- Products %>% group_by(department_id, aisle_id) %>% summarise(n=n())
Data_tree <- Data_tree %>% left_join(Departments,by="department_id")
Data_tree <- Data_tree %>% left_join(Aisles,by="aisle_id")

Data_tree2 <-Training_order %>% 
  group_by(product_id) %>% 
  summarise(count=n()) %>% 
  left_join(Products,by="product_id") %>% 
  ungroup() %>% 
  group_by(department_id,aisle_id) %>% 
  summarise(sumcount = sum(count)) %>% 
  left_join(Data_tree, by = c("department_id", "aisle_id")) %>% 
  mutate(onesize = 1)

treemap(Data_tree2,index=c("department","aisle"),vSize="onesize",vColor="department",palette="Set1",title="",sortID="-sumcount", border.col="#FFFFFF",type="categorical", fontsize.legend = 2,bg.labels = "#FFFFFF")
treemap(Data_tree,index=c("department","aisle"),vSize="n",title="",palette="Set3",border.col="#FFFFFF")
treemap(Data_tree2,index=c("department","aisle"),vSize="sumcount",title="",palette="Set3",border.col="#FFFFFF")

Best_customers <- Orders %>%
  group_by(user_id) %>%
  summarise(order_number = n()) %>%
  filter(order_number>50) %>% 
  arrange(desc(order_number))
Best_customers
View(Best_customers)

Customer_reorder <- Prior_order %>% 
  group_by(order_id) %>% 
  summarize(m = mean(reordered),n=n()) %>% 
  right_join(filter(Orders,order_number>2), by="order_id")

Customer_reorder2 <- Customer_reorder %>% 
  filter(eval_set =="prior") %>% 
  group_by(user_id) %>% 
  summarize(n_equal = sum(m==1,na.rm=T), percent_equal = n_equal/n()) %>% 
  filter(percent_equal == 1) %>% 
  arrange(desc(n_equal))
Customer_reorder2

Customer_reorder_product <-filter(Customer_reorder, user_id ==  99753)$order_id
Customer_reorder <- Prior_order %>% 
  filter(order_id %in% Customer_reorder_product) %>% 
  left_join(Products, by="product_id")
Customer_reorder


#Association rules:
Rules <- Training_order %>% group_by(order_id, product_id) %>% summarise(n=n())
Rules <- Rules %>% left_join(Products,by= c("product_id"))
Rules$product_id <- NULL
Rules$n <- NULL
Rules$aisle_id <- NULL
Rules$department_id <- NULL

dir.create(path = "tmp", showWarnings = FALSE)

# Write our data.frame to a csv
write.csv(Rules, "./tmp/tall_transactions.csv")

order_trans <- read.transactions(
  file = "./tmp/tall_transactions.csv",
  format = "single",
  sep = ",",
  cols=c("order_id","product_name"),
  rm.duplicates = T
)

summary(order_trans)
inspect(order_trans[1:115])
#Top 15 items
itemFrequencyPlot(order_trans, topN = 15)
itemFrequencyPlot(order_trans,topN=15,type="absolute",col=brewer.pal(8,'Pastel2'), main="Absolute Item Frequency Plot")

a.rules <- apriori(order_trans, parameter = list(support=0.001, conf=0.40,maxlen=5))
summary(a.rules)
inspect(a.rules[1:10])

a.rules1 <- apriori(order_trans, parameter = list(supp=0.001, conf=0.30))
a.rules1 <- sort(a.rules1, by='confidence', decreasing = TRUE)
summary(a.rules1)
inspect(a.rules1[1:10])

a.rules1 <- sort (a.rules1, by="lift", decreasing=TRUE) # 'high-lift' rules.
inspect(head(a.rules1))

a.rules2 <- apriori(order_trans, parameter = list (supp = 0.001, conf = 0.5, maxlen=3)) # maxlen
summary(a.rules2)
inspect(head(a.rules2))

a.rules3 <- apriori (data=order_trans, parameter=list (supp=0.001,conf = 0.08), appearance = list (default="lhs",rhs="Organic Avocado"), control = list (verbose=F)) # get rules that lead to buying 'whole milk'
rules_conf <- sort (a.rules3, by="confidence", decreasing=TRUE) # 'high-confidence' rules.
inspect(head(rules_conf))

## Scatterplot
plot(a.rules)
## try: sel <- plot(rules, interactive=TRUE)

## Scatterplot with custom colors
library(colorspace) # for sequential_hcl
plot(a.rules, control=list(col=sequential_hcl(100)))

## Two-key plot is a scatterplot with shading = "order"
plot(a.rules, shading="order", control=list(main = "Two-key plot", 
                                          col=rainbow(5)))

## The following techniques work better with fewer rules
subrules <- subset(a.rules, lift>4)
subrules

## grouped matrix plot
plot(a.rules, method="grouped")
## try: sel <- plot(rules, method="grouped", interactive=TRUE)

## graphs only work well with very few rules
subrules2 <- sample(a.rules, 10)
plot(subrules2, method="graph")
## igraph layout generators can be used (see ? igraph::layout_)
plot(subrules2, method="graph", control=list(layout=igraph::in_circle()))
plot(subrules2, method="graph", control=list(
  layout=igraph::with_graphopt(spring.const=5, mass=50)))

plot(subrules2, method="graph", control=list(type="itemsets"))
## try: plot(subrules2, method="graph", interactive=TRUE)
## try: plot(subrules2, method="graph", control=list(engine="graphviz"))


## parallel coordinates plot
plot(subrules2, method="paracoord")
plot(subrules2, method="paracoord", control=list(reorder=TRUE))

## Doubledecker plot only works for a single rule
oneRule <- sample(a.rules, 1)
plot(oneRule, method="doubledecker", data = order_trans)

## use iplots (experimental)
## try: sel <- plot(rules, method="iplots", interactive=TRUE)


## for itemsets
itemsets <- eclat(order_trans, parameter = list(support = 0.009, minlen=2))
plot(itemsets)
plot(itemsets, method="graph")
plot(itemsets, method="paracoord", control=list(alpha=.5, reorder=TRUE))

## add more quality measures to use for the scatterplot
quality(itemsets) <- interestMeasure(itemsets, trans=order_trans)
head(quality(itemsets))
plot(itemsets, measure=c("support", "allConfidence"), shading="lift")


