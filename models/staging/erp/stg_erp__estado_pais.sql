with
    fonte_estado_pais as (
        select
             cast(stateprovinceid as int)        as pk_estado
            ,cast(name as string)                as nome_estado
            ,cast(stateprovincecode as string)   as codigo_estado
            ,cast(countryregioncode as string)    as codigo_pais
            ,cast(territoryid as int)            as territorio
        from
            {{ source('erp', 'stateprovince') }}
    )

select * from fonte_estado_pais