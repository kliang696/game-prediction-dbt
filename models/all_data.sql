{{
    config(
        materialized='table'
    )
}}

WITH rank_info AS (
    SELECT * EXCEPT(Date)
    FROM {{ source('game_stats', 'rank_info')}}
),
game_info AS (
    SELECT * EXCEPT(Date)
    FROM {{ source('game_stats', 'game_info')}}
)
SELECT
    r.summonerName,r.summonerId,r.tier,r.rank, r.leaguePoints,
    g.championName,g.individualPosition,g.goldEarned,g.totalMinionsKilled,g.kills,g.deaths,g.assists,g.item0,
    g.item1,g.item2,g.item3,g.item4,g.item5,g.item6,g.perks,g.win
FROM rank_info AS r
INNER JOIN game_info AS g
ON r.summonerId = g.summonerId