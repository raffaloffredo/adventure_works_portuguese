with 

source as (

    select * from {{ source('sap_adw', 'salesterritory') }}

),

salesterritory as (

    select
        group,
        countryregioncode,
        modifieddate,
        rowguid,
        saleslastyear,
        name,
        _sdc_table_version,
        territoryid,
        costytd,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        costlastyear,
        salesytd

    from source

)

select * from salesterritory
