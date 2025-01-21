with
    fonte_clientes as (
        select
             cast(customerid as int)     as pk_cliente
            ,cast(personid as int)       as sk_pessoa
        from
            {{ source('erp', 'customer') }}
    )

select * from fonte_clientes