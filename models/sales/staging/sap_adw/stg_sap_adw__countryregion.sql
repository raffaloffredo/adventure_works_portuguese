with 

source as (

    select * from {{ source('sap_adw', 'countryregion') }}

),

countryregion as (

    select
        countryregioncode,
        modifieddate,
        name,
        _sdc_sequence,
        _sdc_table_version,
        _sdc_received_at,
        _sdc_batched_at

    from source

)

select * from countryregion
