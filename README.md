# BikeStores-Dashboard

## Table of Content

- [Project Overview](#project-overview)
- [Datasources](#datasources)
- [Tools](#tools)
- [Querying desired data in SQL](#querying-desired-data-in-sql)
- [Excel Process](#excel-process)
- [Tableau Dashbaord](#tableau-dashbaord)
- [Conclusion](#conclusion)

### Project Overview
This project aims to create an interactive dashbaord to display year over year sales data for a hypothetical bike company, BikeStores. By querying the desired data from the compaies database a comprehensive sales dashbaord was created to provide managment with insight into the main revenue drivers.

### Datasource

Sales Data: Primary datasource used for this project was downloaded from the internet and loaded into SQL Managment Studios. 

### Tools

- SQL - Querying necessary data for dashboard
- Excel - Data cleaning and pivots for understanding what was needed for final dashboard
- Tableau - Creating Executive Dashboard. Link to final dashboard [https://public.tableau.com/app/profile/diego.perez1990/viz/BikeStoresDashboard_17395633944690/Dashboard1?publish=yes]

### Querying desired data in SQL

1. Loaded datasset to newly created folder for this project in SQL Managment Studios
   
    i. Dataset consits of multiple tables with customer, product and sales information.

2. SQL code used to retrived 2016-2018 sales data. Includes customer information, product purchased and sales rep
   
SELECT
   
	ord.order_id,
	concat(cus.first_name,' ',cus.last_name) as 'Customers Name', 
    cus.city,	 
    cus.state,	
    ord.order_date,	
    sum(ite.quantity) as 'total units',
    sum(ite.quantity * ite.list_price) AS 'revenue',
    prod.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name,' ',sta.last_name) AS 'Sales_Rep'
    
  FROM sales.orders as ord
  
    JOIN sales.customers as cus 
    ON ord.customer_id = cus.customer_id
    JOIN sales.order_items as ite
    ON ord.order_id = ite.order_id
    JOIN production.products as prod
    ON ite.product_id = prod.product_id
    JOIN production.categories as cat
    ON prod.category_id = cat.category_id
    JOIN sales.stores as sto
    ON ord.store_id = sto.store_id
    JOIN sales.staffs as sta
    ON ord.staff_id = sta.staff_id

    GROUP BY
    -- numeric functions to determine revenue, therfore need aggregate field
    	ord.order_id,
    	concat(cus.first_name,' ',cus.last_name), 
    	cus.city,
    	cus.state,
    	ord.order_date,
    	prod.product_name,
    	cat.category_name,
    	sto.store_name,
    	CONCAT(sta.first_name,' ',sta.last_name)

  3. Exported  results to Excel to begin datacleaning susing a connection between the workbook and database. Any changes in the database will automatically be reflected in the workbook.
     - In Excel -> Data -> Get Data from Database. This links the query to the Excel workbook
    
### Excel Process

1. Over four thousand rows were loaded, the easiest way to clean up the data was by pivoting the query.

   - Mismatching customer address were updated
   - Misspelled words were corrected
   - Incorrect quantities inputted in databse were corrected.
  
2. Once data was cleaned up and ready for use began creating inital dashbaord in Excel. This allows me to have a vision in mind for what the final product should look like.
   
3. Created graphs by pivoting different the data in different ways to get all the aspects I wanted in the final dashbaord.

4. Once all the graphs were created, a slcier connection was used to filter all the graphs by year, state or store.
    i . [https://docs.google.com/spreadsheets/d/1tE-ncn2yvuW4yr_B9WaiLRcZ_oCRTQuO/edit?gid=1503385792#gid=1503385792_]
   
   _Google drive will not display pivots or slicer created in Excel, but this gives a visual of the idea I had in mind_


### Tableau Dashbaord

1. Imported the Query from Excel to Tableau.
   
2. Built 7 different workbooks to slice up where the revenue was coming from.
   
   	-  Revenue Per Year
   	-  Revenue Per Month
   	-  Revenue Per State
   	-  Revenue By Store
   	-  Revenue By Category
   	-  Top Customers
   	-  Revenue by Sales Rep
  
3. Created 3 "banner" worksheet to display a general overview of the companies performance over the years using serveral key meterics as a guage.
  
 4. Finally dahsboard was created with the ability to filter by year and state to give managment the flexability to display the data however they desired.


### Conclusion 

This project consited of working through the data analysis process to answer the business need. I was asked to provide a snapshot of the companies financials over the span of three years. Using the data analysis proces of

1. Understanding the problem (no visbaility into revenue drivers)

2. Collect and gather data (qurying desire data from companies databse)

3. Clean the data
   
4. Gather and analyze/visualize the data
   
5. Interpret the resutls (create interacgive dashboard to management to make more accurate decisons going forward)

I helped managment make more infomrmed decisons mnoving forward. 


   	



