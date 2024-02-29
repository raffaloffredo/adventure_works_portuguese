with source as (
    select * from {{ source('sap_adw', 'person') }}
),

person as (
    select
        {{ dbt_utils.generate_surrogate_key(['businessentityid', 'firstname', 'lastname']) }} as person_sk
        , cast(lastname as string) as lastname
        , cast(persontype as string) as persontype
        , cast(namestyle as boolean) as namestyle
        , cast(suffix as string) as suffix
        , cast(modifieddate as timestamp) as modifieddate
        , cast(rowguid as string) as rowguid
        , cast(_sdc_table_version as integer) as _sdc_table_version
        , cast(emailpromotion as integer) as emailpromotion
        , cast(_sdc_received_at as timestamp) as _sdc_received_at
        , cast(_sdc_sequence as integer) as _sdc_sequence
        , cast(title as string) as title
        , cast(businessentityid as integer) as businessentityid
        , cast(_sdc_batched_at as timestamp) as _sdc_batched_at
        , cast(firstname as string) as firstname
        , cast(middlename as string) as middlename

    from source
)

select * from person
