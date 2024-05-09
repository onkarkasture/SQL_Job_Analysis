/*
Question: What the most optimal skills to learn (those with high demand and high salary)
-- Priority is high demand
-- Location - Anywhere inside INDIA
-- Limited for 'Data Analyst' roles.
*/

WITH top_paying_skills AS (
    SELECT skills, ROUND(AVG(salary_year_avg),0) AS average_annual_salary
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    LEFT JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND
        salary_year_avg IS NOT NULL AND job_location LIKE '%India'
        
    GROUP BY skills
), top_demanded_skills AS (
    SELECT skills, COUNT(job_postings_fact.job_id) AS number_of_jobs
    FROM job_postings_fact
    LEFT JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL AND job_location LIKE '%India'
    GROUP BY skills
)

SELECT top_paying_skills.skills, number_of_jobs, average_annual_salary
FROM top_paying_skills
INNER JOIN top_demanded_skills ON top_paying_skills.skills=top_demanded_skills.skills
ORDER BY number_of_jobs DESC, average_annual_salary DESC 
LIMIT 25;

/* Results
[
  {
    "skills": "sql",
    "number_of_jobs": "46",
    "average_annual_salary": "92984"
  },
  {
    "skills": "excel",
    "number_of_jobs": "39",
    "average_annual_salary": "88519"
  },
  {
    "skills": "python",
    "number_of_jobs": "36",
    "average_annual_salary": "95933"
  },
  {
    "skills": "tableau",
    "number_of_jobs": "20",
    "average_annual_salary": "95103"
  },
  {
    "skills": "r",
    "number_of_jobs": "18",
    "average_annual_salary": "86609"
  },
  {
    "skills": "power bi",
    "number_of_jobs": "17",
    "average_annual_salary": "109832"
  },
  {
    "skills": "azure",
    "number_of_jobs": "15",
    "average_annual_salary": "98570"
  },
  {
    "skills": "aws",
    "number_of_jobs": "12",
    "average_annual_salary": "95333"
  },
  {
    "skills": "spark",
    "number_of_jobs": "11",
    "average_annual_salary": "118332"
  },
  {
    "skills": "oracle",
    "number_of_jobs": "11",
    "average_annual_salary": "104260"
  },
  {
    "skills": "powerpoint",
    "number_of_jobs": "10",
    "average_annual_salary": "102678"
  },
  {
    "skills": "looker",
    "number_of_jobs": "10",
    "average_annual_salary": "98815"
  },
  {
    "skills": "word",
    "number_of_jobs": "10",
    "average_annual_salary": "83266"
  },
  {
    "skills": "mongodb",
    "number_of_jobs": "6",
    "average_annual_salary": "135994"
  },
  {
    "skills": "flow",
    "number_of_jobs": "6",
    "average_annual_salary": "104751"
  },
  {
    "skills": "hadoop",
    "number_of_jobs": "5",
    "average_annual_salary": "113276"
  },
  {
    "skills": "redshift",
    "number_of_jobs": "5",
    "average_annual_salary": "101315"
  },
  {
    "skills": "sql server",
    "number_of_jobs": "5",
    "average_annual_salary": "89120"
  },
  {
    "skills": "pandas",
    "number_of_jobs": "4",
    "average_annual_salary": "122463"
  },
  {
    "skills": "snowflake",
    "number_of_jobs": "4",
    "average_annual_salary": "111213"
  },
  {
    "skills": "go",
    "number_of_jobs": "4",
    "average_annual_salary": "109133"
  },
  {
    "skills": "sap",
    "number_of_jobs": "4",
    "average_annual_salary": "105044"
  },
  {
    "skills": "databricks",
    "number_of_jobs": "3",
    "average_annual_salary": "135994"
  },
  {
    "skills": "scala",
    "number_of_jobs": "3",
    "average_annual_salary": "135994"
  },
  {
    "skills": "express",
    "number_of_jobs": "3",
    "average_annual_salary": "109333"
  }
]
*/