with
    fonte_tipo_motivo_venda as (
        select
            cast(salesreasonid as int)    as pk_motivo_venda
            ,cast(name as string)         as descricao_motivo_venda
            ,cast(reasontype as string)   as tipo_motivo_venda
        from
            {{ source('erp', 'salesreason') }}
    )

select * from fonte_tipo_motivo_venda