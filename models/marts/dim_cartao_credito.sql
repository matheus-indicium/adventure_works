with
    dim_cartao_credito as (
        select * from {{ ref('stg_erp__cartao_credito') }}
    )

select * from dim_cartao_credito