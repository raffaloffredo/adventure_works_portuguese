with fct_sales as (
    select  
        salesorderheader.salesorderid
        , salesorderheader.revisionnumber
        , salesorderheader.salespersonid
        , salesorderheader.orderdate
        , salesorderheader.duedate
        , salesorderheader.shipdate
        , salesorderheader.status
        , salesorderheader.onlineorderflag
        , salesorderheader.subtotal
        , salesorderheader.taxamt
        , salesorderheader.freight
        , salesorderheader.totaldue
        , salesorderheader.shipmethodid
        , address.stateprovinceid
        , stateprovince.territoryid
        , salesterritory.salesterritoryname
        , salesterritory.countryregioncode
        , salesterritory.territorygroup
        , salesterritory.salesytd
        , salesterritory.saleslastyear
        , salesorderdetail.salesorderdetailid
        , salesorderdetail.productid
        , salesorderdetail.orderqty
        , salesorderdetail.unitprice
        , salesorderdetail.unitpricediscount
        , salesreason.salesreasonname
        , salesreason.reasontype

    from {{ ref('stg_sap_adw__salesorderheader') }} as salesorderheader

    left join {{ ref('stg_sap_adw__address') }} as address
    on salesorderheader.billtoaddressid = address.addressid

    left join {{ ref('stg_sap_adw__stateprovince') }} as stateprovince
    on address.stateprovinceid = stateprovince.stateprovinceid

    left join {{ ref('stg_sap_adw__salesterritory') }} as salesterritory
    on salesorderheader.territoryid = salesterritory.territoryid

    left join {{ ref('stg_sap_adw__salesorderdetail') }} as salesorderdetail
    on salesorderheader.salesorderid = salesorderdetail.salesorderid

    left join {{ ref('stg_sap_adw__salesorderheadersalesreason') }} as salesorderheadersalesreason
    on salesorderheader.salesorderid = salesorderheadersalesreason.salesorderid

    left join {{ ref('stg_sap_adw__salesreason') }} as salesreason
    on salesorderheadersalesreason.salesreasonid = salesreason.salesreasonid
)

select * from fct_sales
