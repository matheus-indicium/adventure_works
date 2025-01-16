with
    fonte_ordens_venda_item as (
        select
             cast(salesorderdetailid as int)            as pk_ordem_venda_item
            ,cast(salesorderid as int)                  as fk_ordem_venda_pedido
            ,cast(productid as int)                     as fk_produto
            ,cast(orderqty as numeric(10,2))            as qtd_comprada
            ,cast(unitprice as numeric(10,2))           as preco_unitario
            ,cast(unitpricediscount as numeric(10, 2))  as desconto_unitario 
        from
            {{ source('erp', 'salesorderdetail') }}
    )

select * from fonte_ordens_venda_item