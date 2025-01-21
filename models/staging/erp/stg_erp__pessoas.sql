with 
    fonte_pessoas as (
        select
             cast(businessentityid as int) as pk_pessoa
            , cast(firstname as varchar) as primeiro_nome
            , cast(middlename as varchar) as nome_do_meio
            , cast(lastname as varchar) as ultimo_nome

            from
                {{ source('erp', 'person') }}

)

select * from fonte_pessoas