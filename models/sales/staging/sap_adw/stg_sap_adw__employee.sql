with source as (
    select * from {{ source('sap_adw', 'employee') }}
),

employee as (
    select
        {{ dbt_utils.generate_surrogate_key(['businessentityid', 'loginid']) }} as employee_sk
        , cast(nationalidnumber as string) as nationalidnumber
        , cast(sickleavehours as integer) as sickleavehours
        , cast(loginid as string) as loginid
        , cast(currentflag as boolean) as currentflag
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(gender as string) as gender
        , cast(hiredate as timestamp) as hiredate
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(salariedflag as boolean) as salariedflag
        , cast(birthdate as timestamp) as birthdate
        , cast(maritalstatus as string) as maritalstatus
        , cast(organizationnode as string) as organizationnode
        , cast(businessentityid as integer) as businessentityid
        , cast(vacationhours as integer) as vacationhours
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(jobtitle as string) as jobtitle

    from source
)

select * from employee
