with
    dim_produtos as (
        select * from {{ ref('stg_erp__produtos') }}
    )

select * from dim_produtos