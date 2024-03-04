with agg_salessalesmanregion as (
  select
    orderid
    , employeefirstname
    , employeelastname
    , city
    , stateprovincecode
    , stateprovincename
    , countryregioncode
    , countryregionname
    , subtotal
    , totaldue

  from {{ ref('fct_sales') }}

  group by orderid, employeefirstname, employeelastname, city, stateprovincecode, stateprovincename, countryregioncode, countryregionname, subtotal, totaldue
)

select * from agg_salessalesmanregion
