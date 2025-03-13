#email_aggr

WITH cpm AS (
  SELECT 
    mois_annee
    ,canal_last
    ,COUNT(DISTINCT campagne_last) AS total_campaigns
    ,SUM(revenus_achats) AS total_revenus
    ,COUNT(DISTINCT id_transaction) AS total_transactions
    ,500 AS monthly_cost
  FROM frenchy-453317.dbt_frenchy.email
  GROUP BY 
    mois_annee
    ,canal_last
)
,calcul AS (
  SELECT 
    email.campagne_last AS campagne
    ,email.mois_annee
    ,email.canal_last AS canal
    ,CAST(EXTRACT(MONTH FROM PARSE_DATE('%Y-%m', email.mois_annee)) AS STRING) AS month
    ,(500 / cpm.total_campaigns) AS campagne_total_spend
    ,CONCAT(email.mois_annee, "_", email.campagne_last) AS mois_annee_campagne
    ,COUNT(email.mois_annee) AS nb_conversion_campagne_mois
    ,SUM(email.revenus_achats) AS revenus_campagne_mois
  FROM frenchy-453317.dbt_frenchy.email AS email
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
)

SELECT
  *
  ,ROUND(campagne_total_spend / nb_conversion_campagne_mois, 2) AS CPA
  ,ROUND((revenus_campagne_mois - campagne_total_spend) / campagne_total_spend *100,2) AS ROI
  ,ROUND(revenus_campagne_mois / campagne_total_spend, 2) AS ROAS
FROM calcul