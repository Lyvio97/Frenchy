#email_aggr

WITH cpm AS (
  SELECT 
    mois_annee
    ,canal_last
    ,COUNT(DISTINCT campagne_last) AS total_campaigns
    ,SUM(revenus_achats) AS total_revenus
    ,COUNT(DISTINCT id_transaction) AS total_transactions
    ,500 AS monthly_cost
  FROM {{ ref('email') }}
  GROUP BY 
    mois_annee
    ,canal_last
)

SELECT 
  email.campagne_last AS campagne
  ,email.mois_annee
  ,email.canal_last AS canal
  ,CAST(EXTRACT(MONTH FROM PARSE_DATE('%Y-%m', email.mois_annee)) AS STRING) AS month
  ,(500 / cpm.total_campaigns) AS campagne_total_spend
  ,SUM(email.revenus_achats) AS revenus_campagne_mois
  ,CONCAT(email.mois_annee, "_", email.campagne_last) AS mois_annee_campagne
FROM {{ ref('email') }} AS email
JOIN cpm
  ON FORMAT_DATE('%Y-%m', DATE(email.date_transaction)) = cpm.mois_annee
  AND email.canal_last = cpm.canal_last
GROUP BY 
  email.campagne_last
  ,email.mois_annee
  ,email.canal_last
  ,CAST(EXTRACT(MONTH FROM PARSE_DATE('%Y-%m', email.mois_annee)) AS STRING)
  ,(500 / cpm.total_campaigns)
ORDER BY 
  mois_annee
  ,email.campagne_last