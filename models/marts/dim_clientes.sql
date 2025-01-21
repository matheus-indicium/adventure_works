with
    dim_clientes as (
        select * from {{ ref('int_vendas__prep_clientes') }}
    )

select * from dim_clientes