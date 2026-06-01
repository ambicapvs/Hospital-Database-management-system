# Exploring Hospital Data Through SQL
MySQL/ERD(Entity-Relation Diagram/Business Rules/Powerpoint/
# Overview
This project demonstrates the design and implementation of a Hospital Management Database using MySQL. It showcases real-world business problem-solving through advanced SQL queries, making it a practical example of data analysis and database management skills.

# Tools Used

- MySQL

# SQL Concepts Showcased

- JOINs 
- Aggregations & GROUP BY
- CTEs (Common Table Expressions)
- Window Functions (DENSE_RANK)
- CONCAT & String Functions

# Database Schema

The database consists of the following tables:

1. Patient – Patient demographics and insurance info
2. Address – Patient address details
3. Doctor – Doctor details and department assignments
4. Nurse – Nurse details and department assignments
5. Visitor – Patient visitor logs
6. Disease – Disease treatments and prescriptions
7. Room – Patient room assignments

-The relations between the tables as shown in the ERD diagram 

# Business Questions Answered

1. Which patients have insurance and what are their assigned doctors?% of patients with insurance?
2. List all patients with their room number and building location.
3. HOw many patients are assigned for each doctor?
4. How many patients are assigned per department?
5. Which diseases are most commonly treated, and by which doctor?
6. How many visitors did each patient receive?
7. Which patients have both a doctor and a nurse in the same department?
8. Rank doctors by number of patients assigned using a window function.
9. Using a CTE, identify patients with no recorded room assignment..
  
# Executive summary/Business Insights
Key takeaways from the project are as follows:
- Around 60% of patients are insured, which means it is important to follow up on the remaining 40% who are paying out of pocket.
- Almost 90% of patients are located in the main building. Based on this, room allocation can be planned to determine whether rooms are being assigned effectively to eliminate overcrowding or underutilization. Knowing this helps optimize resources efficiently.
- Each doctor has 1 patient, meaning the workload is equally distributed. This provides insight into the workload per doctor and can inform hiring decisions accordingly.
- The Cardiology department has more patients compared to other departments. Knowing the patient count per department allows funding to be adjusted accordingly.
- Hypertension and diabetes are the top 2 most common conditions. Knowing which diseases are treated most frequently allows for better resource allocation, including medications, equipment, and supplies.
- A maximum of 2 visitors have visited each patient. Managing visiting times effectively can reduce overcrowding.
- 3 patients have both their doctor and nurse in the same department, which is beneficial for recovery and helps reduce readmission rates.
- Currently, there are no patients without assigned rooms, which reflects good management by the administration.
