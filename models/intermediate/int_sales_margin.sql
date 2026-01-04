SELECT
    CAST(p.purchse_price AS FLOAT64) * s.quantity AS purchase_cost,
    s.revenue - (CAST(p.purchse_price AS FLOAT64) * s.quantity) AS margin
FROM {{ source('raw', 'product') }} AS p
INNER JOIN {{ source('raw', 'sales') }} AS s
    ON p.products_id = s.pdt_id
