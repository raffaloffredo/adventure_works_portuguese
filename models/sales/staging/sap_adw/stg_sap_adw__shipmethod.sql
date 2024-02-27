with 

source as (

    select * from {{ source('sap_adw', 'shipmethod') }}

),

shipmethod as (

    select
        shipmethodid,
        modifieddate,
        rowguid,
        name,
        _sdc_table_version,
        shiprate,
        _sdc_received_at,
        _sdc_sequence,
        _sdc_batched_at,
        shipbase

    from source

)

select * from shipmethod
