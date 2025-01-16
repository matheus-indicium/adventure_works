with
    fonte_ordens_venda_pedido as (
        select
             cast(salesorderid as int)          as pk_ordem_venda_pedido
            ,cast(creditcardid as int)          as fk_cartao_credito
            ,cast(customerid as int)            as fk_cliente
            ,cast(shiptoaddressid as int)       as fk_endereco_entrega
            ,cast(billtoaddressid as int)       as fk_endereco_faturamento
            ,cast(orderdate as date)            as data_venda_pedido
            ,cast(status as string)             as status
        from
            {{ source('erp', 'salesorderheader') }}
    )

select * from fonte_ordens_venda_pedido