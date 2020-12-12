SELECT pd.division, COUNT(*) 'No. of Orders from PEC not shipped within 10 days' 
FROM sales_fact tsf
JOIN product pd USING(Product_SK)
JOIN Sales_Date sd USING(Sales_Date_SK)
JOIN Order_Date od USING(Order_Date_SK)
WHERE 
pd.division = "PEC"
AND
DATEDIFF(sd.Sales_Date,Order_Date) >= 10;