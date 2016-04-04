require 'rails_helper'

feature "Login" do
  
  scenario "Successfully" do
    login
    expect(page).to have_content I18n.t('texts.welcome')
  end
  
  scenario "Unsuccessfully - Not Found" do
    login_not_found
    expect(page).to have_content I18n.t('controllers.account.login.error')
  end
  
end