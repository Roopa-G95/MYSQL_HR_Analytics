SELECT * FROM sql_portfolio_project.hr_data;

-- KPI- Employee Count
select count(`Employee Number`) as Overall_Employee from hr_data;

-- KPI- Attrition Count
Select count(Attrition) as Attrition_count
From hr_data 
where attrition ='Yes';

-- Attrition Rate
Select round(((Select count(Attrition) From hr_data where attrition ='Yes')/
count(`Employee Number`))*100,2) as Attrition_Rate 
From hr_data;

-- Active Employee
SELECT 
    (SELECT COUNT(`Employee Number`) FROM hr_data) - 
    (SELECT COUNT(`Employee Number`) FROM hr_data WHERE attrition = 'Yes') AS Active_Employee_Count;
    
-- OR
Select count(Attrition) as Attrition_count
From hr_data 
where attrition ='No';

-- KPI- Average Age
Select Round(Avg(Age),0) from hr_data;

-- Attrition by Gender
select gender, count(attrition) as attrition_count from hr_data
where attrition='Yes' 
group by gender
order by attrition_count desc;

-- Department wise Attrition
Select department, count(Attrition),
round((count(attrition)/(select count(attrition) from hr_data where attrition = 'Yes'))*100,2) as Attrition from hr_data 
where attrition = 'Yes' 
group by department 
order by Attrition desc;

-- No of Employee by Age Group 
select `CF_age band`,sum(`Employee count`) from hr_data group by `CF_age band` order by `CF_age band` asc;

-- Education Field wise Attrition

Select `education field`, count(attrition) from hr_data 
where attrition ='Yes'
group by `education field`
order by count(attrition) desc;

-- Attrition Rate by Gender for different Age group

Select `CF_age band`,gender, count(attrition), round(COUNT(attrition)/(select count(attrition) from hr_data where attrition ='Yes')*100,2) as Percentage from hr_data
where attrition = 'Yes'
group by `CF_age band`,gender
order by `CF_age band`,gender;

-- Job Satisfaction Rating
SELECT 
    `job role`,
    SUM(CASE WHEN `job satisfaction` = 1 THEN `employee count` ELSE 0 END) AS `one`,
    SUM(CASE WHEN `job satisfaction` = 2 THEN `employee count` ELSE 0 END) AS `two`,
    SUM(CASE WHEN `job satisfaction` = 3 THEN `employee count` ELSE 0 END) AS `three`,
    SUM(CASE WHEN `job satisfaction` = 4 THEN `employee count` ELSE 0 END) AS `four`
FROM 
    hr_data
GROUP BY 
    `job role`
ORDER BY 
    `job role`;


