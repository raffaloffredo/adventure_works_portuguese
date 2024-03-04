with source as (
    select * from {{ source('sap_adw', 'productsubcategory') }}
),

productsubcategory as (
    select
        {{ dbt_utils.generate_surrogate_key(['productsubcategoryid']) }} as productsubcategory_sk
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(productcategoryid as integer) as productcategoryid
        , cast(name as string) as name
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(productsubcategoryid as integer) as productsubcategoryid
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at

    from source
)

select * from productsubcategory
