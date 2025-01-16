with
    fonte_produtos as (
        select
            cast(productid as int)   as pk_produto
            ,cast(name as string)    as nome_produto
        from
            {{ source('erp', 'product') }}
    )

select * from fonte_produtos