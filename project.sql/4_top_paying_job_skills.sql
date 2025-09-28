/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_postings_fact.job_location ILIKE '%India%'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25;


/*
Insights

1.The highest salaries are associated with advanced technical and data engineering skills like Linux, GitLab, PySpark, MySQL, and PostgreSQL, each averaging around 165,000. These skills are critical for managing large-scale databases, data pipelines, and cloud environments.

2.Knowledge of data governance and privacy (GDPR), graph databases like Neo4j, and workflow orchestration tools such as Airflow also correspond to higher earnings, reflecting the importance of compliance and modern data architectures.

3.Skills related to big data management and cloud platforms like Databricks, MongoDB, Scala, along with popular data manipulation libraries like Pandas, fetch competitive salaries roughly between 120,000 and 140,000.

4.Even productivity and collaboration tools such as Visio, Kafka, and Confluence contribute to role value, highlighting the team coordination and communication facets of data analytics jobs.


[
  {
    "skills": "linux",
    "avg_salary": "165000"
  },
  {
    "skills": "gitlab",
    "avg_salary": "165000"
  },
  {
    "skills": "pyspark",
    "avg_salary": "165000"
  },
  {
    "skills": "mysql",
    "avg_salary": "165000"
  },
  {
    "skills": "postgresql",
    "avg_salary": "165000"
  },
  {
    "skills": "gdpr",
    "avg_salary": "163782"
  },
  {
    "skills": "neo4j",
    "avg_salary": "163782"
  },
  {
    "skills": "airflow",
    "avg_salary": "138088"
  },
  {
    "skills": "databricks",
    "avg_salary": "135994"
  },
  {
    "skills": "mongodb",
    "avg_salary": "135994"
  },
  {
    "skills": "scala",
    "avg_salary": "135994"
  },
  {
    "skills": "pandas",
    "avg_salary": "122463"
  },
  {
    "skills": "visio",
    "avg_salary": "122125"
  },
  {
    "skills": "kafka",
    "avg_salary": "122100"
  },
  {
    "skills": "confluence",
    "avg_salary": "119250"
  },
  {
    "skills": "shell",
    "avg_salary": "118500"
  },
  {
    "skills": "spark",
    "avg_salary": "118332"
  },
  {
    "skills": "jira",
    "avg_salary": "115213"
  },
  {
    "skills": "no-sql",
    "avg_salary": "114291"
  },
  {
    "skills": "hadoop",
    "avg_salary": "113276"
  },
  {
    "skills": "snowflake",
    "avg_salary": "111213"
  },
  {
    "skills": "dax",
    "avg_salary": "111175"
  },
  {
    "skills": "matplotlib",
    "avg_salary": "111175"
  },
  {
    "skills": "bash",
    "avg_salary": "111175"
  },
  {
    "skills": "electron",
    "avg_salary": "111175"
  }
]
*/