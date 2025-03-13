with 

source as (

    select * from {{ source('Central', 'transaction_agg') }}

),

renamed as (

    select
        int64_field_0,
        mois_annee_campagne,
        nb_conversion_campagne_mois,
        revenus_campagne_mois

    from source

)

select * from renamed
