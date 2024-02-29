with source as (
    select * from {{ source('sap_adw', 'countryregion') }}
),

countryregion as (
    select
        {{ dbt_utils.generate_surrogate_key(['countryregioncode']) }} as countryregioncode_sk
        , cast(countryregioncode as string) as countryregioncode
        , cast(modifieddate as timestamp) as modifieddate
        , cast(name as string) as name
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_batched_at as timestamp) as sdc_batched_at

    from source
)

select * from countryregion
