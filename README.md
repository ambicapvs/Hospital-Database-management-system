# Exploring Hospital Data Through SQL
MySQL/ERD(Entity-Relation Diagram/Business Rules/Powerpoint/
# Overview
This project demonstrates the design and implementation of a Hospital Management Database using MySQL. It showcases real-world business problem-solving through advanced SQL queries, making it a practical example of data analysis and database management skills.

# Tools Used

- MySQL

# SQL Concepts Showcased

JOINs 
Aggregations & GROUP BY
CTEs (Common Table Expressions)
Window Functions (DENSE_RANK)
CONCAT & String Functions

# Database Schema

The database consists of the following tables:

Patient – Patient demographics and insurance info
Address – Patient address details
Doctor – Doctor details and department assignments
Nurse – Nurse details and department assignments
Visitor – Patient visitor logs
Disease – Disease treatments and prescriptions
Room – Patient room assignments

The relations between the tables as shown in the ERD diagram 

# Business Questions Answered

Which patients have insurance and what are their assigned doctors?
List all patients with their room number and building location.
HOw many patients are assigned for each doctor?
How many patients are assigned per department?
Which diseases are most commonly treated, and by which doctor?
How many visitors did each patient receive?
Which patients have both a doctor and a nurse in the same department?
Rank doctors by number of patients assigned using a window function.
Using a CTE, identify patients with no recorded room assignment.


