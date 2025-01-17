with
    dim_regioes as (
        select * from {{ ref('int_vendas__prep_regioes') }}
    )

select * from dim_regioes