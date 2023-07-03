{{
    config(
        materialized='table'
    )
}}

WITH rank_info AS (
    SELECT * EXCEPT(Date)
    FROM {{ source('game_stats', 'rank_info_part1')}}
),
game_info AS (
    SELECT * EXCEPT(Date)
    FROM {{ source('game_stats', 'game_info_part1')}}
)
SELECT
    r.*,
    g.* EXCEPT(summonerName)
FROM rank_info AS r
INNER JOIN game_info AS g
ON r.summonerName = g.summonerName