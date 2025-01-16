with
    fonte_ordens_venda_motivo_venda as (
        select
             cast(MIN(salesreasonid) as int)  as pk_tipo_venda
            ,cast(salesorderid as int)       as fk_ordem_venda_pedido
        from
            {{ source('erp', 'salesorderheadersalesreason') }}
        group by all
    )

select * from fonte_ordens_venda_motivo_venda