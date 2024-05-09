/*
Question: What are the top skills based on salary?
-- Look at the average salary for each skill for Data Analyst Positions
-- Focus on jobs with specified skills regardless of location
*/

SELECT skills, ROUND(AVG(salary_year_avg),0) AS average_annual_salary
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY average_annual_salary DESC
LIMIT 10;

/* Results
[
  {
    "skills": "svn",
    "average_annual_salary": "400000"
  },
  {
    "skills": "solidity",
    "average_annual_salary": "179000"
  },
  {
    "skills": "couchbase",
    "average_annual_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_annual_salary": "155486"
  },
  {
    "skills": "golang",
    "average_annual_salary": "155000"
  },
  {
    "skills": "mxnet",
    "average_annual_salary": "149000"
  },
  {
    "skills": "dplyr",
    "average_annual_salary": "147633"
  },
  {
    "skills": "vmware",
    "average_annual_salary": "147500"
  },
  {
    "skills": "terraform",
    "average_annual_salary": "146734"
  },
  {
    "skills": "twilio",
    "average_annual_salary": "138500"
  }
]
*/