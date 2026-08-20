# retail sales analytics

retail sales analytics project using sql, postgresql and power bi to explore sales performance, customer behavior, product categories and delivery metrics.

## project overview

this project analyzes the brazilian e-commerce public dataset by olist, which contains transactional data from an online marketplace.

the goal is to simulate a real business analysis workflow by storing the data in postgresql, writing sql queries to answer business questions and later building a power bi dashboard with the main kpis and insights.

## tools

* postgresql
* sql
* pgadmin
* power bi

## dataset

the project uses the brazilian e-commerce public dataset by olist.

the main tables used are:

* customers
* orders
* order items
* products
* sellers
* payments
* reviews
* product category translations

## business questions

the analysis explores questions such as:

* what is the total revenue from delivered orders?
* what is the average order value?
* how does revenue change over time?
* which product categories generate the most revenue?
* which states generate the most revenue?
* what is the cancellation rate?
* what is the average delivery time?
* how often are deliveries late?
* how do late deliveries affect customer reviews?
* how many customers make repeat purchases?

## key findings

### sales

* total revenue from delivered orders: **r$ 13,221,498.11**
* average order value: **r$ 137.04**
* revenue increased significantly throughout 2017

### top product categories

the highest revenue categories include:

1. health & beauty
2. watches & gifts
3. bed, bath & table
4. sports & leisure
5. computers & accessories

### geographic performance

são paulo generated the highest revenue among all brazilian states, followed by rio de janeiro and minas gerais.

### operations

* cancellation rate: **0.63%**
* average delivery time: **12.56 days**
* late delivery rate: **8.11%**

### customer satisfaction

delivery delays had a strong relationship with review scores:

* on-time deliveries: **4.29 average review score**
* late deliveries: **2.57 average review score**

this suggests that delivery performance has a major impact on customer satisfaction.

### customer retention

only **3.00%** of customers made more than one delivered order.

this suggests a significant opportunity for customer retention and repeat-purchase strategies.

## repository structure

```text
retail-sales-analytics/
├── data/
├── sql/
│   └── 01_sales_analysis.sql
├── dashboard/
├── images/
└── README.md
```

## sql analysis

the sql queries used in this project can be found in:

`sql/01_sales_analysis.sql`

## next steps

* build the power bi dashboard
* create visualizations for the main kpis
* analyze monthly sales growth in more detail
* explore seller performance
* investigate customer retention opportunities
