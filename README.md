# Online-Retail-Analysis

![1-c829b1d8](https://github.com/user-attachments/assets/590b6fb2-8e45-4d90-9e16-2c38b1f45f9e.PNG)

## 1. INTRODUCTION

Purpose: The purpose of this analysis is to gain insights into sales performance, customer purchasing behaviors, and revenue trends for strategic decision-making. By examining key metrics such as product sales, revenue by transaction, customer spend, and geographic distribution, this report aims to provide actionable recommendations to enhance revenue growth and customer engagement.

Scope: This analysis covers transactional data, focusing on product sales, customer behavior, sales trends by time, and geographic insights. The dataset contains transactional information including product details, quantities sold, unit prices, customer identifiers, and purchase locations. These transactions occur between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.



## 2. DATASET OVERVIEW

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



## 3. METHODOLOGY
   
### Data Cleaning:

 - Renamed "Description" column to "Product_Description" to avoid SQL "DESCRIPTION" function error

 - Filtered out rows with null or missing values, particularly in CustomerID and Product_Description

 - Filtered out transactions with negative or zero quantities/unit price which were as a result of returned or damaged products, so as to focus on valid purchases

 - Filtered out rows with incosistent values (indicating returned or damaged products) in StockCodes such that focus was on only codes with 5-digits

### Analytical Approach:

 - Aggregated sales and revenue data by product, customer, country, and time.

 - Identified trends by examining weekday, monthly, and hourly patterns.

 - Segment analysis was conducted to reveal high-value customers and top-selling products.


## 4. KEY FINDINGS AND INSIGHTS
   
### A. Sales and Revenue Analysis

#### I. Total Sales and Revenue by Product

##### Finding 
 
  - The top-selling product by quantity (80995) is the "PAPER CRAFT , LITTLE BIRDIE" (StockCode 23843), which accounts for a significant portion of total sales volume. In terms of revenue, "REGENCY CAKESTAND 3 TIER" (StockCode 22423) is 
    the highest revenue-generating product (£174,484.74) due to its high unit price and quantity sold.

##### Insight 
  
  - Maintaining adequate stock for these products could help meet customer demand, maximize sales and revenue.

#### II. Total Revenue Per Invoice

##### Finding 
  
  - There is a positive pattern where products with most quantities ordered generating the most revenue; The highest revenue which is (£168,469.6) was generated by InvoiceNo 581483. Although, (InvoiceNo 556444) is among the top 10 
    products that generated a revenue at £38970 but has a low total quantity of 60, this is due to the fact it contains transaction of product with the highest UnitPrice of £649.5 

##### Insight 
  
  - The above suggests that while high-quantity items drive volume-based revenue, certain high-value products contribute strategically to revenue by generating large amounts per sale. This dual revenue structure could be beneficial for 
    balancing overall sales strategy, allowing the business to leverage both high-demand, lower-priced items and high-margin premium items.

### B. Customer Behavior Analysis

#### I. Unique Customers
   
##### Finding 
  
  - The dataset contains around 4,300 unique customers, primarily from the United Kingdom which has a high distribution of 90% customers which makes sense considering the dataset is from a UK-based and registered non-store online retail.

##### Insights

  - With only about 10% of customers from outside the UK, there may be untapped opportunities in international markets. Expanding marketing efforts in other countries could diversify the customer base, reduce dependency on a single 
    region, and open new revenue streams.

#### II. Customer Spend Analysis

##### Findings 

  - Customers exhibit varied spending levels, with some contributing significantly based on average/total spending per transactions and others with minimal spending.
    High-spending customers represent the top percentile, contributing disproportionately to overall revenue. For example, the highest spender may have contributed several times more than lower-spending customers. 

  - CustomerID (14646) has an average spending per transaction of £134.05 but the highest total spending of £279,489.02 over 2080 transactions, indicating that they make frequent small purchases. In contrast, 

  - CustomerID (18102) has an average spending per transaction of £592.24 but a total spending of £256438.49 over 431 transactions, showing that they make occasional large purchases.

  - Also, a segment of customers has minimal or negative net spending due to factors such as product returns, adjustments or damages. For instance, if some customers frequently return products, it could impact their net contribution 
    negatively or result in zero spending.

##### Insight 
  
  - The top customers by total spending can be identified as high-value clients. These customers contribute significantly to sales and are likely to respond well to loyalty programs, targeted promotions, or personalized engagement to 
    encourage repeat business.

  - Investigate low or zero-spending customers to understand barriers to increased spending. This could involve analyzing reasons for product returns or negative spendings.

#### III. Top Buyers by Quantity Purchased and Revenue Generated

##### Finding
  
  - CustomerID (14646) is the highest buyer based on quantity purchased (196,719) and revenue generated (£279,489.02), followed by several others with similar purchasing patterns. 

##### Insight 
  
  - There is a positive pattern between total quantity purchased and revenue generated. Hence, dentifying and offering exclusive benefits to these top customers could encourage continued high-value purchases.


### C. Time-Based Analysis

#### I. Peak Sales Hours

##### Finding 

 - Sales peaked from 8 AM to 7 PM. There is minimal purchasing activity from 8 PM to 7 AM.

##### Insight

 - Targeted marketing emails and promotions sent in the morning could capitalize on peak purchase hours.
 
#### II. Sales Trends by Month

 ##### Findings 

  - According to the data, November 2011 reached the peak with 3,021 invoices and 740,286 items sold, representing the highest monthly transaction count and quantity for the entire period. In contrast, December 2011 saw a drastic drop, 
    with only 869 invoices and 226,333 items sold—the lowest recorded for both metrics.

##### Insights
 
  - This data highlights a pronounced seasonal sales pattern. The November spike indicates a surge likely tied to holiday shopping or major promotions, such as pre-holiday sales, which maximized customer purchases. The drop in December 
    2011 suggests that demand may have been largely met during November, leading to a slower December. This pattern could reflect consumer behavior where bulk purchasing happens early in the season, possibly due to anticipated stockouts 
    or discount-driven purchases. However, there is not enough data to determine if this is a regular occurence.

#### III. SalesTrends by Day of Week

##### Findings 
  
  - With a total quantity sold of 4,689 and total revenue of $1,167,823, Thursday stands out as the strongest day in terms of both sales volume and revenue generation.
    Midweek Outperforms the Weekend in Sales:

  - The top three days for both quantity and revenue are Thursday, Wednesday, and Tuesday. Together, they account for a significant share of total sales, indicating that midweek days are the peak sales period.
    In contrast, Sunday shows the lowest sales, with only 2,207 items sold and a revenue of $467,732, suggesting a dip in customer activity on weekends.

   ##### Insight

  - Since midweek days (Tuesday to Thursday) generate the highest sales, consider focusing marketing promotions or product launches on these days to capitalize on existing customer interest. For 
    example, running a midweek sale could amplify already high traffic and increase revenue further.

  - Sunday shows the lowest sales and revenue. This could be an opportunity to explore targeted promotions or discounts to encourage more purchases. Testing special weekend offers, like "Sunday-only discounts," 
    might help capture a larger audience and boost end-of-week sales.


#### IV. Repeat Purchase Patterns

 ##### Findings

  - Moderate-Frequency Purchasers:

    The largest group of customers, with 1,757 customers are classified as "Moderate-Frequency Purchasers," making purchases every 31 to 180 days.

  - High-Frequency Purchasers:

    There are 1,134 customers who fall into the "High-Frequency Purchaser" category, making purchases roughly every month or more frequently (within a 30-day interval).

  - Low-Frequency Purchasers:

    A smaller segment, with 167 customers are classified as "Low-Frequency Purchasers," with intervals between purchases ranging from 181 to 366 days.

 ##### Insights

  - Opportunity for Customer Segmentation and Personalization

  - Understanding the distribution of purchase frequency enables more effective customer segmentation. Each frequency group has distinct purchasing behaviors, allowing for tailored marketing strategies:

  - High-Frequency Purchasers: Benefit from loyalty programs.

  - Moderate-Frequency Purchasers: Engage with reminders and retention offers.

  - Low-Frequency Purchasers: Appeal with seasonal or limited-time offers.



### D. Geographic Analysis

#### I. Distribution of Revenue by Country

 ##### Findings

  - Top Revenue-Generating Country:

    United Kingdom is by far the highest revenue contributor, generating £8,187,806.36, which accounts for 84% of total revenue. This suggests that the UK is the primary market for this business.

  - Secondary Markets:

    Netherlands and Ireland (EIRE) are the next two top contributors, generating £284,661.54 and £263,276.82 respectively. Despite being in the top three, their contributions are significantly lower than the UK, 
    making up only around 2.92% and 2.7% of total revenue.

  - Other Key Markets:

    Germany, France, and Australia also contribute notable revenues, collectively accounting for around 5.71% of total revenue. Although lower in revenue, they represent important markets outside the UK and nearby European regions.

  - Least Contributing Regions:

    Countries like Saudi Arabia, Brazil, and Czech Republic have the lowest revenue contributions, each making up 0.01% or less. This could indicate limited demand, market entry challenges, or distribution constraints.

 ##### Insights

  - Strong UK Dependency:

    The heavy revenue concentration in the UK (84%) highlights a reliance on the domestic market. Diversifying revenue sources by expanding internationally could reduce dependency on the UK and spread business risk.

  - Potential for Growth in Top European Markets:

    Countries like the Netherlands, Ireland, Germany, and France already contribute notable revenue. Increased investment in these markets could help strengthen customer bases and maximize growth. For instance, localized marketing or 
    country-specific promotions may help boost sales in these regions.

  - Investigate Barriers in Low-Contribution Countries:

    For markets with negligible contributions, it may be beneficial to investigate potential entry or growth barriers. Factors like distribution challenges, import regulations, and currency exchange could be limiting growth in markets 
    such as Brazil, the UAE, and Canada.

#### II. Country with the highest average order value

 ##### Findings

  - High Average Order Value

    Netherlands has the highest average order value (AOV) at 2996.44, indicating that customers from Netherlands spends significantly more per transaction compared to others.
  
  - Potential Bulk Purchases
  
    This high AOV could indicate a pattern of bulk purchasing, possibly by businesses or distributors rather than individual customers.

 ##### Insights 
 
  - Market Potential for Premium and Bulk Offers

    The Netherlands may have a strong market for higher-end products or bulk purchasing options. Targeted campaigns featuring premium products, wholesale options, or tiered discounts could be effective in capturing more sales from this 
    region.

  - Focus on Customer Retention

    Since these customers tend to place high-value orders, retention efforts in the Netherlands could lead to substantial revenue. Consider loyalty programs, tailored promotions, or priority support to enhance customer loyalty and 
    sustain this high AOV.

  - Analyze Customer Segments

    A deeper analysis of customer segments in the Netherlands—such as identifying whether these high AOVs are driven by a few large clients or by consistently high individual spending—can inform strategic decisions on inventory, 
    pricing, and marketing approaches tailored to this specific market.


#### III. Popular Products by Country based on Quantity

 ##### Findings

   - Based on quantity, the United Kingdom has the highest-selling product; WORLD WAR 2 GLIDERS ASSTD DESIGNS (toys), with a significant quantity of 48,326 sold.

   - In Netherlands, France, and Japan, the top-selling product is the RABBIT NIGHT LIGHT (LED Nursery Night), with relatively high quantities (4,801 in the Netherlands, 4,023 in France, and 3,401 in Japan).

   - Australia and Sweden share the top-selling product, MINI PAINT SET VINTAGE, with 2,916 units sold in each country.

   - Ireland (EIRE) shows high sales for PACK OF 72 RETROSPOT CAKE CASES (1,728 units), suggesting a preference for cupcake cases.

   - Some countries have significantly lower sales for their top product, such as Lebanon with only 24 units of ASSTD FRUIT+FLOWERS FRIDGE MAGNETS and Saudi Arabia with 12 units of PLASTERS IN TIN SKULLS.

 ##### Insights

   - Regional Marketing Opportunities:

     The high sales volume of specific items, such as WORLD WAR 2 GLIDERS ASSTD DESIGNS in the UK and RABBIT NIGHT LIGHT in several European and Asian countries, suggests these products could benefit from additional marketing and stock 
     availability in these regions.
     Identifying such high-demand products in each region allows the company to tailor marketing efforts, focusing on the most popular items for each country.

   - Potential Growth Areas in Low-Sales Countries:

     Countries with lower sales figures, such as Lebanon and Saudi Arabia, might not yet be fully engaged markets. Experimenting with targeted advertisements, promotions, or partnerships could increase interest and boost sales in these 
     regions.

 #### IV. Popular Products by Country Based on Revenue

 ##### Findings

   - The United Kingdom shows high demand for kids toys "WORLD WAR 2 GLIDERS ASSTD DESIGNS" generating a total revenue  of £12,055.96, indicating a wide margin in terms of the highest sales value for a single product.

   - Other countries, such as the Netherlands and France, prefer the "RABBIT NIGHT LIGHT," with a total revenue of £9,568.48 and £7,275.12, respectively.

   - For Switzerland and Saudi Arabia, the highest sales are for items like "PLASTERS IN TIN" with unique designs (e.g., "WOODLAND ANIMALS" and "SKULLS").

   - Smaller markets, like Bahrain and Cyprus, have lower total sales values for their top items, suggesting either lower demand or fewer high-priced items purchased.

 ##### Insights
 
   - Market-Specific Preferences
   
     The popularity of certain items, like "WORLD WAR 2 GLIDERS ASSTD DESIGNS" in the UK and the "RABBIT NIGHT LIGHT" in several countries, suggests unique regional preferences. This could inform inventory 
     management, targeting high-demand items in specific regions, especially for larger markets like the UK and the Netherlands.

   - Potential for Expanding Top Products in New Markets:

     Items with broad appeal, like the "RABBIT NIGHT LIGHT," could be marketed in new regions to capitalize on its popularity across diverse markets. Advertising campaigns that leverage this product’s appeal could be more successful in 
     attracting new customers.



