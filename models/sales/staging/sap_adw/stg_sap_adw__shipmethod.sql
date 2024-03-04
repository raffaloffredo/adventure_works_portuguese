with source as (
    select * from {{ source('sap_adw', 'shipmethod') }}
),

shipmethod as (
    select
        {{ dbt_utils.generate_surrogate_key(['shipmethodid']) }} as shipmethod_sk
        , cast(shipmethodid as integer) as shipmethodid
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(name as string) as shipcompanyname
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(shiprate as numeric) as shiprate
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(shipbase as numeric) as shipbase

    from source
)

select * from shipmethod
