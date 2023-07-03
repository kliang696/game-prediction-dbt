SELECT *
FROM {{ ref('mydata') }}
WHERE rank > 5