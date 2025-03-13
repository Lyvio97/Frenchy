
with 

source as (

    select * from {{ source('traffic', 'traffic') }}

),

renamed as (

    select
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
        panier_moyen

    from source

)

select * from renamed
