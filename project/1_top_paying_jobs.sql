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

/* Results
[
  {
    "job_id": 1642893,
    "job_title": "Staff Applied Research Engineer",
    "company_name": "ServiceNow",
    "yearly_salary": "177283.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-06-28"
  },
  {
    "job_id": 283661,
    "job_title": "Technical Data Architect - Healthcare",
    "company_name": "Srijan Technologies",
    "yearly_salary": "165000.0",
    "job_location": "Gurugram, Haryana, India",
    "job_posted_date": "2023-05-10"
  },
  {
    "job_id": 954793,
    "job_title": "Data Architect 2023",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-01-12"
  },
  {
    "job_id": 1041666,
    "job_title": "Data Architect - Data Migration",
    "company_name": "Bosch Group",
    "yearly_salary": "165000.0",
    "job_location": "Bengaluru, Karnataka, India",
    "job_posted_date": "2023-05-06"
  },
  {
    "job_id": 406320,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-02-07"
  },
  {
    "job_id": 781346,
    "job_title": "Data Architect",
    "company_name": "Eagle Genomics Ltd",
    "yearly_salary": "163782.0",
    "job_location": "Hyderabad, Telangana, India",
    "job_posted_date": "2023-07-06"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "company_name": "Deutsche Bank",
    "yearly_salary": "119250.0",
    "job_location": "India",
    "job_posted_date": "2023-11-21"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "company_name": "ACA Group",
    "yearly_salary": "118140.0",
    "job_location": "India",
    "job_posted_date": "2023-12-21"
  },
  {
    "job_id": 1122466,
    "job_title": "Data Analyst",
    "company_name": "Spotify",
    "yearly_salary": "111175.0",
    "job_location": "Mumbai, Maharashtra, India",
    "job_posted_date": "2023-06-20"
  },
  {
    "job_id": 1498936,
    "job_title": "Data Analyst",
    "company_name": "DoorDash",
    "yearly_salary": "111175.0",
    "job_location": "Pune, Maharashtra, India",
    "job_posted_date": "2023-07-07"
  }
*/