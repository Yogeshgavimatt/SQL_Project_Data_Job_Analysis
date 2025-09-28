/*
Question: What skills are required for the top-paying data analyst jobs?
- Use the top 10 highest-paying Data Analyst jobs from first query
- Add the specific skills required for these roles
- Why? It provides a detailed look at which high-paying jobs demand certain skills, 
    helping job seekers understand which skills to develop that align with top salaries
*/


WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        name AS company_name
    FROM 
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst' AND 
        job_location = 'India' AND
        Salary_year_avg IS NOT NULL 
    ORDER BY 
        salary_year_avg DESC
    LIMIT 10
)

SELECT 
    top_paying_jobs.*,
    skills
FROM 
    top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY 
    Salary_year_avg DESC


/*
The skill column in the job skills data highlights a strong demand for data analysis and productivity skills, with a limited but diverse set of specialized technical skills.

Insights :

1.SQL, Excel, and Python stand out as the foundational tools for top-paying data and analytics jobs.

2.Productivity (Word, PowerPoint) and BI tools (Tableau, Power BI) are repeatedly seen, reflecting the need for both analysis and effective business communication.

3.AI/machine learning frameworks (TensorFlow, PyTorch) appear but are less common in this selection of roles, suggesting a wider spread of required skills outside core AI engineering.


[
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "sql"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "excel"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "visio"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "jira"
  },
  {
    "job_id": 325402,
    "job_title": "Senior Business & Data Analyst",
    "salary_year_avg": "119250.0",
    "job_posted_date": "2023-11-21 13:11:46",
    "company_name": "Deutsche Bank",
    "skills": "confluence"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "sql"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "azure"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "excel"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "power bi"
  },
  {
    "job_id": 908967,
    "job_title": "Sr. Enterprise Data Analyst",
    "salary_year_avg": "118140.0",
    "job_posted_date": "2023-12-21 20:10:10",
    "company_name": "ACA Group",
    "skills": "flow"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07 16:11:10",
    "company_name": "Clarivate",
    "skills": "excel"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07 16:11:10",
    "company_name": "Clarivate",
    "skills": "word"
  },
  {
    "job_id": 591307,
    "job_title": "HR Data Operations Analyst",
    "salary_year_avg": "104550.0",
    "job_posted_date": "2023-11-07 16:11:10",
    "company_name": "Clarivate",
    "skills": "powerpoint"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "company_name": "Loop Health",
    "skills": "sql"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "company_name": "Loop Health",
    "skills": "python"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "company_name": "Loop Health",
    "skills": "r"
  },
  {
    "job_id": 1218280,
    "job_title": "Financial Data Analyst",
    "salary_year_avg": "93600.0",
    "job_posted_date": "2023-05-02 17:14:27",
    "company_name": "Loop Health",
    "skills": "sheets"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "company_name": "Clarivate",
    "skills": "sql"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "company_name": "Clarivate",
    "skills": "python"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "company_name": "Clarivate",
    "skills": "excel"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "company_name": "Clarivate",
    "skills": "tableau"
  },
  {
    "job_id": 544240,
    "job_title": "Healthcare Research & Data Analyst",
    "salary_year_avg": "89118.0",
    "job_posted_date": "2023-11-08 14:31:21",
    "company_name": "Clarivate",
    "skills": "word"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "company_name": "Miratech",
    "skills": "sql"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "company_name": "Miratech",
    "skills": "unix"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "company_name": "Miratech",
    "skills": "windows"
  },
  {
    "job_id": 733296,
    "job_title": "Data Integration and Business Intelligence Analyst",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-07-27 07:12:42",
    "company_name": "Miratech",
    "skills": "tableau"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14 19:11:53",
    "company_name": "AlphaSense",
    "skills": "python"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14 19:11:53",
    "company_name": "AlphaSense",
    "skills": "tensorflow"
  },
  {
    "job_id": 152699,
    "job_title": "Ai Research Engineer",
    "salary_year_avg": "79200.0",
    "job_posted_date": "2023-08-14 19:11:53",
    "company_name": "AlphaSense",
    "skills": "pytorch"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "company_name": "Cargill",
    "skills": "sql"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "company_name": "Cargill",
    "skills": "oracle"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "company_name": "Cargill",
    "skills": "excel"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "company_name": "Cargill",
    "skills": "word"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "company_name": "Cargill",
    "skills": "outlook"
  },
  {
    "job_id": 989706,
    "job_title": "Data Analyst - Price hub",
    "salary_year_avg": "75067.5",
    "job_posted_date": "2023-12-22 04:09:39",
    "company_name": "Cargill",
    "skills": "flow"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28 21:12:02",
    "company_name": "Bristol Myers Squibb",
    "skills": "python"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28 21:12:02",
    "company_name": "Bristol Myers Squibb",
    "skills": "r"
  },
  {
    "job_id": 1018519,
    "job_title": "Data Analyst I",
    "salary_year_avg": "71600.0",
    "job_posted_date": "2023-11-28 21:12:02",
    "company_name": "Bristol Myers Squibb",
    "skills": "excel"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22 17:08:01",
    "company_name": "Merck Group",
    "skills": "sql"
  },
  {
    "job_id": 1797441,
    "job_title": "IT Data Analytic Architect - Biopharma Commercial",
    "salary_year_avg": "64800.0",
    "job_posted_date": "2023-12-22 17:08:01",
    "company_name": "Merck Group",
    "skills": "python"
  }
]
*/