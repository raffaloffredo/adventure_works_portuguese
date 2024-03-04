with dim_adw_salesman as (
    select
        {{ dbt_utils.generate_surrogate_key(['salesperson_sk', 'employee_sk', 'person_sk']) }} as salesman_sk
        , salesperson.businessentityid
        , salesperson.territoryid
        , employee.jobtitle as employeejobtitle
        , person.firstname as employeefirstname
        , person.middlename as employeemiddlename
        , person.lastname as employeelastname
        , salesperson.salesquota
        , salesperson.bonus
        , salesperson.commissionpct
        , salesperson.salesytd
        , salesperson.saleslastyear

    from {{ ref('stg_sap_adw__salesperson') }} as salesperson

    left join {{ ref('stg_sap_adw__employee') }} as employee
    on salesperson.businessentityid = employee.businessentityid

    left join {{ ref('stg_sap_adw__person') }} as person
    on employee.businessentityid = person.businessentityid
)

select * from dim_adw_salesman
