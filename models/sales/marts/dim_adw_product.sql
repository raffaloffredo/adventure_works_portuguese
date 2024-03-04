 with dim_adw_product as (
    select
        {{ dbt_utils.generate_surrogate_key(['product.productid', 'product.productnumber']) }} as dimproduct_sk
        , product.productid
        , product.productsubcategoryid
        , product.name as productname
        , product.standardcost
        , product.listprice
        , product.productline
        , product.style
        , productcategory.name as categoryname
        , productsubcategory.name as subcategoryname

    from {{ ref('stg_sap_adw__product') }} as product

    left join {{ ref('stg_sap_adw__productsubcategory') }} as productsubcategory
    on product.productsubcategoryid = productsubcategory.productsubcategoryid

    left join {{ ref('stg_sap_adw__productcategory') }} as productcategory
    on productsubcategory.productcategoryid = productcategory.productcategoryid
)

select * from dim_adw_product
