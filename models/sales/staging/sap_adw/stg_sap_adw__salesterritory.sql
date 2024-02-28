with source as (
    select * from {{ source('sap_adw', 'salesterritory') }}
),

salesterritory as (
    select
        cast("group" as string) as territorygroup
        , cast(countryregioncode as string) as countryregioncode
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(saleslastyear as numeric) as saleslastyear
        , cast(name as string) as name
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(territoryid as integer) as territoryid
        , cast(costytd as numeric) as costytd
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(costlastyear as numeric) as costlastyear
        , cast(salesytd as numeric) as salesytd

    from source
)

select * from salesterritory
