#email_aggr

WITH cpm AS (
  SELECT 
    FORMAT_DATE('%Y-%m', DATE(date_transaction)) AS annee_mois
    ,canal_last
    ,COUNT(DISTINCT campagne_last) AS total_campaigns
    ,SUM(revenus_achats) AS total_revenus
    ,COUNT(DISTINCT id_transaction) AS total_transactions
    ,500 AS monthly_cost
  FROM {{ ref('email') }}
  GROUP BY 
    FORMAT_DATE('%Y-%m', DATE(date_transaction))
    ,canal_last
)

SELECT 
  email.campagne_last AS campagne
  ,email.canal_last AS canal
  ,SUM(email.revenus_achats) AS revenus_campagne_mois
  ,FORMAT_DATE('%Y-%m', DATE(email.date_transaction)) AS annee_mois
  ,(500 / cpm.total_campaigns) AS campagne_total_spend
FROM {{ ref('email') }} AS email
JOIN cpm
  ON FORMAT_DATE('%Y-%m', DATE(email.date_transaction)) = cpm.annee_mois
  AND email.canal_last = cpm.canal_last
GROUP BY 
  email.campagne_last
  ,email.canal_last
  ,annee_mois
  ,cpm.total_campaigns
  ,cpm.total_revenus
ORDER BY 
  annee_mois
  ,email.campagne_last