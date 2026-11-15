# Bright_Coffee_Case_Study
case study demonstrating project planning, sql and excel skills
Bright Coffee Shop -- Sales Analysis
Project Overview
This project analyses historical sales data from a coffee shop to
identify revenue patterns, product performance and differences in store
performance. The analysis is framed around the needs of a new CEO who
wants to grow revenue and improve product performance.

The project follows an end-to-end data analysis workflow: planning, data
preparation, SQL analysis, Excel reporting and presentation of business
recommendations.
Business Objectives
The analysis aims to answer the following questions:
- How much revenue does the business generate?
- Which product categories, product types and individual products
  generate the most revenue?
- Which products and categories sell the most units?
- Which store locations generate the most revenue and sales volume?
- How do sales vary by date, month and day of the week?
- At what hours does the business generate the most revenue and
  transactions?
- What is the average transaction value and average number of units
  per transaction?
The findings will be used to develop practical recommendations for
improving sales performance.
Dataset
The project uses the Bright Coffee Shop sales dataset supplied for the
case study.

The dataset contains transaction-level sales records and includes the
following fields:
  Column                              Description / analytical use
  transaction_id                    Identifies a transaction; used to
count distinct transactions

  transaction_date                  Date of the transaction; used for
daily, monthly and weekday analysis

  transaction_time                  Time of the transaction; used for
hourly analysis

  transaction_qty                   Number of units purchased

  store_id                          Store identifier

  store_location                    Store location; used to compare
stores

  product_id                        Product identifier

  unit_price                        Price per unit

  product_category                  Product category

  product_type                      Product type within a category
product_detail                    Individual product description
The dataset should be checked for missing values, invalid values,
inconsistent formats and potential duplicates before analysis. Repeated
transaction_id values should not automatically be treated as errors: a
transaction may contain multiple product line items.
Tools
- Miro -- data flow and project planning
- Databricks SQL -- data inspection, preparation and analysis
- Excel -- PivotTables, charts and dashboard
- PowerPoint or Canva -- presentation of findings and
  recommendations
- GitHub -- project documentation and submission
Project Workflow
1. Planning and Architecture
- Map the movement of data from the source CSV through Databricks to
  Excel and the final presentation.
- Define the business questions and analytical requirements.
- Identify the calculations and transformations required.
- Create a project Gantt chart.
2. Data Preparation
- Prepare the source data in CSV format.
- Load the dataset into Databricks.
- Inspect the table structure and data types.
- Check completeness, consistency, validity and potential duplicates.
- Ensure unit_price is stored as a numeric value. The source data
  may contain comma decimal separators, which need to be handled
  correctly.
3. SQL Analysis
Calculate revenue at transaction-line level:
unit_price * transaction_qty AS total_amount
Use SQL to investigate:
- Total revenue and total units sold
- Revenue by product category, product type and product detail
- Units sold by product and category
- Revenue and sales volume by store location
- Revenue by month and weekday
- Revenue and transaction counts by hour
- Average transaction value
- Average units per transaction
- Highest- and lowest-performing products
For transaction counts, use COUNT(DISTINCT transaction_id) where the
intention is to count purchases rather than individual product rows.
4. Excel Dashboard
Export a cleaned, detailed dataset from Databricks, including the
calculated total_amount field.

Use the detailed dataset as the source for Excel PivotTables and
dashboard visuals. Potential dashboard components include:
- KPI cards for total revenue, units sold, transaction count and
  average transaction value
- Revenue by product category
- Top products by revenue and quantity sold
- Revenue by store location
- Monthly and weekday revenue trends
- Revenue and transaction counts by hour
The dashboard should make it easy to compare performance and identify
meaningful patterns.
5. Findings and Presentation
Prepare a methodology document explaining the data preparation and
analysis process.

Prepare a presentation for the CEO that includes:
- Business context and objectives
- Data and methodology
- Key findings supported by charts and metrics
- Actionable recommendations
- Suggested next steps
Recommendations should be based on the actual analysis results rather
than assumptions.
Key Calculations
  Metric                              Calculation
  Total revenue                       Sum of total_amount

  Revenue per product/category/store  Sum of total_amount grouped by
the relevant dimension

  Total units sold                    Sum of transaction_qty

  Total transactions                  Count of distinct transaction_id

  Average transaction value           Total revenue divided by distinct
transactions

  Average units per transaction       Total units sold divided by
distinct transactions
Average unit price                  Average of unit_price
Expected Deliverables
- Miro data flow / architecture diagram
- Miro business questions and analytical requirements
- Miro required calculations and project Gantt chart
- Cleaned and processed dataset
- SQL queries used for preparation and analysis
- Excel workbook containing PivotTables, charts and dashboard
- Methodology document
- CEO presentation with findings and recommendations
Project Status
This README describes the project scope and intended workflow. Update
the status of each stage as work is completed. Do not mark an analysis,
dashboard or recommendation as complete until it has been produced and
checked.
  Stage                               Status
  Planning and data flow diagram      In progress / update status

  Business questions and analytical   In progress / update status
requirements                        

  Required calculations               In progress / update status

  Data preparation and quality checks To be confirmed

  SQL analysis                        To be completed

  Excel PivotTables and dashboard     To be completed
Methodology and CEO presentation    To be completed
Notes
- Confirm the actual Databricks table name before running SQL
  examples.
- Validate data types and decimal formatting before calculating
  revenue.
- Use the detailed transaction-level dataset for Excel PivotTables
  rather than exporting only pre-aggregated query results.
- Check whether the Excel PivotTable uses the Data Model when a
  distinct count of transactions is required.
- Keep a record of assumptions, cleaning decisions and any limitations
  in the methodology document.
