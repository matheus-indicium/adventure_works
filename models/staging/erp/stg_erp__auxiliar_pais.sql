with
    fonte_auxiliar_pais as (
        select
             cast(countryregioncode as varchar) as pk_pais
            ,cast(name as varchar)              as nome_pais
        from
            {{ source('erp', 'countryregion') }}
    )

select * from fonte_auxiliar_pais