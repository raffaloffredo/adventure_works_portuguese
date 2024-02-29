with source as (
    select * from {{ source('sap_adw', 'salesperson') }}
),

salesperson as (
    select
        {{ dbt_utils.generate_surrogate_key(['businessentityid', 'saleslastyear', 'territoryid', 'commissionpct']) }} as salesperson_sk
        , cast(salesquota as numeric) as salesquota
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(saleslastyear as numeric) as saleslastyear
        , cast(commissionpct as numeric) as commissionpct
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(territoryid as integer) as territoryid
        , cast(bonus as numeric) as bonus
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(businessentityid as integer) as businessentityid
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(salesytd as numeric) as salesytd

    from source
)

select * from salesperson
