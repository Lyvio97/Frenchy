{{ config(materialized='table') }}

SELECT
  date_transaction
  ,id_transaction
  ,achats_ecommerce
  ,quantite_achetee
  ,revenus_achats
  ,nom_produit
  ,date_first
  ,plateforme_source_first
  ,source_first
  ,canal_first
  ,support_first
  ,id_campagne_first
  ,campagne_first
  ,platforme_source_last
  ,source_last
  ,canal_last
  ,support_last
  ,id_campagne_last
  ,campagne_last
FROM {{ ref('transactions_clean') }}
WHERE source_last = "Klaviyo"