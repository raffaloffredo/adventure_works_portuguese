with source as (
    select * from {{ source('sap_adw', 'salesorderdetail') }}
),

salesorderdetail as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderdetailid']) }} as salesorderdetail_sk
        , cast(orderqty as integer) as orderqty
        , cast(salesorderid as integer) as salesorderid
        , cast(salesorderdetailid as integer) as salesorderdetailid
        , cast(unitprice as numeric) as unitprice
        , cast(specialofferid as integer) as specialofferid
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(productid as integer) as productid
        , cast( _sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) _sdc_sequence
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(carriertrackingnumber as string) as carriertrackingnumber
        , cast(unitpricediscount as numeric) unitpricediscount

    from source
)

select * from salesorderdetail
