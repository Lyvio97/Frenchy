with 

source as (

    select * from {{ source('transaction', 'transaction_clean') }}

),

renamed as (

    select
        date_transaction,
        jour_semaine,
        id_transaction,
        achats_ecommerce,
        quantite_achetee,
        revenus_achats,
        page_destination,
        nom_produit,
        date_first,
        source_support_first,
        source_first,
        canal_first,
        support_first,
        plateforme_source_first,
        id_campagne_first,
        campagne_first,
        id_campagne_last,
        campagne_last,
        platforme_source_last,
        canal_last,
        support_last,
        source_last,
        ville,
        pays

    from source

)

select * from renamed
