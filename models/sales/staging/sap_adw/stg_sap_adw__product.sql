with source as (
    select * from {{ source('sap_adw', 'product') }}
),

product as (
    select
        cast(sellenddate as timestamp) as sellenddate
        , cast(safetystocklevel as integer) as safetystocklevel
        , cast(finishedgoodsflag as boolean) as finishedgoodsflag
        , cast(class as string) as class
        , cast(makeflag as boolean) as makeflag
        , cast(productnumber as string) as productnumber
        , cast(reorderpoint as integer) as reorderpoint
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(productmodelid as integer) as productmodelid
        , cast(weightunitmeasurecode as string) as weightunitmeasurecode
        , cast(standardcost as numeric) as standardcost
        , cast(name as string) as name
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(style as string) as style
        , cast(sizeunitmeasurecode as string) as sizeunitmeasurecode
        , cast(productid as integer) as productid
        , cast(productsubcategoryid as integer) as productsubcategoryid
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(listprice as numeric) as listprice
        , cast(daystomanufacture as integer) as daystomanufacture
        , cast(productline as string) as productline
        , cast(size as string) as productsize
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(color as string) as color
        , cast(sellstartdate as timestamp) as sellstartdate
        , cast(weight as numeric) as weight

    from source
)

select * from product
