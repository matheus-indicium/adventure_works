with
    enriquecendo_base_pedidos as (
        select 
             ordens_venda_pedido.pk_ordem_venda_pedido
            ,ordens_venda_pedido.fk_cartao_credito
            ,ordens_venda_pedido.fk_cliente
            ,ordens_venda_pedido.fk_endereco_entrega
            ,ordens_venda_pedido.fk_endereco_faturamento
            ,ordens_venda_motivo_venda.pk_tipo_venda as fk_tipo_venda
            ,ordens_venda_pedido.data_venda_pedido
            ,ordens_venda_pedido.status
        
        from
            {{ ref('stg_erp__ordens_venda_pedido') }} ordens_venda_pedido
        left join
            {{ ref('stg_erp__ordens_venda_motivo_venda') }} ordens_venda_motivo_venda
        on
            ordens_venda_pedido.pk_ordem_venda_pedido = ordens_venda_motivo_venda.fk_ordem_venda_pedido
    ),
    join_pedido_com_item as (
    select
         ordens_venda_item.pk_ordem_venda_item
        ,enriquecendo_base_pedidos.pk_ordem_venda_pedido as fk_ordem_venda_pedido
        ,ordens_venda_item.fk_produto
        ,enriquecendo_base_pedidos.fk_cartao_credito
        ,enriquecendo_base_pedidos.fk_cliente
        ,enriquecendo_base_pedidos.fk_endereco_entrega
        ,enriquecendo_base_pedidos.fk_endereco_faturamento
        ,enriquecendo_base_pedidos.fk_tipo_venda
        ,ordens_venda_item.qtd_comprada
        ,ordens_venda_item.preco_unitario
        ,enriquecendo_base_pedidos.data_venda_pedido
        ,enriquecendo_base_pedidos.status
    from
        {{ ref('stg_erp__ordens_venda_item') }} ordens_venda_item
    left join
        enriquecendo_base_pedidos
    on
        ordens_venda_item.fk_ordem_venda_pedido = enriquecendo_base_pedidos.pk_ordem_venda_pedido
    )
select * from join_pedido_com_item