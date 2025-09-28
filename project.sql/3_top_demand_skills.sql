/*
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? Retrieves the top 5 skills with the highest demand in the job market, 
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills_dim.skill_id,
    skills_dim.skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst'
    AND job_postings_fact.job_location ILIKE '%India%'
GROUP BY 
    skills_dim.skill_id, skills_dim.skills
ORDER BY 
    demand_count DESC
LIMIT 5;



/*
Insights : 

1.Data analysts looking to maximize their employability should focus on mastering SQL, Excel, Python, Tableau, and Power BI. 

2.These five skills consistently rank as the most requested by employers in job postings, reflecting their critical role in data-driven business environments. 

3.Prioritizing these areas ensures not only technical competency but also readiness for analytical roles that require advanced data handling, visualization, and reporting.


[
  {
    "skill_id": 0,
    "skills": "sql",
    "demand_count": "2867"
  },
  {
    "skill_id": 181,
    "skills": "excel",
    "demand_count": "2072"
  },
  {
    "skill_id": 1,
    "skills": "python",
    "demand_count": "1937"
  },
  {
    "skill_id": 182,
    "skills": "tableau",
    "demand_count": "1578"
  },
  {
    "skill_id": 183,
    "skills": "power bi",
    "demand_count": "1163"
  }
]
*/