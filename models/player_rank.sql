{{
    config(
        materialized='table'
    )
}}


SELECT
    summonerName as Name, tier,rank, MAX(leaguePoints) as LP,count(summonerName) as Play
FROM 
    {{ ref("all_data") }} 

group by summonerName, tier,rank

order by Play DESC
