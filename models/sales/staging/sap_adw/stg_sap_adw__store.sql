with 

source as (

    select * from {{ source('sap_adw', 'store') }}

),

store as (

    select
        salespersonid,
        modifieddate,
        rowguid,
        name,
        _sdc_table_version,
        _sdc_received_at,
        _sdc_sequence,
        businessentityid,
        _sdc_batched_at

    from source

)

select * from store
