-- Yazan Khalaf
-- Q1  find the number of employees by industry 
SELECT			A.industry, COUNT(*) AS employee_count
FROM			company A
JOIN			employee B ON A.company_id = B.company_id
GROUP BY		A.industry;

-- Q2  find the total revenue by company type and job type
SELECT			SUM(A.revenue) AS TotalRevenue, A.company_type, B.job_type
FROM			company A
JOIN			employee B ON A.company_id = B.company_id
GROUP BY		A.company_type, B.job_type;
-- Q3 find the earliest hire date by every year established and employee educational level, for companies in California or Colorado, and for employees residing  in California or Colorado
SELECT			MIN(B.hire_date) AS EarliestDate, A.year_established, B.ed_level
FROM			company A
JOIN			employee B ON A.company_id = B.company_id
WHERE			A.state = 'CA' OR 'CO'
AND				B.state = 'CA' OR 'CO'
GROUP BY		B.hire_date, A.year_established, B.ed_level
ORDER BY		2, 3;