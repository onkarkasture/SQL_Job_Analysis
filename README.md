# Introduction
Welcome to the SQL Job Analysis Project!    
In this repository, you'll find the methodology, SQL queries and their correspondig results analyzed for insights into the job market, specifically pertaining to India and Data Analyst Roles.
# Background
The purpose of this project is to explore a dataset using SQL queries to derive meaningful insights. By querying the database, I aim to uncover the trends, patterns, distributions and relationships within the dataset.

Want to take a look at the queries and SQL code? Here's a link: **[project folder](/project/)**
# Tools I Used
- **SQL:** Structured Query Language, used to interact with the databse and extract relevant information by using **'Queries'**.
- **PostgreSQL:** It is a Database Management System **(DMS)** and it was utilized for upkeep of the dataset used in this analysis.
- **ChatGPT:** It is a Large Language Model **(LLM)** used to reduce repetitive and menial tasks to fastrack the progress.
- **Excel:** A very versatile tool for data management. Was used to give better structure to the dataset as well as to draw conclusions using the results.
# The Analysis
The Analysis is divided into 5 questions so as to make it more readable.    
Note: All salary values are in **Dollars ($)**

### **Question 1:** What are the top 10 Data Analyst Jobs in India based on Yearly Salary?

```sql
SELECT job_id, job_title, name AS company_name, salary_year_avg AS yearly_salary, job_location, job_posted_date::DATE
FROM job_postings_fact
INNER JOIN company_dim ON job_postings_fact.company_id=company_dim.company_id

WHERE salary_year_avg IS NOT NULL AND job_title_short = 'Data Analyst' AND job_location LIKE '%India'
ORDER BY salary_year_avg DESC
LIMIT 10;
```

- **Salary Insights:**

The yearly salaries for the data roles range from around 111,000 to 165,000 .
The highest salary appears to be for the role of "Data Architect - Data Migration" at Bosch Group.

- **Location Distribution:**

Most of the jobs are located in major Indian cities like Bengaluru, Gurugram, Hyderabad, and some are based in India without specifying a particular city.
Bengaluru and Gurugram seem to have the highest concentration of data-related job postings.

- **Company Preferences:**

Bosch Group and Srijan Technologies seem to have multiple job postings for data-related roles, indicating a focus on data architecture and analytics within these companies.
Other companies like Eagle Genomics Ltd, Deutsche Bank, ACA Group, Razorpay, and Zscaler also have job postings for data roles, showcasing the diversity of industries seeking data professionals.

- **Job Titles:**

Job titles vary from generic ones like "Data Architect" to more specific ones like "Senior Analyst, Product Revenue (Data Analyst/Analytics)" and "Technical Data Architect - Healthcare". This suggests a range of responsibilities and specializations within the data domain.

- **Time Trends:**

Job postings seem to be spread across different months, indicating a continuous demand for data professionals throughout the year.
No significant patterns in terms of job posting dates are discernible from the provided data.

- **Specialization Areas:**

Some job postings are specialized in certain domains like healthcare (e.g., "Technical Data Architect - Healthcare"), suggesting the importance of domain knowledge in addition to technical skills in certain roles.

![alt text](/assets/image1.png)

### **Question 2:** What are the top-paying job skills?

```sql
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
```

- **Skill Requirements:**

SQL appears to be a common skill requirement across many job postings, indicating its importance in the field of data architecture and analysis.    
Other frequently mentioned skills include Python, AWS, Azure, Excel, Spark, Hadoop, Power BI, and Oracle.   
Different companies might have specific requirements for skills, such as Srijan Technologies looking for expertise in Scala, Shell scripting, Databricks, etc., whereas Bosch Group emphasizes skills like SAP, MongoDB, PostgreSQL, etc.   
Skills like Snowflake, Kafka, Gitlab, etc., are also mentioned, although less frequently, suggesting niche requirements in some job roles. 

![alt text](/assets/image2.png)

### **Question 3:** What the most in-demand skills based on number of job postings?

```sql
SELECT skills, COUNT(job_postings_fact.job_id) AS number_of_jobs
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND job_location LIKE '%India'
GROUP BY skills
ORDER BY number_of_jobs DESC
LIMIT 5;
```
**SQL Dominance:** SQL stands out as the most in-demand skill by a significant margin. This suggests that proficiency in SQL is highly sought after across various data-related job roles.
Microsoft Office Skills: Both Excel and Power BI, which are part of the Microsoft Office suite, rank high in demand. This underscores the importance of data analysis and visualization skills in roles requiring data handling and reporting.

**Programming Proficiency:** Python emerges as a highly desired skill, indicating the importance of programming abilities in data-related roles. Its versatility and extensive use in data analysis, machine learning, and automation contribute to its high demand.

**Visualization Tools:** Tableau, a prominent data visualization tool, also features prominently in job postings. This highlights the need for professionals who can effectively communicate insights through data visualization.

**Industry Standard:** Skills like SQL and Excel are considered industry standards in data-related roles, often being prerequisites for many positions. Proficiency in these tools is essential for data handling, querying, and analysis tasks.

![alt text](/assets/image3.png)

### **Question 4:** Which skills are associated with high salaries?

```sql
SELECT skills, ROUND(AVG(salary_year_avg),0) AS average_annual_salary
FROM job_postings_fact
LEFT JOIN skills_job_dim ON job_postings_fact.job_id=skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id=skills_dim.skill_id
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY average_annual_salary DESC
LIMIT 10;
```

| Skill     | Average Annual Salary ($) |
|-----------|----------------------------|
| SVN       | 400,000                   |
| Solidity  | 179,000                   |
| Couchbase | 160,515                   |
| DataRobot | 155,486                   |
| Golang    | 155,000                   |
| MXNet     | 149,000                   |
| dplyr     | 147,633                   |
| VMware    | 147,500                   |
| Terraform | 146,734                   |
| Twilio    | 138,500                   |


These average annual salaries provide valuable information for professionals considering skill development or career transitions. 

Here are some insights derived from this data:

**Specialized Skills:** The skills listed, such as Solidity (a programming language for smart contracts), DataRobot (an automated machine learning platform), and Terraform (an infrastructure as code tool), are more specialized compared to general-purpose skills like SQL or Python.   
**Salary Variability:** The salary range varies significantly among the listed skills, with SVN having the highest average annual salary at 400,000 and Twilio having the lowest at 138,500. This reflects the diverse nature of the job market and the varying demand for different skill sets.  
**Emerging Technologies:** Some skills, such as Solidity and Golang (Go programming language), represent emerging technologies or niche domains. Professionals with expertise in these areas may command higher salaries due to their specialized knowledge and the demand for these skills in specific industries or sectors.  
**Demand vs. Supply:** The average salary associated with a skill can also reflect the balance between supply and demand in the job market. Skills with higher average salaries may indicate a higher demand relative to the available talent pool, leading to increased compensation for professionals with those skills.  
**Industry Trends:** The presence of certain skills like DataRobot, Couchbase, and Twilio in the list may reflect current industry trends or the adoption of specific technologies by companies in certain sectors. 

### **Question 5:** What are the most optimal skills (optimal = high demand + high salary)

```sql
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
```
**SQL:** It has the highest number of job openings (46) and a decent average annual salary ($92,984), indicating a strong demand and moderate compensation.  
**Python:** Although it has slightly fewer job openings compared to SQL (36), it boasts a higher average annual salary ($95,933), suggesting high demand and better compensation.   
**Power BI:** Despite having fewer job openings (17), it offers the highest average annual salary ($109,832), indicating a high demand and excellent compensation for professionals with this skill.    
**Tableau:** With decent number of job openings (20) and good enough salary of $95,103, tableau seems to meet the best of both worlds criteria.
**AWS:** With 12 job openings and a decent average annual salary ($95,333), AWS skills are in demand and offer competitive compensation.    
**Spark:** It has fewer job openings (11) but offers a high average annual salary ($118,332), indicating significant demand and excellent compensation for professionals proficient in Spark.   
**MongoDB:** Though it has fewer job openings (6), it offers one of the highest average annual salaries ($135,994), suggesting a specialized skill set in demand with lucrative compensation.   

| Skills      | Number of Jobs | Average Annual Salary |
|-------------|----------------|-----------------------|
| sql         | 46             | 92984                 |
| excel       | 39             | 88519                 |
| python      | 36             | 95933                 |
| tableau     | 20             | 95103                 |
| R           | 18             | 86609                 |
| power bi    | 17             | 109832                |
| azure       | 15             | 98570                 |
| aws         | 12             | 95333                 |
| spark       | 11             | 118332                |
| oracle      | 11             | 104260                |
| powerpoint  | 10             | 102678                |
| looker      | 10             | 98815                 |
| word        | 10             | 83266                 |
| mongodb     | 6              | 135994                |

# What I learned
This project shed light on how different tools, especially **SQL**, play crucial roles in understanding a particular dataset. SQL's simplicity and adaptability allowed for precise data extraction, making it easier to spot trends and connections within the dataset.    
**PostgreSQL** served as a sturdy foundation, ensuring the dataset remained organized and reliable throughout the analysis.  
With **ChatGPT**'s assistance, routine tasks were streamlined, and insights were communicated more clearly.  
**Excel** proved handy in refining the dataset's structure and drawing meaningful conclusions from the analysis. Its flexibility complemented SQL's capabilities, offering a comprehensive view of the data.   

In essence, this project highlighted the value of using a blend of tools like SQL, PostgreSQL, ChatGPT, and Excel to glean insights effectively. By working together, these tools facilitated a methodical analysis, resulting in actionable insights for decision-making. Mainly this project was oreinted towards teaching myself advanced SQL queries and extraction of data to make practical decisions.

# Conclusions
1. **Top-Paying Data Analyst Jobs:** The highest-paying jobs for data analysts in India offer a wide range of salaries, the highest being $177,283 or ₹14,801,730!  
2. **Skills for Top-Paying Jobs:** High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.  
3. **Most In-Demand Skills:** SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.  
4. **Skills with Higher Salaries:** Specialized skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on niche expertise.  
5. **Optimal Skills for Job Market Value:** SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

# Closing Thoughts
This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.