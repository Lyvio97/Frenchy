with 

source as (

    select * from {{ source('Central', 'ads') }}

),

renamed as (

    select
        campagne,
        mois_annee,
        canal,
        mois,
        campagne_total_spend,
        mois_annee_campagne,
        nb_conversion_campagne_mois,
        revenus_campagne_mois,
        cpa,
        roi,
        paid

    from source

)

select * from renamed
