/*
Question: What are the top-paying data analyst jobs with their title, yearly salary, location and company name?
 - Identify the top 10 highest paying Data Analyst roles that are available in India.
 - Focus on job postings with specified salaries (remove nulls).
 - Why? To highlight the top paying jobs for Data Analysts, offering insights into the employement opportunities
*/

SELECT job_id, job_title, name AS company_name, salary_year_avg AS yearly_salary, job_location, job_posted_date::DATE
FROM job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id

WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_location LIKE '%India'
ORDER BY salary_year_avg DESC
LIMIT 10;