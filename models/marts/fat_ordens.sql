with
    fat_ordens as (
        select * from {{ ref('int_vendas__prep_ordens') }}
    )

select * from fat_ordens