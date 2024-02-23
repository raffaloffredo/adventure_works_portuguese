with 

source as (

    select * from {{ source('sap_adw', 'person') }}

),

person as (

    select
        lastname,
        persontype,
        namestyle,
        suffix,
        modifieddate,
        rowguid,
        _sdc_table_version,
        emailpromotion,
        _sdc_received_at,
        _sdc_sequence,
        title,
        businessentityid,
        _sdc_batched_at,
        firstname,
        middlename

    from source

)

select * from person
