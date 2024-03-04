with source as (
    select * from {{ source('sap_adw', 'salesorderheader') }}
),

salesorderheader as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesorderid']) }} as salesorder_sk
        , cast(purchaseordernumber as string) as purchaseordernumber
        , cast(shipmethodid as integer) as shipmethodid
        , cast(salesorderid as integer) as salesorderid
        , cast(billtoaddressid as integer) as billtoaddressid
        , cast(salespersonid as integer) salespersonid
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(taxamt as numeric) as taxamt
        , cast(shiptoaddressid as integer) as shiptoaddressid
        , cast(onlineorderflag as boolean) as onlineorderflag
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(territoryid as integer) as territoryid
        , cast(status as integer) as status
        , cast(currencyrateid as integer) as currencyrateid
        , cast(orderdate as timestamp) as orderdate
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(creditcardapprovalcode as string) as creditcardapprovalcode
        , cast(subtotal as numeric) as subtotal
        , cast(creditcardid as integer) as creditcardid
        , cast(revisionnumber as integer) as revisionnumber
        , cast(freight as numeric) as freight
        , cast(duedate as timestamp) as duedate
        , cast(totaldue as numeric) as totaldue
        , cast(customerid as integer) as customerid
        , cast(shipdate as timestamp) as shipdate
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(accountnumber as string) as accountnumber

    from source
)

select * from salesorderheader
