Select 
campagne_last
, date_transaction
, ROUND(SUM(revenus_achats)) as revenu_total_transaction
, COUNT(id_transaction) as nb_achats_transaction

from {{ ref('transactions_clean') }}
group by campagne_last, date_transaction