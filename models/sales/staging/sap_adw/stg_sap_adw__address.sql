with source as (
    select * from {{ source('sap_adw', 'address') }}
),

address as (
    select
        cast(stateprovinceid as integer) as stateprovinceid
        , cast(city as string) as city
        , cast(addressline2 as string) as addressline2
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(postalcode as string) as postalcode
        , cast(spatiallocation as string) as spatiallocation
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(addressline1 as string) as addressline1
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(addressid as integer) as addressid

    from source
)

select * from address
