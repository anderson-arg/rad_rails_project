FactoryGirl.define do
    
    factory :list_category do
        title "Categoria 1"
        is_active 1
    end
    
    factory :item_type do
        title "Tipo 1"
        is_active 1
    end
    
    factory :user do
        name 'Nome'
        email 'email@email.com'
        password '123456'
        password_confirmation '123456'
        is_active 1
    end
    
    factory :list do
        user
        list_category
        title "Lista 1"
        description "Descrição da Lista"
        is_private 0
        is_active 1
    end
    
    factory :item do
        list
        item_type
        text "Item 1"
        order 1
        is_private 0
        is_active 1
    end
    
    factory :user_lists do
        user
        list
        favorite 1
    end
    
    factory :answer do
        user_lists
        item
        value "Resposta Teste"
    end
    
    factory :comment do
        user_lists
        user
        text "Comentário Teste"
        is_active 1
    end
    
    factory :contact do
        name "Comentário Teste"
        email "email@email.com"
        message "Mensagem Teste"
    end
    
end