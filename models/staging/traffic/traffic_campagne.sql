select
    campagne
    ,date_heure
    , SUM(nouveaux_utilisateur) as nouveaux_utilisateurs
    , sum(utilisateurs_connus) as utilisateurs_connus
    , SUM(nb_acheteur_total) as nb_acheteur_total
    , sum (nouveaux_acheteurs) as nb_acheteurs_nouveaux
    , round(sum(revenu_total)) as revenu_total
    , round(sum(nb_achats)) as nb_achats
    , ROUND(avg(moyenne_achats_par_acheteur)) as moyenne_achats_par_acheteur
    , round(AVG(panier_moyen)) as panier_moyen
    , ROUND(AVG(taux_conversion)) as taux_conversion
from {{ ref("stg_traffic__traffic") }}
group by campagne, date_heure
