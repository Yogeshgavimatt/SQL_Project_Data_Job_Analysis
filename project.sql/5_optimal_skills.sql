/*
Answer: What are the most optimal skills to learn (aka it’s in high demand and a high-paying skill)?
- Identify skills in high demand and associated with high average salaries for Data Analyst roles
- Concentrates on remote positions with specified salaries
- Why? Targets skills that offer job security (high demand) and financial benefits (high salaries), 
    offering strategic insights for career development in data analysis
*/

WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_postings_fact.job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_postings_fact.job_location ILIKE '%India%'
    GROUP BY 
        skills_dim.skill_id, skills_dim.skills
),
average_salary AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
    FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE
        job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_postings_fact.job_location ILIKE '%India%'
    GROUP BY
        skills_dim.skill_id, skills_dim.skills
)
SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    skills_demand.demand_count,
    average_salary.avg_salary
FROM
    skills_demand
INNER JOIN average_salary 
    ON skills_demand.skill_id = average_salary.skill_id
WHERE 
    demand_count > 10
ORDER BY
    avg_salary DESC,
    demand_count DESC
LIMIT 25




/*
Insights :

1.SQL and Python are the core, most in-demand skills for Data Analysts, combining wide adoption with strong salaries.

2.Power BI and Tableau stand out as highly valued BI tools, with Power BI offering the best salary leverage.

3.Spark commands the highest average salary, showing its niche but lucrative demand.

4.Cloud platforms (Azure, AWS) are increasingly important, offering both demand and above-average pay.

5.R remains relevant for statistical analysis, while Excel is still widely required though lower-paying.

6.Communication tools (PowerPoint, Word) appear frequently, reflecting the need to present insights effectively.


[
  {
    "skill_id": 92,
    "skills": "spark",
    "demand_count": "11",
    "avg_salary": "118332"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "23",
    "avg_salary": "104743"
  },
  {
    "skill_id": 79,
    "skills": "oracle",
    "demand_count": "11",
    "avg_salary": "104260"
  },
  {
    "skill_id": 74,
    "skills": "azure",
    "demand_count": "15",
    "avg_salary": "98570"
  },
  {
    "skill_id": 196,
    "skills": "powerpoint",
    "demand_count": "13",
    "avg_salary": "97948"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "41",
    "avg_salary": "95689"
  },
  {
    "skill_id": 76,
    "skills": "aws",
    "demand_count": "13",
    "avg_salary": "93384"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "27",
    "avg_salary": "93168"
  },
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "63",
    "avg_salary": "91595"
  },
  {
    "skill_id": 5,
    "skills": "r",
    "demand_count": "21",
    "avg_salary": "87335"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "50",
    "avg_salary": "84964"
  },
  {
    "skill_id": 188,
    "skills": "word",
    "demand_count": "13",
    "avg_salary": "84153"
  }
]
*/