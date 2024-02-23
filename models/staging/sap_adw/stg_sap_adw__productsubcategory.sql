with 

source as (

    select * from {{ source('sap_adw', 'productsubcategory') }}

),

productsubcategory as (

    select
        modifieddate,
        rowguid,
        productcategoryid,
        name,
        _sdc_table_version,
        productsubcategoryid,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at

    from source

)

select * from productsubcategory
