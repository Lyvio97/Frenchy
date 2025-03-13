with 

source as (

    select * from {{ source('Central', 'paid_boolean') }}

),

renamed as (

    select
        int64_field_0,
        canal,
        paid

    from source

)

select * from renamed
