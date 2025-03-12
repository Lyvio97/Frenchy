with 

source as (

    select * from {{ source('traffic', 'traffic_par_date') }}

),

renamed as (

    select
        date_et_heure__aaaammjjhh_,
        source_de_la_session,
        support_de_la_session,
        campagne_de_la_session,
        id_de_campagne_de_la_session,
        nombre_total_d_utilisateurs,
        nouveaux_utilisateurs,
        utilisateurs_connus,
        acheteurs__au_total_,
        revenu_total,
        dur__e_d_engagement_moyenne_par_session,
        revenus_moyens_des_achats_par_utilisateur_actif,
        sessions_avec_engagement_par_utilisateur_actif,
        __v__nements_cl__s,
        taux_d___v__nements_cl__s_par_utilisateur

    from source

)

select * from renamed
