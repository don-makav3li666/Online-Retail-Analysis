# Online-Retail-Analysis

![1-c829b1d8](https://github.com/user-attachments/assets/590b6fb2-8e45-4d90-9e16-2c38b1f45f9e.PNG)

1. INTRODUCTION

Purpose: The purpose of this analysis is to gain insights into sales performance, customer purchasing behaviors, and revenue trends for strategic decision-making. By examining key metrics such as product sales, revenue by transaction, customer spend, and geographic distribution, this report aims to provide actionable recommendations to enhance revenue growth and customer engagement.

Scope: This analysis covers transactional data, focusing on product sales, customer behavior, sales trends by time, and geographic insights. The dataset contains transactional information including product details, quantities sold, unit prices, customer identifiers, and purchase locations. These transactions occur between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.



2. DATASET OVERVIEW

The dataset contains "532,618" transactions by invoiceNo excluding NULL fields (which is as a result of cases where InvoiceNo begins with "C", indicating cancelled transactions) and "4,372" unique customers 

Source: The dataset is sourced from UC Irvine Machine Learning Repository

License: This dataset is licensed under a Creative Commons Attribution 4.0 International (CC BY 4.0) license.
This allows for the sharing and adaptation of the datasets for any purpose, provided that the appropriate credit is given.

Variable Information:

InvoiceNo: Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'c', it indicates a cancellation. 

StockCode: Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product.

Description: Product (item) name. Nominal.

Quantity: The quantities of each product (item) per transaction. Numeric.	

InvoiceDate: Invoice Date and time. Numeric, the day and time when each transaction was generated.

UnitPrice: Unit price. Numeric, Product price per unit in sterling.

CustomerID: Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer.

Country: Country name. Nominal, the name of the country where each customer resides. 



3. METHODOLOGY
   
Data Cleaning:

Renamed "Description" column to "Product_Description" to avoid SQL "DESCRIPTION" function error

Filtered out rows with null or missing values, particularly in CustomerID and Product_Description

Filtered out transactions with negative or zero quantities/unit price which were as a result of returned or damaged products, so as to focus on valid purchases

Filtered out rows with incosistent values (indicating returned or damaged products) in StockCodes such that focus was on only codes with 5-digits

Analytical Approach:

Aggregated sales and revenue data by product, customer, country, and time.

Identified trends by examining weekday, monthly, and hourly patterns.

Segment analysis was conducted to reveal high-value customers and top-selling products.


4. KEY FINDINGS AND INSIGHTS
   
A. Sales and Revenue Analysis

I. Total Sales and Revenue by Product

Finding: The top-selling product by quantity (80995) is the "PAPER CRAFT , LITTLE BIRDIE" (StockCode 23843), which accounts for a significant portion of total sales volume. In terms of revenue, "REGENCY CAKESTAND 3 TIER" (StockCode 22423) is the highest revenue-generating product (£174,484.74) due to its high unit price and quantity sold.

Insight: Maintaining adequate stock for these products could help meet customer demand, maximize sales and revenue.

II. Total Revenue Per Invoice

Finding: There is a positive pattern where products with most quantities ordered generating the most revenue; The highest revenue which is (£168,469.6) was generated by InvoiceNo 581483. Although, (InvoiceNo 556444) is among the top 10 products that generated a revenue at £38970 but has a low total quantity of 60, this is due to the fact it contains transaction of product with the highest UnitPrice of £649.5 

Insight: The above suggests that while high-quantity items drive volume-based revenue, certain high-value products contribute strategically to revenue by generating large amounts per sale. This dual revenue structure could be beneficial for balancing overall sales strategy, allowing the business to leverage both high-demand, lower-priced items and high-margin premium items.

B. Customer Behavior Analysis

I. Unique Customers
   
Finding: The dataset contains around 4,300 unique customers, primarily from the United Kingdom which has a high distribution of 90% customers which makes sense considering the dataset is from a UK-based and registered non-store online retail.

Insight: With only about 10% of customers from outside the UK, there may be untapped opportunities in international markets. Expanding marketing efforts in other countries could diversify the customer base, reduce dependency on a single region, and open new revenue streams.

II. Customer Spend Analysis

Finding: Customers exhibit varied spending levels, with some contributing significantly based on average/total spending per transactions and others with minimal spending.

High-spending customers represent the top percentile, contributing disproportionately to overall revenue. For example, the highest spender may have contributed several times more than lower-spending customers. 

CustomerID (14646) has an average spending per transaction of £134.05 but the highest total spending of £279,489.02 over 2080 transactions, indicating that they make frequent small purchases. In contrast, 

CustomerID (18102) has an average spending per transaction of £592.24 but a total spending of £256438.49 over 431 transactions, showing that they make occasional large purchases.

Also, a segment of customers has minimal or negative net spending due to factors such as product returns, adjustments or damages. For instance, if some customers frequently return products, it could impact their net contribution negatively or result in zero spending.

Insight: The top customers by total spending can be identified as high-value clients. These customers contribute significantly to sales and are likely to respond well to loyalty programs, targeted promotions, or personalized engagement to encourage repeat business.

Investigate low or zero-spending customers to understand barriers to increased spending. This could involve analyzing reasons for product returns or negative spendings.

III. Top Buyers by Quantity Purchased and Revenue Generated

Finding:CustomerID (14646) is the highest buyer based on quantity purchased (196,719) and revenue generated (£279,489.02), followed by several others with similar purchasing patterns. 

Insight: There is a positive pattern between total quantity purchased and revenue generated. Hence, dentifying and offering exclusive benefits to these top customers could encourage continued high-value purchases.


C. Time-Based Analysis

I. Peak Sales Hours

Finding: Sales peaked from 8 AM to 7 PM. There is minimal purchasing activity from 8 PM to 7 AM.
Insight: Targeted marketing emails and promotions sent in the morning could capitalize on peak purchase hours.

II. Sales Trends by Month

Finding: According to the data, November 2011 reached the peak with 3,021 invoices and 740,286 items sold, representing the highest monthly transaction count and quantity for the entire period. In contrast, December 2011 saw a drastic drop, with only 869 invoices and 226,333 items sold—the lowest recorded for both metrics.

Insight: This data highlights a pronounced seasonal sales pattern. The November spike indicates a surge likely tied to holiday shopping or major promotions, such as pre-holiday sales, which maximized customer purchases. The drop in December 2011 suggests that demand may have been largely met during November, leading to a slower December. This pattern could reflect consumer behavior where bulk purchasing happens early in the season, possibly due to anticipated stockouts or discount-driven purchases. However, there is not enough data to determine if this is a regular occurence.

III. SalesTrends by Day of Week

    Findings: With a total quantity sold of 4,689 and total revenue of $1,167,823, Thursday stands out as the strongest day in terms of both sales volume and revenue generation.
    Midweek Outperforms the Weekend in Sales:

    The top three days for both quantity and revenue are Thursday, Wednesday, and Tuesday. Together, they account for a significant share of total sales, indicating that midweek days are the peak sales period.
    In contrast, Sunday shows the lowest sales, with only 2,207 items sold and a revenue of $467,732, suggesting a dip in customer activity on weekends.

    Insight: Since midweek days (Tuesday to Thursday) generate the highest sales, consider focusing marketing promotions or product launches on these days to capitalize on existing customer interest. For 
    example, 
    running a midweek sale could amplify already high traffic and increase revenue further.

    Sunday shows the lowest sales and revenue. This could be an opportunity to explore targeted promotions or discounts to encourage more purchases. Testing special weekend offers, like "Sunday-only discounts," 
    might help capture a larger audience and boost end-of-week sales.


IV. Repeat Purchase Patterns

 Findings

  - Moderate-Frequency Purchasers: The largest group of customers, with 1,757 customers are classified as "Moderate-Frequency Purchasers," making purchases every 31 to 180 days.

  - High-Frequency Purchasers: There are 1,134 customers who fall into the "High-Frequency Purchaser" category, making purchases roughly every month or more frequently (within a 30-day interval).

  - Low-Frequency Purchasers: A smaller segment, with 167 customers are classified as "Low-Frequency Purchasers," with intervals between purchases ranging from 181 to 366 days.

 Insights

  - Opportunity for Customer Segmentation and Personalization

  - Understanding the distribution of purchase frequency enables more effective customer segmentation. Each frequency group has distinct purchasing behaviors, allowing for tailored marketing strategies:

  - High-Frequency Purchasers: Benefit from loyalty programs.

  - Moderate-Frequency Purchasers: Engage with reminders and retention offers.

  - Low-Frequency Purchasers: Appeal with seasonal or limited-time offers.


D. Geographic Analysis

I. Distribution of Revenue by Country

 Findings

  - Top Revenue-Generating Country:

     United Kingdom is by far the highest revenue contributor, generating £8,187,806.36, which accounts for 84% of total revenue. This suggests that the UK is the primary market for this business.

  - Secondary Markets:

Netherlands and Ireland (EIRE) are the next two top contributors, generating £284,661.54 and £263,276.82 respectively. Despite being in the top three, their contributions are significantly lower than the UK, making up only around 2.92% and 2.7% of total revenue.


