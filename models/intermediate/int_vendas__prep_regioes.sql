with
    enriquecendo_base_regioes as (
        select
            cidade.pk_endereco
            ,cidade.cidade
            ,cidade.codigo_postal
            ,estado_pais.pk_estado
            ,estado_pais.nome_estado
            ,estado_pais.codigo_estado
            ,estado_pais.codigo_pais
            ,estado_pais.territorio
        from
            {{ ref('stg_erp__cidade') }} cidade
        left join
            {{ ref('stg_erp__estado_pais') }} estado_pais 
        on
            cidade.fk_estado = estado_pais.pk_estado
)

select * from enriquecendo_base_regioes