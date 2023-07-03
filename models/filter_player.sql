{{
    config(
        materialized='table'
    )
}}
SELECT *
FROM {{ ref('all_data') }}
WHERE summonerName = 'F9 Cudge'