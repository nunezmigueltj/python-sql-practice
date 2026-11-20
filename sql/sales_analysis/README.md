# SQL Server - Sales Analysis

## Overview

This project implements a relational database using Microsoft SQL Server to manage and analyze Pokémon card sales.

It focuses on relational database design, data retrieval, complex SQL queries, data aggregation, and analytical operations to extract meaningful business insights from sales data.

## Database Structure

The database consists of three main tables:

- **Productos:** Stores product information, including Pokémon name, collection, and card number.
- **Plataformas:** Stores sales platform information.
- **Ventas:** Stores sales transactions, including product, platform, date, price, and quantity.

### Relationships

- One product can have multiple sales.
- One platform can have multiple sales.
- Each sale belongs to one product and one platform.

## Technologies

- Microsoft SQL Server
- SQL (T-SQL)
- SQL Server Management Studio (SSMS)

## Technical Implementation

The project covers the following areas:

- Relational database design and modeling.
- Primary Keys and Foreign Keys.
- INNER JOIN and LEFT JOIN operations.
- GROUP BY and aggregate functions.
- HAVING clauses.
- NULL handling and data validation.
- Scalar and multi-row subqueries.
- Common Table Expressions (CTEs).
- Duplicate record identification.
- Query debugging and error detection.
- Revenue calculations and sales analysis.

## Project Structure

```text
sales_analysis/
│
├── setup.sql
├── queries.sql
└── README.md
```

- `setup.sql`: Database creation, table definitions, constraints, and sample data.
- `queries.sql`: SQL queries covering data retrieval, relationships, aggregations, and analytical operations.
- `README.md`: Project documentation.

## Project Status

**Status: In Progress**

Currently implemented:

- Relational database structure.
- Table creation and relationships.
- Sample data insertion.
- JOIN operations.
- Data aggregation and grouping.
- Filtering aggregated results with HAVING.
- Subqueries and CTEs.
- Duplicate record detection.
- Sales and revenue analysis.

## Purpose

This project demonstrates practical SQL Server capabilities through relational database modeling and data analysis scenarios.

It also serves as a foundation for further work involving database development, backend systems, and data analytics.