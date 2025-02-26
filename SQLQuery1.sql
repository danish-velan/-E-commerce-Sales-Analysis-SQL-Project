Use [Online Sales Dataset]


SELECT * FROM [dbo].[Online Sales Data];
Exec sp_rename 'Online Sales Data.Date','Transaction_Date','Column' 


--Counting total rows.
select COUNT(*) From [Online Sales Data];


--Listing all column names and their data types.
Select Column_name,DATA_TYPE from INFORMATION_SCHEMA.COLUMNS where Table_name = 'Online Sales Data';


--Rounding off decimal values by two points.
update [Online Sales Data]
set [Unit_Price] = Round([Unit_Price],2),
    [Total_Revenue] = Round([total_Revenue],2);


--Getting min and max for numerical columns like sales amount, quantity sold, etc.
select Top 1 Transaction_ID,Total_Revenue as Lowest_Revenue from [Online Sales Data] order by Total_Revenue asc;
select Top 1 Transaction_ID,Total_Revenue as Highest_Revenue from [Online Sales Data] order by Total_Revenue desc;


--Finding the best-selling products.
--1.Based on Quantity Sold (Most Units Sold)
Exec sp_rename 'Online Sales Data.Units_Sold','Quantity', 'column'; -- Renaming the column name for better readability
select Product_Name,sum(Quantity) as Total_Revenue from [Online Sales Data]
group by Product_Name
order by Total_Revenue desc;

--2.Based on Total Revenue
SELECT Product_Name, SUM(Total_Revenue) AS Total_Revenue_Generated
FROM [Online Sales Data]
GROUP BY Product_Name
ORDER BY Total_Revenue_Generated DESC;


--Identifing the region with the highest sales By Quantity.
Select top 1 Region,sum(Quantity) As Total_QTY_sold 
from [Online Sales Data] 
Group by Region
Order by Total_QTY_sold DESC;


--Identifying sales trends over time (monthly)
SELECT 
FORMAT(Transaction_Date, 'yyyy-MM') AS Month_Year,  -- Extracting Year-Month
SUM(Total_Revenue) AS Monthly_Revenue  -- Sum of revenue for each month
FROM [Online Sales Data]
GROUP BY FORMAT(Transaction_Date, 'yyyy-MM')
ORDER BY Month_Year;


--Which products are the top 5 by revenue..!
Select Top 5 Product_Name,Total_Revenue as Highest_Revenues
from [Online Sales Data]
order by Highest_Revenues desc;


--Which products have the Lowest revenue..!
Select Top 3 Product_Name,Total_Revenue as Lowest_Revenues
from [Online Sales Data]
order by Lowest_Revenues asc;


SELECT * FROM [dbo].[Online Sales Data];
--Which product category have Highest Revenue
select TOP 1 Product_Category,sum(Total_Revenue) as Best_Category 
from [Online Sales Data]
Group By Product_Category
order by Best_Category  Desc;

--Which regions consistently perform best?
select Top 2 Region as Best_sales_in,Sum(Total_Revenue) as Total_Revenues
from [Online Sales Data]
Group by Region
Order by Total_Revenues Desc;





