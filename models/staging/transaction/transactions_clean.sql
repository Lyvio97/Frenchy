{{ config(materialized='table') }}

WITH temp_table1 AS (
  SELECT
    PARSE_DATETIME('%Y%m%d%H', CAST(date_date AS STRING)) AS date_transaction
    ,*
  FROM {{ ref('stg_transaction__transactions') }}
)
SELECT
  date_transaction
  ,EXTRACT(DAYOFWEEK FROM date_transaction) AS jour_semaine
  ,`ID de la transaction` AS id_transaction
  ,`Achats d'e-commerce` AS achats_ecommerce
  ,`Quantité achetée e-commerce` AS quantite_achetee
  ,`Revenus issus des achats` AS revenus_achats
  ,`page destination chaine requete` AS page_destination
  ,REGEXP_EXTRACT(`page destination chaine requete`, r'/products/([^?]+)') AS nom_produit
  ,SAFE.PARSE_DATETIME('%Y%m%d', NULLIF(`Date de la première session`, '(noset)')) AS date_first
  ,`Première combinaison source support de l'utilisateur` AS source_support_first
  ,SPLIT(`Première combinaison source support de l'utilisateur`, '/')[SAFE_OFFSET(0)] AS source_first
  ,`Groupe de canaux par défaut pour le premier utilisateur` AS canal_first
  ,`Premier support de l'utilisateur` AS support_first
  ,`Première plate-forme source de l'utilisateur` AS plateforme_source_first
  ,`ID de la première campagne de l'utilisateur` AS id_campagne_first
  ,`Première campagne de l'utilisateur` AS campagne_first
  ,`ID de campagne de la derniere session` AS id_campagne_last
  ,`Campagne de la derniere session` AS campagne_last
  ,`Plate_forme source de la derniere session` AS platforme_source_last
  ,`Groupe de canaux principal de la session Groupe de canaux par défaut` AS canal_last
  ,`Support de la dernière session` AS support_last
  ,`Source de la derniere session` AS source_last
  ,ville
  ,pays
FROM temp_table1