# capstone_project
This is a repository for my capstone project
# Title: Little Lemon Restaurant Database Management system
Subtitle: Design and implementation of Little Lemon DBMS
Author: Rukiyat Diekola
# Table of Contents
[Project Overview](#Project-Overview)
[System Design](#System-Design)
[Stored Procedures](#Stored-Prodecures)
[Views](#Views)
[Queries](#Queries)
[Data Visualization](#Data-Visualization)
[Conclusion](#Conclusion)

# Project Overview
This project is aimed at providing a functional database managament system in order to record their bookings, their customers, staffs and keep track of their daily sales. It also entails a visual representation their sales across the world. The data model and its script was designed using MySQL Workbench 8.0 CE and the data visualization was achieved uisng Tableau Public 2022.2

# System Design
- Entity-Relationship Diagram (ERD): The entities identified for the Little Lemon Database are Customers, Bookings, Orders, MenuItem, DeliveryStatus, and Staff. The relationship of these entities are also identified accordingly. [Click Here](LittleLemonDM.png) to view the Entity Relationship diagram designed for Little Lemon.

- Database Schema: The database schema include the overview of the relevant tables (customer, bookings, menuitem, deliverystattus, and staff table) and their structures which are the columns, data types, primary keys, foreign keys and constraint. These were shown in the Data Definition Language script generated using the Forward Engineer of the database model. [Click Here](littlelemonNewScript.sql) to view the DDL script.

- Normalization: Normalization was done to ensure database integrity and reduce dedundacy. This was achieved by ensuring that there are no repetitive data and  no partial dependancy relationships betweeen daa.

# Stored Procedures
in order to achieve a Recompiled execution, some stored procedures were created. This will help to save and reuse queries to improve running performance of the database. The Stored Procedures created for Little Lemon Restaurant are:


View my tableau visualization on tableau public (https://public.tableau.com/app/profile/rukiyat.diekola/vizzes)
