-- 📁 SQL Query File: Advanced Hospital Data Analysis

-- 1. Total number of patients
SELECT COUNT(DISTINCT Patient_ID) AS total_patients
FROM hospital_data;

-- 2. Average length of stay
SELECT ROUND(AVG(Length_of_Stay), 2) AS avg_stay_days
FROM hospital_data;

-- 3. Gender distribution
SELECT Gender, COUNT(*) AS total
FROM hospital_data
GROUP BY Gender;

-- 4. Top 5 most common conditions
SELECT `Condition`, COUNT(*) AS case_count
FROM hospital_data
GROUP BY `Condition`
ORDER BY case_count DESC
LIMIT 5;

-- 5. Readmission counts
SELECT Readmission, COUNT(*) AS total
FROM hospital_data
GROUP BY Readmission;

-- 6. Average satisfaction by outcome
SELECT Outcome, ROUND(AVG(Satisfaction), 2) AS avg_satisfaction
FROM hospital_data
GROUP BY Outcome
ORDER BY avg_satisfaction DESC;

-- 7. Average cost per procedure
SELECT `Procedure`, ROUND(AVG(Cost), 0) AS avg_cost
FROM hospital_data
GROUP BY `Procedure`
ORDER BY avg_cost DESC;

-- 8. Average satisfaction by condition
SELECT `Condition`, ROUND(AVG(Satisfaction), 2) AS avg_satisfaction
FROM hospital_data
GROUP BY `Condition`
ORDER BY avg_satisfaction DESC;

-- 9. Age group readmission analysis
SELECT 
  CASE 
    WHEN Age < 30 THEN 'Under 30'
    WHEN Age BETWEEN 30 AND 50 THEN '30-50'
    WHEN Age BETWEEN 51 AND 70 THEN '51-70'
    ELSE 'Above 70'
  END AS age_group,
  COUNT(*) AS total_patients,
  SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) AS readmitted,
  ROUND(100.0 * SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS readmission_rate
FROM hospital_data
GROUP BY age_group
ORDER BY readmission_rate DESC;

-- 10. Satisfaction by gender and condition
SELECT Gender, `Condition`, 
       COUNT(*) AS total_cases,
       ROUND(AVG(Satisfaction), 2) AS avg_satisfaction
FROM hospital_data
GROUP BY Gender, `Condition`
ORDER BY avg_satisfaction DESC;

-- 11. Procedure cost and satisfaction analysis
SELECT `Procedure`, 
       ROUND(AVG(Cost), 0) AS avg_cost,
       ROUND(AVG(Satisfaction), 2) AS avg_satisfaction
FROM hospital_data
GROUP BY `Procedure`
ORDER BY avg_cost DESC;

-- 12. Highest cost procedure
SELECT `Procedure`, ROUND(AVG(Cost), 0) AS avg_cost
FROM hospital_data
GROUP BY `Procedure`
ORDER BY avg_cost DESC
LIMIT 1;
