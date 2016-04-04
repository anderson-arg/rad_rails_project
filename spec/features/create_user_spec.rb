require 'rails_helper'

feature "Create User" do
  given(:user) { FactoryGirl.create(:user) }

  scenario "Successfully" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: "#{(0...8).map { (65 + rand(26)).chr }.join}@email.com",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_content I18n.t('controllers.users.create.flash.success')
  end
  
  scenario "Unsuccessfully - Email already taken" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.email.taken')
  end
  
  scenario "Unsuccessfully - Invalid Email" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: "aldkjf",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.email.invalid')
  end

  scenario "Unsuccessfully - Missing name" do
    visit login_path
    save_user({
      user_name: "",
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Missing email" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: "",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Missing password" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: user.email,
      user_password: "",
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Missing confirm password" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: "",
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Confirm password doesn't match password" do
    visit login_path
    save_user({
      user_name: user.name,
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: "bla",
    })
    expect(page).to have_css ".error"
  end
end
