with 

source as (

    select * from {{ source('sap_adw', 'salesorderheader') }}

),

salesorderheader as (

    select
        purchaseordernumber,
        shipmethodid,
        salesorderid,
        billtoaddressid,
        salespersonid,
        modifieddate,
        rowguid,
        taxamt,
        shiptoaddressid,
        onlineorderflag,
        _sdc_table_version,
        territoryid,
        status,
        currencyrateid,
        orderdate,
        _sdc_received_at,
        _sdc_sequence,
        creditcardapprovalcode,
        subtotal,
        creditcardid,
        revisionnumber,
        freight,
        duedate,
        totaldue,
        customerid,
        shipdate,
        _sdc_batched_at,
        accountnumber

    from source

)

select * from salesorderheader
