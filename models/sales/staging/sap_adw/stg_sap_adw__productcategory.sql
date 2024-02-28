with source as (
    select * from {{ source('sap_adw', 'productcategory') }}
),

productcategory as (
    select
        cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(productcategoryid as integer) as productcategoryid
        , cast(name as string) as name
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at

    from source
)

select * from productcategory
