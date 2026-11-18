# SQL Sales Analysis

## Overview

This project focuses on practicing SQL Server through a relational database designed to manage and analyze Pokémon card sales.

The goal is to strengthen SQL skills through practical exercises involving database design, table relationships, data retrieval, aggregations, subqueries, and analytical queries.

## Database Structure

The database contains three main tables:

- **Productos:** Stores Pokémon card information, including Pokémon name, collection, and card number.
- **Plataformas:** Stores the sales platforms.
- **Ventas:** Stores sales transactions, including product, platform, date, price, and quantity.

### Relationships

- One product can have multiple sales.
- One platform can have multiple sales.
- Each sale belongs to one product and one platform.

## Technologies

- Microsoft SQL Server
- SQL (T-SQL)
- SQL Server Management Studio (SSMS)

## Topics Covered

- Database creation and relational modeling.
- Primary Keys and Foreign Keys.
- INNER JOIN and LEFT JOIN.
- GROUP BY and aggregate functions.
- HAVING clauses.
- NULL handling.
- Scalar and multi-row subqueries.
- Common Table Expressions (CTEs).
- Duplicate record identification.
- Query debugging and error detection.
- Sales analysis and revenue calculations.

## Project Structure

```text
sales_analysis/
│
├── setup.sql
├── queries.sql
└── README.md
```

- `setup.sql`: Database tables, constraints, and sample data.
- `queries.sql`: SQL exercises and analytical queries.
- `README.md`: Project documentation.

## Progress

**Status: In Progress**

Completed:

- Relational database design.
- Table creation and relationships.
- Sample data insertion.
- JOIN operations.
- GROUP BY and aggregate functions.
- HAVING clauses.
- Subqueries.
- Common Table Expressions (CTEs).
- NULL handling.
- Duplicate record identification.
- Query debugging and error detection.

## Purpose

This project is part of my continuous learning process to strengthen my SQL skills and develop practical experience in database management, backend development, and data analysis.