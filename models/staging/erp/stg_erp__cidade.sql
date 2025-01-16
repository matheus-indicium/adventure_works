with
    fonte_cidade as (
        select
             cast(addressid as int)      as pk_endereco
            ,cast(city as string)        as cidade
            ,cast(postalcode as int)     as codigo_postal
        from
            {{ source('erp', 'address') }}
    )

select * from fonte_cidade