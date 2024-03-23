# Data-Exploration-in-PostgreSQL

## Introduction
In this project, I explored a Supermart Store's sales data to find useful insights like top selling products and state that generates the highest profit by analyzing records in the Customer, Product, and Sales Table.

## Installation
To install PostgreSQL, you can follow these steps:

1. Visit the official PostgreSQL website at [www.postgresql.org](https://www.postgresql.org/).
2. Navigate to the "Downloads" section.
3. Choose the appropriate version of PostgreSQL for your operating system (Windows, macOS, or Linux).
4. Click on the download link for your operating system.
5. Once the download is complete, run the installer and follow the on-screen instructions.
6. During the installation process, you may be prompted to choose a location for the installation and set a password for the default database user (usually called "postgres").
7. After the installation is complete, you can start using PostgreSQL by opening the command prompt or terminal and typing "psql" to access the PostgreSQL command-line interface.

## Data Source
In this project, I worked with three(3) different datasets;
The customer data which contains information about the customer like, customer name, customer id, age, city, e.t.c. The customer data can be found [here](https://github.com/Nelly2i/Data-Exploration-in-PostgreSQL/blob/main/Customer.csv)

The product data which contains information about the store's product like product name and product id. The product data can be found [here](https://github.com/Nelly2i/Data-Exploration-in-PostgreSQL/blob/main/Product.csv)

The sales data which contains information about the orders each customer made like customer id, product id, order id, and sales value. The sales data can be found [here](https://github.com/Nelly2i/Data-Exploration-in-PostgreSQL/blob/main/Sales.csv)

## Data Exploration
When it comes to data exploration, there are several steps you can follow:

1. Data Understanding: I started by making myself familiar with the data by looking at the structure, format, and types of variables present.

2. Data Cleaning: I cleaned the data by handling missing values, outliers, and inconsistencies. This ensures that my analysis is based on reliable and accurate data.

3. Exploratory Data Analysis (EDA): I conducted exploratory analysis by examining relationships, distributions, and trends in the data. This can involve using statistical techniques, creating subsets, or applying filters to explore specific aspects of the data.

4. Feature Engineering: I transformed and created new variables based on the existing data to improve the predictive power of my analysis. This can involve techniques like joining tables and grouping by variables.

5. Iterative Process: Data exploration is often an iterative process, so I had to go back and forth between steps to refine my analysis and gained deeper insights.

## Results
After exploring the data, these are some of the questions I answered;

-Maximun and minimum sales value

-Monthy sales of some sub-categories

-I picked 5 lucky customers after winning a lottery

For more in-depth analysis, you can visit the postgresql query [here](https://github.com/Nelly2i/Data-Exploration-in-PostgreSQL/blob/main/Supermart%20Store%20Query.sql)

## Conclusion
After exploring the data in PostgreSQL, I've discovered some interesting insights. There were clear patterns and relationships among the variables, which helped me gain a deeper understanding of the dataset. By analyzing the data, I was able to identify key trends and drew meaningful conclusions. These findings provide valuable insights that can be used to make informed decisions and drive further analysis. Overall, the data exploration project in PostgreSQL was a success, and I'm excited about the valuable information I uncovered.

For the postgresql code I used fot the project, you can find it here [supermart_query](https://github.com/Nelly2i/Data-Exploration-in-PostgreSQL/blob/main/Supermart%20Store%20Query.sql)
