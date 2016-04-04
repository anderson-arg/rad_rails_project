require 'rails_helper'

feature "Logout" do
  
  scenario "Successfully" do
    login
    logout
    expect(page).to have_content I18n.t('menus.login')
  end
  
end