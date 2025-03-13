with 

source as (

    select * from {{ source('traffic', 'traffic') }}

),

renamed as (

    select
        CONCAT(`month`,"_", campagne) as mois_annee_campagne,
        canal,
        date_heure,
        date_simple,
        `month`,
        source.source,
        support,
        campagne,
        nouveaux_utilisateur,
        utilisateurs_connus,
        nouveaux_acheteurs,
        nb_acheteur_total,
        moyenne_achats_par_acheteur,
        revenu_total,
        nb_achats,
        taux_de_rebond,
        panier_moyen,
        round(safe_divide(nb_acheteur_total , (nouveaux_utilisateur + utilisateurs_connus))) as taux_conversion

    from source

)

select * from renamed
