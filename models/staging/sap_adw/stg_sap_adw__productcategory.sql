with 

source as (

    select * from {{ source('sap_adw', 'productcategory') }}

),

productcategory as (

    select
        modifieddate,
        rowguid,
        productcategoryid,
        name,
        _sdc_sequence,
        _sdc_table_version,
        _sdc_received_at,
        _sdc_batched_at

    from source

)

select * from productcategory
