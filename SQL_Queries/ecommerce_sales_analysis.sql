CREATE DATABASE ecommerce_analysis;
USE ecommerce_analysis;
CREATE TABLE ecommerce_sales (
    Order_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Order_Date DATE,
    Region VARCHAR(50),
    State VARCHAR(50),
    City VARCHAR(50),
    Category VARCHAR(50),
    Product_Name VARCHAR(100),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount_Percentage DECIMAL(5,2),
    Sales DECIMAL(10,2),
    Cost DECIMAL(10,2),
    Profit DECIMAL(10,2),
    Profit_Margin_Percentage DECIMAL(5,2),
    Payment_Method VARCHAR(50),
    Shipping_Mode VARCHAR(50),
    Delivery_Status VARCHAR(50),
    Customer_Segment VARCHAR(50)
);
SELECT COUNT(*) AS Total_Rows
FROM ecommerce_sales;
SELECT *
FROM ecommerce_sales
LIMIT 10;
SELECT ROUND(SUM(Sales),2) AS Total_Sales
FROM ecommerce_sales;
SELECT ROUND(SUM(Profit),2) AS Total_Profit
FROM ecommerce_sales;
SELECT 
    Category,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM ecommerce_sales
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT Region,
    ROUND(SUM(Sales),2) AS Regional_Sales
FROM ecommerce_sales
GROUP BY Region
ORDER BY Regional_Sales DESC;
SELECT Payment_Method,
    COUNT(Order_ID) AS Total_Orders
FROM ecommerce_sales
GROUP BY Payment_Method
ORDER BY Total_Orders DESC;
SELECT Customer_Segment,
    ROUND(SUM(Sales),2) AS Total_Sales,
    ROUND(SUM(Profit),2) AS Total_Profit
FROM ecommerce_sales
GROUP BY Customer_Segment
ORDER BY Total_Sales DESC;
SELECT MONTHNAME(Order_Date) AS Month,
    ROUND(SUM(Sales),2) AS Monthly_Sales
FROM ecommerce_sales
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);
SELECT Product_Name,
    ROUND(SUM(Sales),2) AS Total_Sales
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY Total_Sales DESC
LIMIT 10;
SELECT Delivery_Status,
COUNT(*) AS Total_Orders
FROM ecommerce_sales
GROUP BY Delivery_Status;
SELECT Product_Name,
ROUND(SUM(Profit),2) AS Total_Profit
FROM ecommerce_sales
GROUP BY Product_Name
ORDER BY Total_Profit DESC
LIMIT 10;