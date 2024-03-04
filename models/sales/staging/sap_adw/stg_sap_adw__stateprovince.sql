with source as (
    select * from {{ source('sap_adw', 'stateprovince') }}
),

stateprovince as (
    select
        {{ dbt_utils.generate_surrogate_key(['stateprovinceid']) }} as stateprovince_sk
        , cast(stateprovinceid as integer) as stateprovinceid
        , cast(countryregioncode as string) as countryregioncode
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(name as string) as name
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(territoryid as integer) as territoryid
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(isonlystateprovinceflag as boolean) as isonlystateprovinceflag
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(stateprovincecode as string) as stateprovincecode

    from source
)

select * from stateprovince
