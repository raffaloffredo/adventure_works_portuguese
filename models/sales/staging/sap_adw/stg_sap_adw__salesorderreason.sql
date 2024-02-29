with source as (
    select * from {{ source('sap_adw', 'salesreason') }}
),

salesreason as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesreasonid']) }} as salesreason_sk
        , cast(reasontype as string) as reasontype
        , cast(modifieddate as timestamp) as modifieddate
        , cast(name as string) as salesreasonname
        , cast(salesreasonid as integer) as salesreasonid
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_batched_at as timestamp) _sdc_batched_at

    from source
)

select * from salesreason
