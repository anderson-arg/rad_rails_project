User.create(:id => 1, :name => "Thais Correia", :email => "tnmcorreia@gmail.com", :password => "123456")
User.create(:id => 2, :name => "Artur Araújo", :email => "arturaraujo.b@gmail.com", :password => "123456")


ListCategory.create(:id => 1, :title => "ToDo", :photo => "todo.png", :is_active => 1)
ListCategory.create(:id => 2, :title => "Financeiro", :photo => "financial.png", :is_active => 1)

List.create(:id => 5, :list_category_id => 1, :user_id => 2, :title => "Teste", :description => "Descrição Teste", :is_active => 1)
List.create(:id => 6, :list_category_id => 1, :user_id => 2, :title => "Teste 2", :description => "Descrição Teste 2", :is_active => 1)
List.create(:id => 1, :list_category_id => 1, :user_id => 2, :title => "Fazer nas Férias", :description => "Atividades para fazer nas férias", :is_active => 1)
List.create(:id => 2, :list_category_id => 2, :user_id => 1, :title => "Objetivos Financeiros", :description => "Objetivos para alcançar em um ano", :is_active => 1)
List.create(:id => 3, :list_category_id => 2, :user_id => 1, :title => "Passos para se tornar rico", :is_active => 1)
List.create(:id => 4, :list_category_id => 1, :user_id => 2, :title => "Estudar", :description => "Tecnologias para estudar", :is_active => 1)


Item.create(:list_id => 1, :order => 0, :text => "Ler 10 livros.")
Item.create(:list_id => 1, :order => 1, :text => "Aprender a tocar uma nova música.")
Item.create(:list_id => 1, :order => 2, :text => "Dormir.")

Item.create(:list_id => 2, :order => 0, :text => "Juntar 20k.")
Item.create(:list_id => 2, :order => 1, :text => "Ajudar uma ONG.")
Item.create(:list_id => 2, :order => 2, :text => "Investir na bolsa de valores.")

Item.create(:list_id => 3, :order => 0, :text => "Jogar na mega-sena.")
Item.create(:list_id => 3, :order => 1, :text => "Continuar jogando na mega-sena.")

Item.create(:list_id => 4, :order => 0, :text => "Ruby on Rails.")
Item.create(:list_id => 4, :order => 1, :text => "Django.")
Item.create(:list_id => 4, :order => 2, :text => "AngularJS.")
Item.create(:list_id => 4, :order => 3, :text => "Node.js.")

Item.create(:list_id => 5, :order => 0, :text => "Item da lista.")

