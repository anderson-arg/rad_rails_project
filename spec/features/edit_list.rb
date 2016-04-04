require 'rails_helper'

feature "Create List" do
 given(:list) { FactoryGirl.create(:list) }

  background do
    login(list.user)
  end
  
  scenario "Successfully" do
    
    visit edit_user_list_path(user_id: list.user, id: list.id)
    save_list({
      list_title: "Lista 1",
      list_category: list.list_category.title,
      list_description: "Teste"
    })
    expect(page).to have_content I18n.t('controllers.lists.update.flash.success')
  end
  
  scenario "Successfully - Same Name but Different Category" do
    
    visit edit_user_list_path(user_id: list.user, id: list.id)
    save_list({
      list_title: "Lista 1",
      list_category: nil,
      list_description: "Teste",
    })
    expect(page).to have_content I18n.t('controllers.lists.update.flash.success')
  end
  
  scenario "Unsuccessfully - Empty Title" do

    visit edit_user_list_path(user_id: list.user, id: list.id)
    save_list({
      list_title: "",
      list_category: list.list_category.title,
      list_description: "Teste",
    })
    expect(page).to have_css ".alert-danger"
  end

end
