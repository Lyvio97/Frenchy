
Select 
campagne
, `month`
, round(AVG(panier_moyen)) as panier_moyen

from {{ ref('stg_traffic__traffic') }}
group by campagne, `month`