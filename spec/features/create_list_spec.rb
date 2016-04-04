require 'rails_helper'

feature "Create List" do

  background do
    @user = FactoryGirl.create(:user)
    login(@user)
    @list_category = FactoryGirl.create(:list_category)
  end
  
  scenario "Successfully" do
    
    visit new_user_list_path(user_id: @user)
    save_list({
      list_title: "Lista 1",
      list_category: @list_category.title,
      list_description: "Teste"
    })
    expect(page).to have_content I18n.t('controllers.lists.create.flash.success')
  end
  
  scenario "Successfully - Same Name but Different Category" do
    
    visit new_user_list_path(user_id: @user)
    save_list({
      list_title: "Lista 1",
      list_category: @list_category_2,
      list_description: "Teste",
    })
    expect(page).to have_content I18n.t('controllers.lists.create.flash.success')
  end
  
  scenario "Unsuccessfully - List Already Exists" do
      
    visit new_user_list_path(user_id: @user)
    save_list({
      list_title: "Lista 1",
      list_category: @list_category.title,
      list_description: "Teste",
    })
    visit new_user_list_path(user_id: @user)
    save_list({
      list_title: "Lista 1",
      list_category: @list_category.title,
      list_description: "Teste",
    })
    expect(page).to have_content I18n.t('activerecord.errors.models.list.attributes.title.taken')
  end
  
  scenario "Unsuccessfully - Empty Title" do

    visit new_user_list_path(user_id: @user)
    save_list({
      list_title: "",
      list_category: @list_category.title,
      list_description: "Teste",
    })
    expect(page).to have_css ".alert-danger"
  end

end
