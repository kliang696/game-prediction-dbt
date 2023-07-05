{{
    config(
        materialized='table'
    )
}}


SELECT
    summonerName as Name, 
    individualPosition,
    championName,
    count("championName") as games_played,
    round(avg((kills+assists)/CASE WHEN deaths = 0 THEN 1 ELSE deaths END),1) as avg_kda,
    round(avg(totalMinionsKilled),1) as avg_cs,
    round((sum(CASE WHEN win = true THEN 1 ELSE 0 END)/count(championName))*100, 1) as avg_win_rate,
FROM 
    {{ ref("all_data") }} 

group by summonerName, individualPosition,championName

order by games_played DESC
