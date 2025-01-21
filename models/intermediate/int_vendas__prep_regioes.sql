with
    enriquecendo_base_regioes as (
        select
            cidade.pk_endereco,
            estado_pais.pk_estado,
            cidade.cidade,
            cidade.codigo_postal,
            estado_pais.nome_estado,
            estado_pais.codigo_estado,
            estado_pais.codigo_pais,
            auxiliar_pais.nome_pais,
            estado_pais.territorio
        from
            {{ ref('stg_erp__cidade') }} cidade
        left join
            {{ ref('stg_erp__estado_pais') }} estado_pais
        on
            cidade.fk_estado = estado_pais.pk_estado
        left join
            {{ ref('stg_erp__auxiliar_pais') }} auxiliar_pais 
        on
            estado_pais.codigo_pais = auxiliar_pais.pk_pais
    )
select * from enriquecendo_base_regioes
