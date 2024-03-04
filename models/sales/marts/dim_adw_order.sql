with dim_adw_order as (
    select 
        {{ dbt_utils.generate_surrogate_key(['salesorderheader.salesorderid', 'productid']) }} as order_sk
        , salesorderheader.salesorderid as orderid
        , salesorderheader.orderdate
        , salesorderdetail.productid
        , salesorderdetail.orderqty
        , salesorderdetail.unitprice
        , salesorderdetail.unitpricediscount
        , salesorderheader.freight
        , salesorderheader.onlineorderflag
        , salesorderheader.revisionnumber
        , salesorderheader.customerid
        , salesorderheader.salespersonid
        , salesorderheader.shipdate
        , salesorderheader.status as shipstatus
        , salesorderheader.subtotal
        , salesorderheader.taxamt
        , salesorderheader.totaldue
        , salesorderheader.billtoaddressid
        , salesorderheader.shipmethodid
	    , shipmethod.shipcompanyname
        , salesreason.reasontype
        , salesreason.salesreasonname
	
    from {{ ref('stg_sap_adw__salesorderheader') }} as salesorderheader

    left join {{ ref('stg_sap_adw__salesorderdetail') }} as salesorderdetail
    on salesorderheader.salesorderid = salesorderdetail.salesorderid

    left join {{ ref('stg_sap_adw__shipmethod') }} as shipmethod
    on salesorderheader.shipmethodid = shipmethod.shipmethodid

    left join {{ ref('stg_sap_adw__salesorderheadersalesreason') }} as salesorderheadersalesreason
    on salesorderheader.salesorderid = salesorderheadersalesreason.salesreasonid

    left join {{ ref('stg_sap_adw__salesreason') }} as salesreason
    on salesorderheadersalesreason.salesreasonid = salesreason.salesreasonid
)

select * from dim_adw_order