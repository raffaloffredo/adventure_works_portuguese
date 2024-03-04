with fct_sales as (
    select 
        {{ dbt_utils.generate_surrogate_key(['order_sk', 'dimproduct_sk', 'customer_sk', 'salesman_sk']) }} as sales_sk
        , dim_order.order_sk as order_fk
        , dim_product.dimproduct_sk as product_fk
        , dim_customer.customer_sk as customer_fk
        , dim_salesman.salesman_sk as salesman_fk
        , dim_order.orderid
        , dim_order.revisionnumber
        , dim_order.orderdate
        , dim_order.unitprice
        , dim_order.unitpricediscount
        , dim_order.shipdate
        , dim_order.shipcompanyname
        , dim_order.shipstatus
        , dim_order.onlineorderflag
        , dim_order.subtotal
        , dim_order.taxamt
        , dim_order.freight
        , dim_order.totaldue
        , dim_order.reasontype
        , dim_order.salesreasonname
        , dim_product.productname
        , dim_order.orderqty
        , dim_product.standardcost
        , dim_product.listprice
        , dim_product.productline
        , dim_product.style
        , dim_product.categoryname
        , dim_product.subcategoryname
        , dim_customer.customerfirstname
        , dim_customer.customermiddlename
        , dim_customer.customerlastname
        , dim_customer.city
        , dim_customer.stateprovincecode
        , dim_customer.stateprovincename
        , dim_customer.countryregioncode
        , dim_customer.countryregionname
        , dim_customer.territorygroup
        , dim_salesman.employeejobtitle
        , dim_salesman.employeefirstname
        , dim_salesman.employeemiddlename
        , dim_salesman.employeelastname
        , dim_salesman.salesquota
        , dim_salesman.bonus
        , dim_salesman.commissionpct
        , dim_salesman.salesytd
        , dim_salesman.saleslastyear

    from {{ ref('dim_adw_order') }} as dim_order

    left join {{ ref('dim_adw_product') }} as dim_product
    on dim_order.productid = dim_product.productid

    left join {{ ref('dim_adw_customer') }} as dim_customer
    on dim_order.orderid = dim_customer.salesorderid

    left join {{ ref('dim_adw_salesman') }} as dim_salesman
    on dim_order.salespersonid = dim_salesman.businessentityid
)

select * from fct_sales
