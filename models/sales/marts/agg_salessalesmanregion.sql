with agg_salessalesmanregion as (
  select
    salesorderheader.salespersonid
    , address.city
    , stateprovince.stateprovincecode
    , stateprovince.name as stateprovincename
    , stateprovince.countryregioncode
    , countryregion.name as countryregionname
    , salesorderheader.subtotal
    , salesorderheader.totaldue

  from {{ ref('stg_sap_adw__salesorderheader') }} as salesorderheader

  left join {{ ref('stg_sap_adw__address') }} as address
  on salesorderheader.billtoaddressid = address.addressid

  left join {{ ref('stg_sap_adw__stateprovince') }} as stateprovince
  on address.stateprovinceid = stateprovince.stateprovinceid

  left join {{ ref('stg_sap_adw__countryregion') }} as countryregion
  on stateprovince.countryregioncode = countryregion.countryregioncode

  group by salesorderheader.salespersonid, address.city, stateprovince.stateprovincecode, stateprovincename, stateprovince.countryregioncode, countryregionname, subtotal, totaldue
)

select * from agg_salessalesmanregion
