with source as (
    select * from {{ source('sap_adw', 'store') }}
),

store as (
    select
        cast(salespersonid as integer) as salespersonid
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(name as string) as name
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(businessentityid as integer) as businessentityid
        , cast(_sdc_batched_at as timestamp) as timestamp

    from source
)

select * from store
