with 

source as (

    select * from {{ source('transaction', 'transactions') }}

),

renamed as (

    select
        `id de la transaction`,
        `page destination chaine requete`,
        `achats d'e-commerce`,
        `quantité achetée e-commerce`,
        `revenus issus des achats`,
        `premier source_support manuel de l'utilisateur`,
        `campagne de la derniere session`,
        `date de la première session`,
        `groupe de canaux par défaut pour la session`,
        `groupe de canaux principal de la session groupe de canaux par défaut`,
        `id de campagne de la derniere session`,
        `id de la première campagne de l'utilisateur`,
        `id du premier groupe dannonces ga de lutilisateur`,
        `pays`,
        `plate_forme source de la derniere session`,
        `premier support de l'utilisateur`,
        `première campagne de l'utilisateur`,
        `première combinaison source support de l'utilisateur`,
        `première plate-forme source de l'utilisateur`,
        `groupe de canaux par défaut pour le premier utilisateur`,
        `source de la derniere session`,
        `support de la dernière session`,
        `ville`,
        `date_date`

    from source

)

select * from renamed
