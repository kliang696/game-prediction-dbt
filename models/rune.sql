{{
    config(
        materialized='table'
    )
}}

WITH rune_list AS (
    SELECT * 
    FROM {{ source('game_stats', 'rune_list')}}
),
game_info AS (
    SELECT * EXCEPT(Date)
    FROM {{ source('game_stats', 'game_info')}}
)

SELECT *
from rune_list r
join game_info g
on r.Rune_Id=g.perks