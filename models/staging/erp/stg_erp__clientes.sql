with
    fonte_clientes as (
        select
             cast(customerid as int)     as pk_cliente
            ,cast(personid as int)       as fk_pessoa
        from
            {{ source('erp', 'customer') }}
    )

select * from fonte_clientes