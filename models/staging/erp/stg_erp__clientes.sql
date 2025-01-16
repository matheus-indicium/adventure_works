with
    fonte_clientes as (
        select
             cast(customerid as int)     as pk_cliente
            ,cast(storeid as int)        as fk_loja
            ,cast(personid as int)       as identificador_pessoal
            ,cast(territoryid as int)    as territorio
        from
            {{ source('erp', 'customer') }}
    )

select * from fonte_clientes