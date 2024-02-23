with 

source as (

    select * from {{ source('sap_adw', 'salesreason') }}

),

salesreason as (

    select
        reasontype,
        modifieddate,
        name,
        salesreasonid,
        _sdc_sequence,
        _sdc_table_version,
        _sdc_received_at,
        _sdc_batched_at

    from source

)

select * from salesreason
