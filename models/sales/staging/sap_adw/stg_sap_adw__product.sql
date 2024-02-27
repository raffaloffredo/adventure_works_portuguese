with 

source as (

    select * from {{ source('sap_adw', 'product') }}

),

product as (

    select
        sellenddate,
        safetystocklevel,
        finishedgoodsflag,
        class,
        makeflag,
        productnumber,
        reorderpoint,
        modifieddate,
        rowguid,
        productmodelid,
        weightunitmeasurecode,
        standardcost,
        name,
        _sdc_table_version,
        style,
        sizeunitmeasurecode,
        productid,
        productsubcategoryid,
        _sdc_received_at,
        _sdc_sequence,
        listprice,
        daystomanufacture,
        productline,
        size,
        _sdc_batched_at,
        color,
        sellstartdate,
        weight

    from source

)

select * from product
