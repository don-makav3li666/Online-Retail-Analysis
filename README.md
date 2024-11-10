# Online-Retail-Analysis

![1-c829b1d8](https://github.com/user-attachments/assets/3eb68d82-1bf5-499b-b755-286182b2b7b2)


1. INTRODUCTION

Purpose: The purpose of this analysis is to gain insights into sales performance, customer purchasing behaviors, and revenue trends for strategic decision-making. By examining key metrics such as product sales, revenue by transaction, customer spend, and geographic distribution, this report aims to provide actionable recommendations to enhance revenue growth and customer engagement.

Scope: This analysis covers transactional data, focusing on product sales, customer behavior, sales trends by time, and geographic insights. The dataset contains transactional information including product details, quantities sold, unit prices, customer identifiers, and purchase locations. These transactions occur between 01/12/2010 and 09/12/2011 for a UK-based and registered non-store online retail.


2. DATASET OVERVIEW

Source: The dataset is sourced from an online retail transactional database; UC Irvine Machine Learning Repository

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

Filtered out transactions with negative or zero quantities/unit price to focus on valid purchases

Filtered out rows with incosistent values in StockCodes such that focus was on only codes with 5-digits

Analytical Approach:

Aggregated sales and revenue data by product, customer, country, and time.

Identified trends by examining weekday, monthly, and hourly patterns.

Segment analysis was conducted to reveal high-value customers and top-selling products.

