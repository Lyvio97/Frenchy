# transac_aggr

WITH cpm AS (
    SELECT 
        FORMAT_DATE('%Y-%m', DATE(date_transaction)) AS mois_annee
        ,canal_last AS canal
        ,COUNT(DISTINCT campagne_last) AS total_campaigns
        ,SUM(revenus_achats) AS total_revenus
        ,COUNT(DISTINCT id_transaction) AS nb_transactions
    FROM {{ ref('transactions_clean') }}
    GROUP BY 
        FORMAT_DATE('%Y-%m', DATE(date_transaction))
        ,canal_last
)

SELECT 
    tc.campagne_last
    ,tc.canal_last
    ,SUM(tc.revenus_achats) AS revenus_campagne_mois
	,FORMAT_DATE('%Y-%m', DATE(tc.date_transaction)) AS mois_annee
	,SUM(nb_transactions) as nb_transaction
FROM {{ ref('transactions_clean') }} AS tc
JOIN cpm
	ON FORMAT_DATE('%Y-%m', DATE(tc.date_transaction)) = cpm.mois_annee
	AND tc.canal_last = cpm.canal
GROUP BY
	tc.campagne_last
    ,tc.canal_last
    ,mois_annee
    ,cpm.total_campaigns
    ,cpm.total_revenus
ORDER BY 
    mois_annee
    ,tc.campagne_last