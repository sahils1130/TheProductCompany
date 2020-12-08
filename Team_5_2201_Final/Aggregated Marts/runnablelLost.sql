##################LOST AGGREGATION ##########################
use lostaggregated;
select * from customer_dim;


use salesorder_5_test;
select * from customer;

use salesorder_5_before;
select * from customer;

use lostaggregated;
select * from customer_dim;

use lostaggregated;
select * from product_dim;

use lostaggregated;
select * from sales_fact_lost;

use salesorder_5_test;
select distinct customer_SK,Product_SK,Amount,Quantity from sales_fact;


#inserting data into customer lost dim
Insert into lostaggregated.customer_dim(Customer_SK, CustomerID_NK, Customer_Name, Customer_dept, Customer_suite,
Customer_address, Customer_city, Customer_state, Customer_zip, Customer_custTypeID, Customer_custTypeName,
Customer_division)
select Customer_SK, CustomerID_NK, Customer_Name, Customer_dept, Customer_suite,
Customer_address, Customer_city, Customer_state, Cutomer_zip, Customer_custtypeID, Customer_custtypeName,
Customer_division from salesorder_5_before.customer;


#inserting data into product lost dimension
Insert into lostaggregated.product_dim(Product_SK, ProductID_NK, Product_Name, Price1, Price2,
supplier_Name, supplier_Address, supplier_Attn,supplier_City,supplier_State,supplier_Zip, productTypeID, 
TypeDescription,BUID, Name, Abbreviation, Division,UnitCost)
select Product_SK, ProductID_NK, Product_Name, Price1, Price2,
supplier_Name, supplier_Address, supplier_Attn,supplier_City,supplier_State,supplier_Zip, productTypeID, 
TypeDescription,BUID, Name, Abbreviation, division,UnitCost from salesorder_5_before.product;

#insert into sales fact lost dim
Insert ignore into  lostaggregated.sales_fact_lost (Customer_SK, Product_SK, Ship_Cost, Amount, Quantity)
select Customer_SK, Product_SK, Ship_Cost, Amount, Quantity from salesorder_5_before.sales_fact
group by Customer_SK,Product_SK;

#QUERY1:
use lostaggregated;
select cust.customer_Name as 'Customer Name', p.typeDescription as 'Product Description',sum(fact.quantity) as 'Number of Products', sum(fact.Amount) as 'total amount'
from sales_fact_lost fact
inner join Customer_dim cust on cust.Customer_SK=fact.Customer_SK
inner join product_dim p on p.product_SK=fact.Product_SK
group by cust.Customer_Name
order by sum(fact.Amount) DESC limit 10;

#QUERY2:
select p.Product_Name as 'Product Name', sum(f.ship_Cost) as 'Shipping cost', sum(f.Amount) as 'Total sales'
from sales_fact_lost f
inner join product_dim p on p.product_SK=f.product_SK
group by p.product_Name
order by f.ship_Cost DESC limit 10;
#########################SHRUNKEN AGGREGATION############
USE shrunkenaggregaion;
select * from customer_dim;

USE shrunkenaggregaion;
select * from product_dim;

USE shrunkenaggregaion;
select * from salesDateShrunken_dim;

#inserting data into customer shrunken dim
Insert into shrunkenaggregaion.customer_dim(Customer_SK, CustomerID_NK, Customer_Name, Customer_dept, Customer_suite,
Customer_address, Customer_city, Customer_state, Customer_zip, Customer_custTypeID, Customer_custTypeName,
Customer_division)
select Customer_SK, CustomerID_NK, Customer_Name, Customer_dept, Customer_suite,
Customer_address, Customer_city, Customer_state, Cutomer_zip, Customer_custtypeID, Customer_custtypeName,
Customer_division from salesorder_5_before.customer;

#inserting data into product shrunken dimension
Insert into shrunkenaggregaion.product_dim(Product_SK, ProductID_NK, Product_Name, Price1, Price2,
supplier_Name, supplier_Address, supplier_Attn,supplier_City,supplier_State,supplier_Zip, productTypeID, 
TypeDescription,BUID, Name, Abbreviation, Division,UnitCost)
select Product_SK, ProductID_NK, Product_Name, Price1, Price2,
supplier_Name, supplier_Address, supplier_Attn,supplier_City,supplier_State,supplier_Zip, productTypeID, 
TypeDescription,BUID, Name, Abbreviation, division,UnitCost from salesorder_5_before.product;

#insert into sales shrunken  date dim
insert into shrunkenaggregaion.salesdateshrunken_dim(sales_Year,sales_Quarter,
sales_Month,sales_fiscal_Year,sales_fiscal_Quarter,sales_fiscal_Month)
select Sales_Year, Sales_Quarter, Sales_Month,Sales_Fiscal_Year, Sales_Fiscal_Quarter,
Sales_Fiscal_Month from salesorder_5_before.sales_date;

#insert into sales fact shrunken dim
Insert  into  shrunkenaggregaion.salesshrunken_fact (salesDateShrunken_sK, Customer_SK, Product_SK, MonthlyAmount, MonthlyQuantity, MonthlyShipCost)
select Customer_SK, Product_SK, Ship_Cost, Amount, Quantity from salesorder_5_before.sales_fact
group by Customer_SK,Product_SK;


##################COLLAPSED AGGREGATION########
USE COLLAPSEDAGGREGATE;
select * from collapsedyearly;


INSERT INTO collapsedyearly(salesYear,Division,CustomerName,Amount,Quantity)
select sales_Year, CASE when Customer_division="PEC"  then "PEC"
when Customer_division="TPCE" then "TPC EAST"
when Customer_division="TPCW" then "TPC WEST"
END as "DivisionName", Customer_Name, sum(Amount),sum(Quantity)
from salesorder_5_before.sales_fact f join salesorder_5_before.sales_date sd
using (sales_Date_SK) join salesorder_5_before.Customer c on f.Customer_SK=c.Customer_SK
group by sd.Sales_Year,c.Customer_Division,c.Customer_Name;

#Query 1:

SELECT *
FROM (
	SELECT Division
		,CustomerName
		,sum(Amount) `Total Sales` ,RANK() OVER (
			PARTITION BY Division ORDER BY sum(Amount) DESC
			) `Ranking`
	FROM collapsedyearly y
	GROUP BY Division
		,CustomerName
	) q1
WHERE Ranking <= 5;

#Query 2:
SELECT Q2.SalesYear
	,Division
	,YearlySales AS `Sales by Year`
	,YearlyDivSales AS `Yearly Sales as per Division`
	,format(100 * YearlyDivSales / YearlySales, 2) `Percentage OF Yearly Division Sales`
FROM (
	SELECT SalesYear
		,Division
		,sum(Amount) YearlyDivSales
	FROM collapsedyearly y
	GROUP BY SalesYear
		,Division
	) Q2
INNER JOIN (
	SELECT SalesYear
		,sum(Amount) YearlySales
	FROM collapsedyearly y
	GROUP BY SalesYear
	) Q3 ON Q2.SalesYear = Q3.SalesYear
ORDER BY 1





