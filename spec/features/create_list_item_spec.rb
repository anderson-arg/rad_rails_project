require 'rails_helper'

feature "Create List Item" do
    
  given(:item) { FactoryGirl.create(:item) }

  background do
    login(item.list.user)
  end
  
  scenario "Successfully" do
    visit new_user_list_item_path(user_id: item.list.user, list_id: item.list.id)
    save_item({
      item_type: item.item_type.title,
      item_text: item.text,
      item_order: item.order
    })
    expect(page).to have_content I18n.t('controllers.items.create.flash.success')
  end
  
  scenario "Unsuccessfully - Empty Text" do
    visit new_user_list_item_path(user_id: item.list.user, list_id: item.list.id)
    save_item({
      item_type: item.item_type.title,
      item_text: "",
      item_order: item.order,
    })
    expect(page).to have_css ".alert-danger"
  end
  
  scenario "Unsuccessfully - Empty Order" do
    visit new_user_list_item_path(user_id: item.list.user, list_id: item.list.id)
    save_item({
      item_type: item.item_type.title,
      item_text: item.text,
      item_order: nil,
    })
    expect(page).to have_css ".alert-danger"
  end

end
