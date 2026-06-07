-- RETAIL SALES ANALYSIS PROJECT
-- AUTHOR: LALITA


-- DATA UNDERSTANDING QUERIES:

Select * from Retail_File;

Select Top 10 * from Retail_File;

Select Count(*) As Total_Rows
From Retail_File;

-- 1. KPI ANALYSIS:  

--TOTAL REVENUE, AVERAGE ORDER VALUE, TOTAL ORDERS:
Select 
    Sum(Total_Sale) AS Total_Revenue,
    Avg(Total_Sale) AS Avg_Order_Value,
    Count(Distinct InvoiceNo) AS Total_Orders
From retail_File;

    
--TOTAL CUSTOMER:
Select Count(Distinct CustomerID) As TotalCustomers
from Retail_File;


-- 2. PRODUCT ANALYSIS:

--TOP 10 PRODUCTS:
Select Top 10 
    Description, 
    Sum(Quantity) As TotalQty_Sold,
    Sum(Total_Sale) As TotalRevenue
from Retail_File
Group by Description
Order by TotalRevenue Desc;

--WORST SELLING PRODUCTS:
Select Top 10 
    Description, 
    Sum(Total_Sale) As TotalRevenue
from Retail_File
Group by Description
Order by TotalRevenue Asc;


-- 3. COUNTRY ANALYSIS:

--TOP COUNTRIES BY REVENUE:
Select 
    Country,
    Sum(Total_Sale) As TotalRevenue
from Retail_File
Group By Country
Order By TotalRevenue Desc;


-- 4. TIME-BASED ANALYSIS:

--MONTHLY REVENUE TREND:
Select 
    Year,
    Month,
    Sum(Total_sale) As Monthly_Sales
From Retail_File
Group by Month, Year
Order By  Year, Month;


--HOURLY SALES PATTERN:  
Select 
    Hour,
    Sum(Total_sale) As TotalRevenue
From Retail_File
Group by Hour
Order By Hour;

--DAY-WISE SALES:
Select 
    Day_Name,
    Sum(Total_sale) As TotalRevenue
From Retail_File
Group by Day_Name
Order By TotalRevenue Desc;


-- 5.  CUSTOMER ANALYSIS:

--TOP CUSTOMERS:
Select Top 10 
    CustomerID, 
    Sum(Total_Sale) As Total_Spent
From Retail_File
Group By CustomerID
Order by Total_Spent Desc;

--CUSTOMER FREQUENCY:
Select 
    CustomerID,
    Count(Distinct InvoiceNo) As Total_Orders
From Retail_File
Group By CustomerID
Order By Total_Orders Desc;


-- 6. BUSINESS INSIGHTS:

--REVENUE CONTRIBUTION %:
With CTE As (
    Select Country, Sum(Total_Sale) As TotalSale
from Retail_File
Group by Country)

Select 
    Country, 
    TotalSale * 100.0/ Sum(TotalSale) Over() 
    As Revenue_Percent
from CTE;



