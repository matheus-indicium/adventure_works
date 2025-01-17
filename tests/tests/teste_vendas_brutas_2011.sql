
/*
O teste tem como finalidade validar se as vendas são serão
alteradas após as etapas de transformação do dado. O valor
que temos como base são as vendas brutas de 2011 no valor
de: $12.646.112,16
*/


with
    vendas_brutas_2011 as (
        select
            sum(preco_unitario * qtd_comprada) as validacao
        from
            {{ ref('fat_ordens') }}
        where
            data_venda_pedido between '2011-01-01' and '2011-12-31'
    )

select
    validacao
from
    vendas_brutas_2011
where
    validacao not between 12646111.16 and 12646113.16