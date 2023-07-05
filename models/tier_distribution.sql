{{
    config(
        materialized='table'
    )
}}


SELECT
   tier, COUNT(tier) AS tier_distribution,SUM(COUNT(tier)) OVER () as total,   COUNT(tier)/SUM(COUNT(tier)) OVER () as tier_distribution_percentage
FROM 
    {{ ref("all_data") }} 
GROUP BY
   tier
order by tier_distribution_percentage DESC

