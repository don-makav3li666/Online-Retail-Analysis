# Online-Retail-Analysis

![1-c829b1d8](https://github.com/user-attachments/assets/590b6fb2-8e45-4d90-9e16-2c38b1f45f9e.PNG)

## 1. INTRODUCTION

### Purpose

The purpose of this analysis is to gain insights into sales performance, customer purchasing behaviors, and revenue trends for strategic decision-making. By examining key metrics 
such as product sales, revenue by transaction, customer spend, and geographic distribution, this report aims to provide actionable recommendations to enhance revenue growth and customer engagement.

###Scope

This analysis covers transactional data, focusing on product sales, customer behavior, sales trends by time, and geographic insights. The dataset contains transactional information including product details, quantities sold, unit prices, customer identifiers, and purchase locations. These transactions occur between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.



## 2. DATASET OVERVIEW

The dataset contains "532,618" transactions by invoiceNo excluding NULL fields (which is as a result of cases where InvoiceNo begins with "C", indicating cancelled transactions) and "4,372" unique customers 

- Source: The dataset is sourced from UC Irvine Machine Learning Repository

- License: This dataset is licensed under a Creative Commons Attribution 4.0 International (CC BY 4.0) license.
  This allows for the sharing and adaptation of the datasets for any purpose, provided that the appropriate credit is given.

- Variable Information:

  - InvoiceNo: Invoice number. Nominal, a 6-digit integral number uniquely assigned to each transaction. If this code starts with letter 'C', it indicates a cancellation. 

  - StockCode: Product (item) code. Nominal, a 5-digit integral number uniquely assigned to each distinct product.

  - Description: Product (item) name. Nominal.

  - Quantity: The quantities of each product (item) per transaction. Numeric.	

  - InvoiceDate: Invoice Date and time. Numeric, the day and time when each transaction was generated.

  - UnitPrice: Unit price. Numeric, Product price per unit in sterling.

  - CustomerID: Customer number. Nominal, a 5-digit integral number uniquely assigned to each customer.

  - Country: Country name. Nominal, the name of the country where each customer resides. 



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
 
  - The top-selling product by quantity (80995) is the *PAPER CRAFT , LITTLE BIRDIE* (StockCode 23843), which accounts for a significant portion of total sales volume. In terms of revenue, *REGENCY CAKESTAND 3 TIER* (StockCode 22423) is 
    the highest revenue-generating product (£174,484.74) due to its high unit price and quantity sold.

##### Insight 
  
  - Revenue Drivers:

    High-revenue products, such as *REGENCY CAKESTAND 3 TIER* and *PAPER CRAFT, LITTLE BIRDIE*, are likely customer favorites or meet specific, consistent needs (e.g., gifting, 
    decoration, or event supplies). These products should remain focal points in inventory management and marketing efforts.

#### II. Total Revenue Per Invoice

##### Finding 
  
  - There is a positive pattern where products with most quantities ordered generating the most revenue; The highest revenue which is (£168,469.6) was generated by InvoiceNo 581483. Although, (InvoiceNo 556444) is among the top 10 
    transactions that generated a revenue at £38970 but has a low total quantity of 60, this is due to the fact it contains transaction of product with the highest UnitPrice of £649.5 

##### Insight 
  
  - The above suggests that while high-quantity items drive volume-based revenue, certain high-value products contribute strategically to revenue by generating large amounts per sale. This dual revenue structure could be beneficial for 
    balancing overall sales strategy, allowing the business to leverage both high-demand, lower-priced items and high-margin premium items.

  - A significant portion of the customers (such as customer IDs 570554, 567869, 539441, etc.) are contributing very little to total revenue, with some even generating only a few pennies or no substantial revenue at all. This indicates that many customers may only make one-time or low-value purchases, suggesting that customer retention or repeat purchases are not being effectively managed.  

### B. Customer Behavior Analysis

#### I. Unique Customers
   
##### Finding 
  
  - The dataset contains around 4,300 unique customers, primarily from the United Kingdom which has a high distribution of 90% customers which makes sense considering the dataset is from a UK-based and registered non-store online retail.

##### Insights

  - Strong Dominance of the United Kingdom Market

    The **United Kingdom** accounts for 90.35% of the total volume, with 3,950 transactions compared to much smaller figures from other countries. This suggests that the UK is the primary 
    market for this business, with a large customer base and frequent transactions driving the overwhelming majority of the sales.

  - Low Engagement in Other International Markets
    
    Other countries show significantly lower transaction volumes, with many countries contributing less than 0.1% of the total volume. This indicates limited market penetration or lower 
    consumer demand in these regions. Countries like **Germany**, **France**, **Spain**, and **Switzerland** show some activity, but the figures are still very small compared to the **UK**.  

#### II. Customer Spend Analysis

##### Findings 

  - Customers exhibit varied spending levels, with some contributing significantly based on average/total spending per transactions and others with minimal spending.
    High-spending customers represent the top percentile, contributing disproportionately to overall revenue. For example, the highest spender may have contributed several times more than lower-spending customers. 

##### Insights 
  
  -  CustomerID (14646) has an average spending per transaction of £134.05 but the highest total spending of £279,489.02 over 2080 transactions, indicating that they make frequent small purchases. In contrast, CustomerID (18102) has an average spending per transaction of £592.24 but a total spending of £256438.49 over 431 transactions, showing that they make occasional large purchases.

  - Also, several customers (e.g., Customer 16446, Customer 16738, Customer 17956, etc.) have made only a single purchase, contributing very little to the overall revenue. These single purchases are generally small in volume and price, resulting in a minimal impact on total revenue. This suggests that a portion of customers may not be fully engaged or loyal.
    
#### III. Top Buyers by Quantity Purchased and Revenue Generated

##### Finding

  - High-Quantity Buyers Contribute Significantly to Revenue
    
    Customers with IDs 14646, 12415, and 14911 have high quantities purchased (e.g., 196,719, 77,242, and 77,180 respectively) and also generate substantial revenue (e.g., £279,489.02, £123,725.45, and £132,572.62). 

  - Moderate Revenue but Significant Quantity Buyers Could Drive Future Growth

    Customers such as 17450 and 18102 have purchased substantial quantities (69,029 and 64,122) but with somewhat moderate revenue generation (e.g., £187,482.17 and £256,438.49).

##### Insights 
  
  - The above indicates a strong correlation between purchasing volume and revenue contribution. Customers who buy in large quantities tend to spend more overall, highlighting the importance of engaging high-volume buyers.

  - Although some customers buy frequently, they might be purchasing lower-priced items or making smaller purchases per transaction.

### C. Time-Based Analysis

#### I. Peak Sales Hours

##### Finding 

 - Sales peaked from 9 AM to 5 PM. There is a huge decline in purchasing activities from 6 PM.

##### Insights

 - Peak Sales Hours Clustered Between 9 AM and 5 PM

The data shows a significant increase in sales during hours 9 (8 AM - 9 AM) to 16 (4 PM - 5 PM), with a gradual peak at 10 AM (49,037), 11 AM (57,674), and continuing into the afternoon hours. This indicates that a majority of sales occur during standard business hours, likely driven by regular working hours when customers are most likely engaged in shopping or purchasing decisions. The sharp drop after 5 PM shows a clear decline in customer activity towards evening, which might be attributed to consumers completing their workday and shifting focus away from purchases.

 - Late Night and Early Morning Low Sales

Sales during the late-night and early-morning hours, such as 18 (7,974), 19 (3,705), and 20 (871), are significantly lower compared to mid-morning and afternoon hours. This suggests that consumers are less likely to engage in purchasing activities at these times, possibly due to typical sleep patterns or reduced online activity.
 
#### II. Sales Trends by Month

 ##### Findings 

  - The months of October and November show the highest sales volume, with October reaching 2,275 sales and November seeing a peak of 3,021 sales. The sharp increase during these months indicates that certain seasonal factors or promotional events likely occurred, driving a higher volume of transactions.

  - Based on the ordering of results, after November 2011, there is a noticeable decline in sales volume, with sales dropping from 3,021 in November to 869 in December. The drop is significant, indicating a potential seasonal dip or a lack of follow-up promotions to maintain engagement.

##### Insights
 
  - This increase in October and November could be attributed to factors like the approaching holiday season (e.g., Christmas or Black Friday), special promotions, or customer purchasing behaviors associated with the end of the year, where people often prepare for holidays and festivities.

  - The sharp decline in December could suggest that after the holiday rush, customer demand drops off, as people may have finished their holiday shopping, or because of a lack of targeted post-holiday sales events. Alternatively, the post-holiday period might see reduced marketing efforts.

#### III. SalesTrends by Day of Week

##### Findings 
  
  - Midweek Outperforms the Weekend in Sales
    
    With a total transaction of 4,689 and total quantity sold of 1,167,823, Thursday stands out as the strongest day in terms of both sales volume and revenue generation.
    Midweek Outperforms the Weekend in Sales. The top three days for both quantity and revenue are Thursday, Wednesday, and Tuesday. Together, they account for a significant share of total sales, indicating that midweek days are the peak sales period.

    In contrast, Sunday shows the lowest number of transactions, with only 2,207 transactions and a total quantity of goods sold at 467,732, suggesting a dip in customer activity on weekends.

   ##### Insight

  -  Sales are highest on Thursday and Wednesday, with these days generating 1,167,823 and 969,558 in revenue, respectively. This suggests that customers are more likely to make purchases mid-week, possibly due to people preparing for the upcoming weekend
    
  - Sales are lower on Friday and especially on Sunday, generating 794,440 and 467,732 total quantity sold, respectively. This could be due to various factors: people may be less inclined to shop on Sundays as they prepare for the workweek ahead, and on Fridays, consumers may prioritize other weekend activities over shopping. Additionally, consumer purchasing behavior might be influenced by retail trends or store-specific scheduling, such as slower start to weekend promotions.


#### IV. Repeat Purchase Patterns

 ##### Findings

  - Moderate-Frequency Purchasers:

    The largest group of customers, with 1,757 customers are classified as **Moderate-Frequency Purchasers**, making purchases every 31 to 180 days.

  - High-Frequency Purchasers:

    There are 1,134 customers who fall into the **High-Frequency Purchaser** category, making purchases roughly every month or more frequently (within a 30-day interval).

  - Low-Frequency Purchasers:

    A smaller segment, with 167 customers are classified as **Low-Frequency Purchasers**, with intervals between purchases ranging from 181 to 366 days.

 ##### Insights

  - The largest group of customers are categorized as **Moderate-Frequency Purchasers** (1,757 customers), making repeat purchases between 31 and 180 days apart. This suggests that most customers tend to make repeat purchases at regular intervals, but not frequently enough to be considered high-frequency buyers. It could indicate that the products are more likely to be purchased on a semi-annual or quarterly basis, with customers returning as needed rather than making frequent impulse buys.

  - The **Low-Frequency Purchasers** group is significantly smaller (167 customers), with intervals between purchases ranging from 181 to 366 days. This suggests that these customers make purchases infrequently, potentially due to seasonal buying habits, product lifecycle, or a one-time need. The smaller size of this group indicates that the product or service may not have a strong recurring demand or that the company has not successfully engaged these customers to return more often.

### D. Geographic Analysis

#### I. Distribution of Revenue by Country

 ##### Findings

  - Top Revenue-Generating Country:

    **United Kingdom** is by far the highest revenue contributor, generating £8,187,806.36, which accounts for 84% of total revenue. This suggests that the **UK** is the primary market for this business.

  - Secondary Markets:

    **Netherlands** and **Ireland** **(EIRE)** are the next two top contributors, generating £284,661.54 and £263,276.82 respectively. Despite being in the top three, their contributions are significantly lower than the **UK**, 
    making up only around 2.92% and 2.7% of total revenue.

  - Other Key Markets:

    **Germany**, **France**, and **Australia** also contribute notable revenues, collectively accounting for around 5.71% of total revenue. Although lower in revenue, they represent important markets outside the UK and nearby European regions.

  - Least Contributing Regions:

    Countries like **Saudi Arabia**, **Brazil**, and **Czech Republic** have the lowest revenue contributions, each making up 0.01% or less. This could indicate limited demand, market entry challenges, or distribution constraints.

 ##### Insights

  - Strong UK Dependency:

    The business may have established stronger brand recognition, localized marketing efforts, and efficient distribution networks within the UK compared to other regions. Additionally, local demand for the product portfolio is likely higher due to cultural familiarity or tailored offerings.


  -  Minimal Contributions from Non-European Markets:

     Countries outside Europe, such as **USA** (0.02%), **Canada** (0.04%), and **Brazil** (0.01%), contribute negligible revenue. Even large economies like **Japan** (0.36%) and **Australia** (1.41%) underperform relative to their market potential. This could be due to logistical challenges, lack of localized marketing strategies, limited brand presence, or regulatory barriers in non-European markets.
    

#### II. Country with the highest average order value

 ##### Findings

 Netherlands has the highest average order value (AOV) at 2996.44, indicating that customers from Netherlands spends significantly more per transaction compared to others.

 ##### Insights 
 
 The **Netherlands** may have:
    
  - A strong market for higher-end products or bulk purchasing options
  - A smaller but more affluent customer base
  - Fewer transactions but larger basket sizes. 
   

#### III. Popular Products by Country based on Quantity

 ##### Findings

   - Based on quantity, the **United Kingdom** has the highest-selling product; *WORLD WAR 2 GLIDERS ASSTD DESIGNS*, with a significant quantity of 48,326 sold.

   - In **Netherlands**, **France**, and **Japan**, the top-selling product is the *RABBIT NIGHT LIGHT (LED Nursery Night)*, with relatively high quantities (4,801 in the **Netherlands**, 4,023 in **France**, and 3,401 in **Japan**).

   - **Australia** and **Sweden** share the top-selling product, *MINI PAINT SET VINTAGE*, with 2,916 units sold in each country.

   - **Ireland (EIRE)** shows high sales for *PACK OF 72 RETROSPOT CAKE CASES* (1,728 units), suggesting a preference for cupcake cases.

   - Some countries have significantly lower sales for their top product, such as **Lebanon** with only 24 units of *ASSTD FRUIT+FLOWERS FRIDGE MAGNETS* and **Saudi Arabia** with 12 units of *PLASTERS IN TIN SKULLS*.

 ##### Insights

   - Local preferences influence top-selling products across countries:

     The data reveals that each country has a unique top-selling product, often reflecting, toys for kids, cultural preferences or practical needs. For instance;

     - In the **United Kingdom**, the top product is *WORLD WAR 2 GLIDERS ASSTD DESIGNS* toy (48,326 units), which may appeal to kids in the region and are perfect for party bags and treats!.
     - **Netherlands**, **France**, and **Japan** share the *RABBIT NIGHT LIGHT* as their top product, suggesting its universal appeal but possibly tied to gifting culture or functional lighting preferences in these regions.
     - Products like *ROUND SNACK BOXES SET OF 4 WOODLAND* dominate in **Germany** and **Hong Kong**, indicating practical household product demand.

   -  Children's and decorative products dominate internationally:

      Many top-selling products, such as; WORLD WAR 2 GLIDERS ASSTD DESIGNS(**United Kingdom**), *MINI PAINT SET VINTAGE* (**Australia**, **Sweden**), *ICE CREAM SUNDAE LIP GLOSS* (**Iceland**, **Bahrain**), and *ROUND SNACK BOXES SET OF 4 WOODLAND* (**Germany**), are items geared toward children or decorative purposes. This suggests that customers in multiple regions are drawn to items with novelty, gift appeal, or aesthetic value.


 #### IV. Popular Products by Country Based on Revenue

 ##### Findings

   - The **United Kingdom** shows high demand for kids toys *WORLD WAR 2 GLIDERS ASSTD DESIGNS* generating a total revenue  of £12,055.96, indicating a wide margin in terms of the highest sales value for a single product.

   - Other countries, such as the **Netherlands** and **France**, prefer the *RABBIT NIGHT LIGHT*," with a total revenue of £9,568.48 and £7,275.12, respectively.

   - For **Switzerland** and **Saudi Arabia**, the highest sales are for items like *PLASTERS IN TIN* with unique designs (e.g., *WOODLAND ANIMALS* and *SKULLS*).

   - Smaller markets, like **Bahrain** and **Cyprus**, have lower total sales values for their top items, suggesting either lower demand or fewer high-priced items purchased.

 ##### Insights
 
   - Country-Specific Product Preferences Reflect Local Demand

     Each country has distinct top-selling products, with some products like the *Rabbit Night Light* appearing as the most popular in multiple countries (**Netherlands**, **France**, **Japan**), while others are unique to specific markets, such as *World War 2 Gliders Asstd Designs* in the **UK** or *Mini Paint Set Vintage* in **Sweden** and **Australia**.  The success of these products likely stems from cultural relevance, functional appeal, or effective marketing tailored to local preferences. Products that align with local values or practical needs resonate more with consumers.
   
   - Limited Cross-Market Penetration for Most Products

     Many top-selling products are highly localized, with few items achieving multi-country appeal, such as the "Rabbit Night Light", which is the top choice in three different regions. Most products dominate only in specific countries, showing limited overlap in consumer preferences across markets. This limited penetration could be due to differences in cultural preferences, seasonal demand, or insufficient marketing efforts in certain regions.

     
### E. Product and Inventory Insights

#### I. Average Unit Price per Product

##### Findings
 
   - High-Value Products
   
     The top of the list includes high-value items such as *PICNIC BASKET WICKER 60 PIECES* (£649.5), *REGENCY MIRROR WITH SHUTTERS* (£156.43), and *RUSTIC SEVENTEEN DRAWER SIDEBOARD* (£156.03). These are likely premium or specialty items, 
     with most priced above £100.

   - Mid-Range Items

     Items like the *Dotcomgiftshop Gift Voucher* (£100), *VINTAGE POST OFFICE CABINET* (£66.36), and *SCHOOL DESK AND CHAIR* (£64.06) fall within a moderate price range, suggesting they might be popular, high-value items but 
     not necessarily luxury goods.

   - Low-Value Products

     The list includes a significant number of low-cost items like *POPART WOODEN PENCILS ASST* (£0.04), *MINI HIGHLIGHTER PENS* (£0.12), and *ANIMAL STICKERS* (£0.21). These are likely impulse buys or small add-ons.

     
##### Insights
 
   - Why are some products priced significantly higher?

     The top-priced products, such as the *PICNIC BASKET WICKER 60 PIECES* (£649.50), *REGENCY MIRROR WITH SHUTTERS* (£156.43), and *RUSTIC SEVENTEEN DRAWER SIDEBOARD* (£156.03), are likely premium or larger items requiring more materials and craftsmanship. These products may target niche markets that value design, utility, or exclusivity, which justifies their higher average unit prices.

   - Why are some products priced very low?

     Products like *POPART WOODEN PENCILS* (£0.04) and *PIECE OF CAMO STATIONERY SET* (£0.10) are inexpensive due to factors such as mass production, minimal material costs, or their positioning as promotional or impulse-buy items. These low-priced products are often used to attract a broader customer base or increase basket size during checkout.


#### II. Products With the Highest Quantity Sold Per Transaction

##### Findings

   - PAPER CRAFT, LITTLE BIRDIE (StockCode 23843)

     This product shows an exceptionally high quantity sold per transaction, with over 80,000 units sold in total. The dataset sghows only one valid transaction recorded for the product while the other transaction was cancelled suggesting that the product is a popular craft item bought in bulk, likely used for cards, scrapbook pages, tags, journals, planners, and other paper crafting and home decor projects.

   - MEDIUM CERAMIC TOP STORAGE JAR (StockCode 23166)

     With over 74,000 units sold, this storage jar seems to be a staple product in high demand, likely due to its versatility and practical use in home organization. The large transaction quantities may indicate it's popular with customers seeking functional, aesthetically pleasing storage solutions.

   - ASSTD DESIGN 3D PAPER STICKERS (StockCode 84826)

     With a total of 12,540 units sold in bulk, this product likely appeals to customers interested in arts, crafts, or stationery. The high quantity per transaction suggests it may be a popular choice for gift shops, craft stores, or schools, where items are purchased in bulk for creative activities.

   - WORLD WAR 2 GLIDERS ASSTD DESIGNS (StockCode 84077)

     This novelty item, with 4,800 units sold per transaction on average, appeals to a niche market interested in historical-themed products. The high quantity indicates that it's potentially a popular choice for events, school projects, where multiple units are purchased at once.

   - SMALL POPCORN HOLDER (StockCode 22197)

     With around 4,300 units sold, this item likely caters to entertainment or event settings, where popcorn holders are bought in bulk for cinemas, parties, or special events. The high volume per transaction suggests it is frequently purchased for gatherings or as a part of event supplies.

##### Insights

   -  Popularity of Craft and Decorative Items

      The top-selling products, such as *PAPER CRAFT, LITTLE BIRDIE* (80995 units sold) and *MEDIUM CERAMIC TOP STORAGE JAR* (74215 units sold), are mostly related to arts, crafts, and decorative items. These products have significantly higher quantities sold per transaction compared to others, indicating that they are highly sought after or popular among customers.

   - Specific Product Variants Are Commonly Purchased Together

    The *FAIRY CAKE FLANNEL ASSORTED COLOUR* appears twice in the results with the same quantity sold per transaction (3114 units). This repetition suggests that customers are purchasing multiple variants of this product, which could be linked to a preference for assortments or sets. The *SMALL CHINESE STYLE SCISSOR* (3000 units sold) also seems to cater to a specific, niche market.


#### III. Products That Appear Often In Invoices

##### Findings

   - High Popularity of Gift and Décor Items

     Products like *REGENCY CAKESTAND 3 TIER*, *ASSORTED COLOUR BIRD ORNAMENT*, and *HEART OF WICKER SMALL* indicate strong demand for home décor and decorative items.
     These items are likely purchased as gifts or for special occasions, reflecting their appeal across multiple customer segments.

   - Frequent Use of Reusable and Eco-Friendly Items

     Products like *LUNCH BAG RED RETROSPOT* and *JUMBO STORAGE BAG SUKI* suggest a preference for practical, reusable items. This trend aligns with growing consumer interest in eco- 
     friendly alternatives.

   - Party Supplies Are a Key Category:

     *PARTY BUNTING* and *PACK OF 72 RETROSPOT CAKE CASES* demonstrate the popularity of party and event supplies. These items likely cater to customers hosting celebrations or events, 
     driving frequent transactions.

     
##### Insights

   -  Popular Products Drive Frequent Sales

     The top products like *REGENCY CAKESTAND 3 TIER*, *PARTY BUNTING*, and *LUNCH BAG RED RETROSPOT* have significantly high invoice counts, indicating they are popular and frequently purchased. These products have likely gained widespread customer appeal due to their practicality, visual appeal, or alignment with customer trends for example; events like parties, seasonal products, or home decor.

   - Certain Product Categories Dominate Sales

     Products with the high invoice counts, such as *PARTY BUNTING* and "LUNCH BAG" products, tend to belong to event-based or lifestyle product categories, suggesting a trend towards products that cater to celebrations, personal items, and home decor. The recurring purchases of these items reflect ongoing consumer interest in events and personal needs related products.


## 5. Recommendations

#### I. Enhancing Customer Engagement Through Targeted Strategies to Boost Spending

  Investigate the reasons behind low customer spending. It could be beneficial to engage in targeted campaigns, such as offering discounts, personalized recommendations, or loyalty incentives, to encourage repeat purchases. For 
  customers with a history of low spending, consider segmenting them for special promotions or introductory offers that encourage them to make larger or more frequent purchases.
  
#### II. Focus on UK Retention and Expansion

Given the dominant role of the UK market, the company should invest further in customer retention strategies in the UK, such as loyalty programs or targeted promotions, to maintain and grow this market share. Expanding the product availability or customizing marketing strategies for the UK audience could help capture even more demand.

#### III. Targeted International Market Expansion

Focus efforts on identifying high-potential international markets for expansion. Countries like Germany and France, while lower in volume, show some traction. Tailoring marketing strategies to local preferences and offering region-specific promotions or product bundles could stimulate demand in these countries. Additionally, market research should be conducted in smaller markets like Japan, Canada, and the UAE to assess entry barriers and potential for growth.

#### IV. Enhancing Customer Retention through Loyalty Programs and Personalized Incentives

The business should consider developing loyalty programs or VIP customer incentives to further nurture relationships with high-value customers. Offering personalized promotions, discounts, or exclusive deals could encourage repeat purchases and strengthen customer retention.

#### V. Focus Marketing and Promotions During Peak Hours

Since sales peak during the mid-morning to afternoon hours, it would be strategic to align marketing campaigns, targeted advertisements, and promotional offers during these times. Promotions like flash sales, limited-time offers, or high-visibility marketing efforts could be timed to coincide with these peak hours to maximize customer engagement and drive higher sales.

#### VI. Explore Opportunities for Evening or Off-Hour Engagement

Although sales drop after business hours, the late-night and early-morning periods still show some level of activity. To further capitalize on this, consider targeted campaigns or incentives that appeal to customers shopping outside traditional hours. This could include offering time-sensitive discounts for evening shoppers or enhancing the user experience for those browsing at off-hours, such as better customer service during late-night hours or special deals for night owls.

#### VII. Leverage Holiday Season Promotions

Capitalize on the observed sales spike during the end-of-year months like; September, October and November, by launching targeted marketing campaigns, holiday discounts, and bundled offers. Planning for sales events in these high-demand months can help boost revenue further.

#### VIII. Develop Post-Holiday Promotions

To combat the sales decline, create special offers or loyalty programs in the months following peak seasons. Offering discounts or rewards for repeat customers in December or January can help maintain sales momentum during traditionally slower months.

#### IX. Analyze Customer Segmentation

Look into the customer segments that are active during high-sales periods versus low-sales periods, and tailor marketing strategies to these segments to maintain engagement year-round.

#### X. Leverage Low-Cost Products to Boost Volume Sales

Use low-priced products as upselling opportunities. For example, bundle them with mid-priced items or offer them as add-ons during checkout to increase average order value (AOV). Highlight them in promotions or "Back to School" campaigns to attract price-sensitive customers.

  
  
