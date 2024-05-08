/*
Question: What are the most in-demand skills for data analysts?
-- Identify the top 5 in-demand skills for a data analyst
-- Provide insight into the most valuable skills for job seekers
-- Demand = Number of job postings with that skill
*/

SELECT skills, COUNT(job_postings_fact.job_id) AS number_of_jobs
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
GROUP BY skills
ORDER BY number_of_jobs DESC
LIMIT 5