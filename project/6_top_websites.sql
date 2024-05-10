SELECT job_via AS Website_Name, 
    AVG(salary_year_avg)::INT AS Average_Salary, 
    COUNT(job_id)::INT AS Number_of_Jobs
FROM job_postings_fact
WHERE job_location LIKE '%India%'
GROUP BY Website_Name 
HAVING 
    AVG(salary_year_avg) IS NOT NULL 
    AND 
    COUNT(job_id) IS NOT NULL
ORDER BY Number_of_Jobs DESC, average_salary DESC
LIMIT 10;