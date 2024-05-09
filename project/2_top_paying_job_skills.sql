/* Question: What skils are required for the top-paying data analyst jobs?
-- Get top 10 highest paying jobs and get specific skills required for them. */

WITH top_paying_jobs AS (
    SELECT job_id, job_title, name AS company_name, salary_year_avg AS yearly_salary, job_location, job_posted_date::DATE
    FROM job_postings_fact
    INNER JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id

    WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_location LIKE '%India'
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT top_paying_jobs.*, skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
ORDER BY yearly_salary DESC;

/* Results
[
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-05-06",
    "skills": "oracle"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-05-06",
    "skills": "sap"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "sql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "python"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "nosql"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "scala"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "shell"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "databricks"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "aws"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "oracle"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "snowflake"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "spark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "pandas"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "pyspark"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "airflow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "kafka"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "unix"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "linux"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "power bi"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "jenkins"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "flow"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10",
    "skills": "gitlab"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "sql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "python"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "mongo"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "mysql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "postgresql"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "sql server"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "mongodb"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "azure"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "aws"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "redshift"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "oracle"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "spark"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "hadoop"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12",
    "skills": "power bi"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-07-06",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "python"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "scala"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "go"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "no-sql"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "neo4j"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "mongodb"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "azure"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "databricks"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "aws"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "oracle"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "spark"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "hadoop"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "gdpr"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07",
    "skills": "power bi"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "yearly_salary": "119250.0",
    "job_location": "India",
    "job_posted_date": "2023-11-21",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "yearly_salary": "119250.0",
    "job_location": "India",
    "job_posted_date": "2023-11-21",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "yearly_salary": "119250.0",
    "job_location": "India",
    "job_posted_date": "2023-11-21",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "yearly_salary": "119250.0",
    "job_location": "India",
    "job_posted_date": "2023-11-21",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "yearly_salary": "119250.0",
    "job_location": "India",
    "job_posted_date": "2023-11-21",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "yearly_salary": "118140.0",
    "job_location": "India",
    "job_posted_date": "2023-12-21",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "yearly_salary": "118140.0",
    "job_location": "India",
    "job_posted_date": "2023-12-21",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "yearly_salary": "118140.0",
    "job_location": "India",
    "job_posted_date": "2023-12-21",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "yearly_salary": "118140.0",
    "job_location": "India",
    "job_posted_date": "2023-12-21",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "yearly_salary": "118140.0",
    "job_location": "India",
    "job_posted_date": "2023-12-21",
    "skills": "flow"
  },
  {
    "job_id": 646083,
    "job_title": "Data Analyst (Contractual Role)",
    "company_name": "Razorpay",
    "yearly_salary": "111175.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-09-04",
    "skills": "sql"
  },
  {
    "job_id": 646083,
    "job_title": "Data Analyst (Contractual Role)",
    "company_name": "Razorpay",
    "yearly_salary": "111175.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-09-04",
    "skills": "excel"
  },
  {
    "job_id": 646083,
    "job_title": "Data Analyst (Contractual Role)",
    "company_name": "Razorpay",
    "yearly_salary": "111175.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-09-04",
    "skills": "dax"
  },
  {
    "job_id": 646083,
    "job_title": "Data Analyst (Contractual Role)",
    "company_name": "Razorpay",
    "yearly_salary": "111175.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-09-04",
    "skills": "looker"
  },
  {
    "job_id": 309885,
    "job_title": "Senior Analyst , Product Revenue (Data Analyst / Analytics)",
    "company_name": "Zscaler",
    "yearly_salary": "111175.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-02-24",
    "skills": "snowflake"
  },
  {
    "job_id": 309885,
    "job_title": "Senior Analyst , Product Revenue (Data Analyst / Analytics)",
    "company_name": "Zscaler",
    "yearly_salary": "111175.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-02-24",
    "skills": "excel"
  },
  {
    "job_id": 309885,
    "job_title": "Senior Analyst , Product Revenue (Data Analyst / Analytics)",
    "company_name": "Zscaler",
    "yearly_salary": "111175.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-02-24",
    "skills": "tableau"
  }
]
*/