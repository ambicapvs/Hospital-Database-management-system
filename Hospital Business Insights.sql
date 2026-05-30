-- Exploring Hospital Data Through SQL

-- 1. Which patients have insurance and what are their assigned doctors?
select p.PatientID,d.Docfirstname
from patient p
inner join doctor d
on p.PatientID=d.PatientID
where Insurance='y';

-- 2. List all patients with their room number and building location.
select p.PatientID,concat(p.Firstname," ",p.Lastname) as patient_name,
r.Room_num,r.Building
from patient p
inner join room r
on p.PatientID=r.PatientID;


-- 3. doctors and number of patients assigned? 
select DoctorID, count(PatientID)
from doctor
group by 1;

-- 4. How many patients are assigned per department?
select Department, count(PatientID)
from doctor
group by 1;



-- 5. Which diseases are most commonly treated, and by which doctor?
SELECT 
    CONCAT(d.Docfirstname, ' ', d.Doclastname) AS Doctor_Name,
    d.Department,
    dis.DiseaseName,
    COUNT(dis.DiseaseID) AS Treatment_Count
FROM Disease dis
JOIN Doctor d ON dis.DoctorID = d.DoctorID
GROUP BY d.DoctorID, d.Docfirstname, d.Doclastname, d.Department, dis.DiseaseName
ORDER BY Treatment_Count DESC;


-- 6. How many visitors did each patient receive?
select PatientID,count(VisitorID) as Number_of_visitors
from visitor
group by 1;

-- 7. Which patients have both a doctor and a nurse in the same department? (showcases JOINs across tables)
select p.PatientID, concat(p.Firstname," ",p.Lastname) as patient_name
from patient p
inner join doctor d
on p.PatientID=d.PatientID
inner join nurse n
on p.PatientID=n.PatientID
where d.Department=n.Department;

-- 8. Rank doctors by number of patients assigned using a window function.
select concat(Docfirstname," ",Doclastname) as Doctor_name, count(PatientID)as num_of_patients,
dense_rank()over(order by count(PatientID)) as ranking
from doctor
group by 1;

-- 9. Using a CTE, identify patients with no recorded room assignment.
WITH Patients_Without_Room AS (
    SELECT 
        p.PatientID,
        CONCAT(p.Firstname, ' ', p.Lastname) AS Full_Name
    FROM Patient p
    LEFT JOIN Room r ON p.PatientID = r.PatientID
    WHERE r.RoomID IS NULL
)
SELECT * FROM Patients_Without_Room;
