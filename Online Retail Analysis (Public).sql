--- Sales and Revenue Analysis

--- 1. What are the total sales and revenue by each product (StockCode)
---    And which product generates the highest revenue? 

USE Retail

SELECT 
    StockCode,
	Product_Description,
    SUM(Quantity) AS Total_Sales,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM 
    onlineretail
WHERE
    StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]' 
	AND Product_Description IS NOT NULL
	AND Quantity > 0
	AND UnitPrice > 0
GROUP BY 
    StockCode, Product_Description
ORDER BY 
    Total_Revenue DESC;


--- 2. What is the total revenue generated per invoice?

WITH TR AS(
SELECT 
    InvoiceNo,
	SUM(Quantity) Total_Quantity,
	ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue
FROM 
    onlineretail
GROUP BY
    InvoiceNo
)
SELECT
    InvoiceNo,
    Total_Quantity,
    Total_Revenue
FROM TR
WHERE
     InvoiceNo IS NOT NULL
	 AND Total_Quantity > 0
	 AND Total_Revenue > 0
ORDER BY
    Total_Revenue DESC


--- 3. Which are the top-selling products by quantity?

SELECT TOP 5 
       StockCode,
	   Product_Description,
       SUM(Quantity) AS Total_Quantity
FROM 
       onlineretail
WHERE Product_Description IS NOT NULL
      AND Product_Description <> '?'
	  AND StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]'
	  AND Quantity > 0
GROUP BY
      StockCode,
	  Product_Description
ORDER BY
       Total_Quantity DESC
	   
	   
	   
--- Customer Behavior Segmentation
--- 4. How many unique customers are there?

SELECT 
    COUNT 
    (DISTINCT CustomerID) AS UniqueCustomers
FROM 
    onlineretail

--- Customer distribution by country

-- Total unique customers
WITH TotalUniqueCustomers AS (
    SELECT COUNT(DISTINCT CustomerID) AS UniqueCustomers
    FROM onlineretail
)

-- Customer distribution by country with percentage
SELECT 
    Country, 
    COUNT(DISTINCT CustomerID) AS Customer_Distribution,
    ROUND((COUNT(DISTINCT CustomerID) * 100.0 / (SELECT UniqueCustomers FROM TotalUniqueCustomers)), 2) AS Percentage_Distribution
FROM 
    onlineretail
WHERE 
    CustomerID IS NOT NULL
GROUP BY
    Country
ORDER BY
    Customer_Distribution DESC;


--- 5. What is the total spending per customer?

SELECT 
    CustomerID,
	COUNT(InvoiceNo) AS Total_Transactions,
	ROUND(AVG(Quantity * UnitPrice), 2) AS Avg_Spending,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Spending
FROM 
    onlineretail
WHERE
    CustomerID IS NOT NULL
GROUP BY
    CustomerID
HAVING
    ROUND(SUM(Quantity * UnitPrice), 2) > 0
ORDER BY
    Total_Spending  


--- 6. Which customers are the top buyers in terms of quantity and revenue?

SELECT TOP 10
    CustomerID,
    SUM(Quantity) AS Total_Quantity,
    ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue_Generated
FROM
    onlineretail
WHERE
    CustomerID IS NOT NULL
GROUP BY
    CustomerID
ORDER BY
    Total_Quantity DESC


--- 7. How many products does each customer typically purchase per transaction?

WITH CustomerTransaction AS
     (
	  SELECT 
	      CustomerID,
		  InvoiceNo,
		  SUM(Quantity) AS Total_Items
	  FROM 
	      onlineretail
	  GROUP BY
	      CustomerID,
		  InvoiceNo
	 )
SELECT 
    InvoiceNo,
    CustomerID,
	ROUND(SUM(Total_Items),2) AS Total_Items_Per_Transaction
FROM
    CustomerTransaction
WHERE 
    InvoiceNo IS NOT NULL
	AND CustomerID IS NOT NULL
GROUP BY
    InvoiceNo,
    CustomerID
ORDER BY
    Total_Items_Per_Transaction DESC



--- Time-based Analysis
--- 8. What are the peak hours for sales based on InvoiceDate?

SELECT 
    DATEPART(HOUR, InvoiceDate) AS SaleHour,
    COUNT(*) AS TotalSales
FROM 
    onlineretail
GROUP BY 
    DATEPART(HOUR, InvoiceDate)
ORDER BY 
    SaleHour


--- 9. How does sales volume vary by day of the week or month?

SELECT
    YEAR(InvoiceDate) AS Year_,
    DATENAME(MONTH, InvoiceDate) AS Month_Name,
    COUNT(DISTINCT InvoiceNo) AS Total_Invoice,
    SUM(Quantity) AS Total_Quantity
FROM 
    onlineretail                                                      
GROUP BY 
    YEAR(InvoiceDate),
    DATENAME(MONTH, InvoiceDate),
	MONTH(InvoiceDate)
ORDER BY 
    --MONTH(InvoiceDate),
    Total_Quantity DESC;                                       ---------- Monthly sales by quantity
 

SELECT 
    DATEPART(WEEKDAY, InvoiceDate) AS Week_Day,
    DATENAME(WEEKDAY, InvoiceDate) AS Week_Name,
	COUNT(DISTINCT InvoiceNo) AS Total_Invoice,
    SUM(Quantity) AS Total_Quantity
FROM 
    onlineretail                                              
GROUP BY 
    DATENAME(WEEKDAY, InvoiceDate), 
	DATEPART(WEEKDAY, InvoiceDate) 
ORDER BY 
    Total_Quantity DESC                                        ---------- Sales by Day of the week


--- 10. What is the average time between repeat purchases for each customer?

WITH PurchaseDates AS (
     --- Ranking each purchase date per customer
SELECT 
    CustomerID,
    InvoiceDate,
    ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY InvoiceDate) AS PurchaseRank
FROM 
    onlineretail
GROUP BY 
    CustomerID, InvoiceDate
),
    PurchaseIntervals AS (
     --- Joining each purchase with the previous purchase to calculate the interval in days
    SELECT 
        a.CustomerID,
        DATEDIFF(DAY, b.InvoiceDate, a.InvoiceDate) AS DaysBetweenPurchases
    FROM 
        PurchaseDates a
    JOIN 
        PurchaseDates b ON a.CustomerID = b.CustomerID 
                        AND a.PurchaseRank = b.PurchaseRank + 1
),
     --- Calculating the average time between purchases for each customer
CustomerPurchaseFrequency AS
(
SELECT 
    CustomerID,
    AVG(DaysBetweenPurchases) AS AvgDaysBetweenPurchases,
	CASE 
        WHEN AVG(DaysBetweenPurchases) BETWEEN 0 AND 30 THEN 'High-Frequency Purchaser'
        WHEN AVG(DaysBetweenPurchases) BETWEEN 31 AND 180 THEN 'Moderate-Frequency Purchaser'
        WHEN AVG(DaysBetweenPurchases) BETWEEN 181 AND 366 THEN 'Low-Frequency Purchaser'
        ELSE 'Uncategorized'
    END AS PurchaseFrequencyCategory
FROM 
    PurchaseIntervals
GROUP BY 
    CustomerID
)
     --- Counting the distribution of customers by purchase frequency category
SELECT 
    PurchaseFrequencyCategory,
    COUNT(CustomerID) AS CustomerCount
FROM 
    CustomerPurchaseFrequency
GROUP BY 
    PurchaseFrequencyCategory
ORDER BY 
    CustomerCount DESC;
	



--- Geographical Analysis
--- 11. What is the distribution of revenue by country?

SELECT
    Country,
	ROUND(SUM(Quantity * UnitPrice), 2) AS Revenue_Generated,
	ROUND(SUM(Quantity * UnitPrice) / (SELECT SUM(Quantity * UnitPrice) FROM onlineretail) * 100, 2) AS Revenue_Percentage
FROM
    onlineretail
GROUP BY
    Country
ORDER BY
    Revenue_Percentage DESC


--- 12. Which country has the highest average order value?

SELECT TOP 1
    Country,
	ROUND(SUM(Quantity * UnitPrice)/ COUNT(DISTINCT InvoiceNo),2) AS Average_Order_Value
FROM
    onlineretail
GROUP BY
    Country
ORDER BY
    Average_Order_Value DESC


--- 13. Are there products that are popular in specific countries?
------- Let's find out the products that are popular in specific countries by Quantity and Revenue

BEGIN TRANSACTION;

EXEC sp_rename 'Retail..onlineretail.Description', 'Product_Description', 'COLUMN'; ---- Renamed "Description" column to avoid function errors

COMMIT TRANSACTION;

------- Most popular product by Quantity in each Country

WITH CountryTopProduct AS (
    SELECT 
        Country,
        StockCode,
        Product_Description,
        SUM(Quantity) AS Total_Quantity,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Quantity) DESC) AS RankInCountry
    FROM 
        onlineretail
    GROUP BY 
        Country, StockCode, Product_Description
)
SELECT 
    Country,
    StockCode,
    Product_Description,
    Total_Quantity
FROM 
    CountryTopProduct
WHERE
    StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]'   -- Filtering for StockCodes that start and end with a digit between 1 and 9
    AND RankInCountry = 1
ORDER BY
    Total_Quantity DESC
    

------- Most popular product by Revenue in each Country

WITH CountryTopProduct AS (
    SELECT 
        Country,
        StockCode,
        Product_Description,
        ROUND(SUM(Quantity * UnitPrice), 2) AS Total_Revenue,
        ROW_NUMBER() OVER (PARTITION BY Country ORDER BY SUM(Quantity) DESC) AS RankInCountry
    FROM 
        onlineretail
    GROUP BY 
        Country, StockCode, Product_Description
)
SELECT 
    Country,
    StockCode,
    Product_Description,
    Total_Revenue
FROM 
    CountryTopProduct
WHERE
    StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]'
    AND RankInCountry = 1
ORDER BY 
    Total_Revenue DESC



--- Inventory and Product Insights
--- 14. What is the average unit price per product?

SELECT  
    StockCode,
	Product_Description,
	ROUND(AVG(UnitPrice), 2) AS Avg_Price_Per_Product
FROM
    onlineretail
WHERE
    StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]' 
	AND Product_Description IS NOT NULL
	AND UnitPrice > 0                                    --------- ignoring products that were faulty (or recorded with a unit price of zero), and only calculating the average price for products with a valid price.
GROUP BY 
    StockCode,
	Product_Description
ORDER BY
    Avg_Price_Per_Product DESC


--- 15. Which products have the highest quantity sold per transaction?

WITH ProductTransaction AS
     (
	  SELECT 
	      InvoiceNo,
		  StockCode,
		  Product_Description,
		  SUM(Quantity) AS Total_Quantity_Per_Transaction
	  FROM 
	      onlineretail
	  GROUP BY
	      InvoiceNo,
		  StockCode,
		  Product_Description
	 )
SELECT TOP 10
    InvoiceNo,
	StockCode,
	Product_Description,
    Total_Quantity_Per_Transaction  
FROM
    ProductTransaction
WHERE
    InvoiceNo IS NOT NULL
    AND StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]' 
    AND Product_Description IS NOT NULL
    AND Product_Description <> '?'
	AND StockCode <> 23343 
ORDER BY
    Total_Quantity_Per_Transaction DESC


--- 16. How often does each product appear in invoices?

SELECT TOP 10
    StockCode,
	Product_Description,
	COUNT(DISTINCT InvoiceNo) AS Invoice_Count
FROM
    onlineretail
WHERE
    StockCode LIKE '[1-9]%'AND StockCode LIKE '%[1-9]' 
	AND Product_Description IS NOT NULL
	AND InvoiceNo IS NOT NULL 
	AND InvoiceNo <> '' 
GROUP BY
    StockCode,
	Product_Description
ORDER BY
    Invoice_Count DESC



	




