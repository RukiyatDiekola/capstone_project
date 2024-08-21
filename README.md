# capstone_project
This is a repository for my capstone project
# Title: Little Lemon Restaurant Database Management system
Subtitle: Design and implementation of Little Lemon DBMS
Author: Rukiyat Diekola
# Table of Contents
- [Project Overview](#Project-Overview)
- [System Design](#System-Design)
- [Stored Procedures](#Stored-Prodecures)
- [Views](#Views)
- [Join](#Join)
- [Python-Database Client](#Python-Database-Client)
- [Data Visualization](#Data-Visualization)
- [Conclusion](#Conclusion)

# Project Overview
This project is aimed at providing a functional database managament system in order to record their bookings, their customers, staffs and keep track of their daily sales. It also entails a visual representation their sales across the world. The data model and its script was designed using MySQL Workbench 8.0 CE and the data visualization was achieved uisng Tableau Public 2022.2

# System Design
- Entity-Relationship Diagram (ERD): The entities identified for the Little Lemon Database are Customers, Bookings, Orders, MenuItem, DeliveryStatus, and Staff. The relationship of these entities are also identified accordingly. [Click Here](LittleLemonDM.png) to view the Entity Relationship diagram designed for Little Lemon.

- Database Schema: The database schema include the overview of the relevant tables (customer, bookings, menuitem, deliverystattus, and staff table) and their structures which are the columns, data types, primary keys, foreign keys and constraint. These were shown in the Data Definition Language script generated using the Forward Engineer of the database model. [Click Here](littlelemonNewScript.sql) to view the DDL script.

- Normalization: Normalization was done to ensure database integrity and reduce dedundacy. This was achieved by ensuring that there are no repetitive data and  no partial dependancy relationships betweeen daa.

# Stored Procedures
In order to achieve a Recompiled execution, some stored procedures were created. This will help to save and reuse queries to improve running performance of the database. The Stored Procedures created for Little Lemon Restaurant are:
- [Add Booking](Little%20Lemon%20AddBooking.PNG)
- [Add Valid Booking](Little%20Lemon%20AddValidBooking.PNG)
- [Cancel Booking](Little%20Lemon%20CancelBooking.PNG)
- [Cancel Order](Little%20Lemon%20CancelOrder.PNG)
- [Check Bookings](Little%20Lemon%20CheckBooking.PNG)
- [Get Maximum Quantity](Little%20Lemon%20GetMaxQuantity)
- [Update Booking](Little%20Lemon%20UpdateBooking)

# Views
Similar to stored procedures, Views are created inorder to reuse queries. This helps in maintaining queries, enhancing database security and data integrity. A Orderview was created for little lemon to retrive information about the OrderID, Quantity and TotalCost. See [Here](Little%20Lemon%20OrdersView.png)

# Join
Tables were joined to retrieve information of the customer details, items purchased, and the total cost, joining them on the bookingID. The Join created is shown [here](Little%20Lemon%20join%20table2.PNG)

# Python-Database Client
A booking system was created using Jupiter Notebook. See [here](Little%20Lemon%20DB%20PY.ipynb) for details

# Data Visualization
View my data visualization on tableau public [HERE](https://public.tableau.com/app/profile/rukiyat.diekola/vizzes)

# Conclusion
A database management system has been craeted for Little Lemon Restaurant. This allows them to store information on customer orders and bookings as well as staff while maintaining data integrity and security. The database will also allow to retrieve information as needed, use stored procedures, Views and join table. The booking system has also been craeted using Jupyter notebook. Bar charts, maps, and pie chart has also been craeted for visualization of sales records of Little Lemon Restaurant.



