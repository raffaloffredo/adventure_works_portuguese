with dim_adw_customer as (
    select
        {{ dbt_utils.generate_surrogate_key(['customerid']) }} as customer_sk
        , salesorderheader.salesorderid
        , salesorderheader.customerid
        , salesorderheader.salespersonid
        , person.firstname as customerfirstname
        , person.middlename as customermiddlename
        , person.lastname as customerlastname
        , address.addressid
        , address.city
        , stateprovince.stateprovinceid
        , stateprovince.stateprovincecode
        , stateprovince.name as stateprovincename
        , stateprovince.countryregioncode
        , countryregion.name as countryregionname
        , stateprovince.territoryid
        , salesterritory.territorygroup

    from {{ ref('stg_sap_adw__salesorderheader') }} as salesorderheader

    left join {{ ref('stg_sap_adw__person') }} as person
    on salesorderheader.customerid = person.businessentityid

    left join {{ ref('stg_sap_adw__address') }} as address
    on salesorderheader.billtoaddressid = address.addressid

    left join {{ ref('stg_sap_adw__stateprovince') }} as stateprovince
    on address.stateprovinceid = stateprovince.stateprovinceid

    left join {{ ref('stg_sap_adw__countryregion') }} as countryregion
    on stateprovince.countryregioncode = countryregion.countryregioncode

    left join {{ ref('stg_sap_adw__salesterritory') }} as salesterritory
    on stateprovince.territoryid = salesterritory.territoryid
)

select * from dim_adw_customer
