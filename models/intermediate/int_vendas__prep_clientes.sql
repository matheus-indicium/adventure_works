with  
    clientes as (
        select * from {{ref("stg_erp__clientes")}}
    ),
    pessoas as (
        select * from {{ref("stg_erp__pessoas")}}
    ),
    juntando_bases as (
        select
            clientes.pk_cliente
            ,clientes.fk_pessoa
            ,COALESCE(pessoas.primeiro_nome, '') || ' ' || 
            COALESCE(pessoas.nome_do_meio, '') || ' ' || 
            COALESCE(pessoas.ultimo_nome, '') as nome_completo
        from
            clientes
        left join
            pessoas
        on
            clientes.fk_pessoa = pessoas.pk_pessoa
    )


select * from juntando_bases