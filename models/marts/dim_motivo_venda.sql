with
    dim_motivo_venda as (
        select * from {{ ref('stg_erp__tipo_motivo_venda') }}
    )

select * from dim_motivo_venda