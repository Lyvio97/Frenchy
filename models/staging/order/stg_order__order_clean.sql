with 

source as (

    select * from {{ source('order', 'order_clean') }}

),

renamed as (

    select
        customer_id,
        financial_status,
        paid_at,
        fulfillment_status,
        fulfilled_at,
        accepts_marketing,
        currency,
        subtotal,
        shipping,
        taxes,
        total,
        discount_code,
        discount_amount,
        shipping_method,
        created_at,
        lineitem_quantity,
        lineitem_name,
        lineitem_price,
        lineitem_compare_at_price,
        lineitem_sku,
        lineitem_requires_shipping,
        lineitem_taxable,
        lineitel_fulfillment_status,
        billing_city,
        billing_zip,
        billing_province,
        billing_country,
        cancelled_at,
        payment_method,
        refunded_amount,
        vendor,
        outstanding_balance,
        employee,
        location,
        device_id,
        id,
        tags,
        risk_level,
        source_traffic,
        lineitem_discount,
        tax_1_name,
        tax_2_value,
        tax_2_name,
        tax_2_value_1,
        tax_3_name,
        tax_3_value,
        tax_4_name,
        tax_4_value,
        tax_5_name,
        tax_5_value,
        receipt_number

    from source

)

select * from renamed
