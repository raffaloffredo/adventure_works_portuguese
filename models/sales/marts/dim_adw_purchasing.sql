with dim_adw_purchasing as (
    select 
        {{ dbt_utils.generate_surrogate_key(['shipcompanyname']) }} as purchasing_sk
        , shipmethodid
	    , shipcompanyname
	    , shipbase
	    , shiprate
	
    from {{ ref('stg_sap_adw__shipmethod') }}
)

select * from dim_adw_purchasing