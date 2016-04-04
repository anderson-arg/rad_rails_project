require 'rails_helper'

feature "Edit User" do
  given(:user) { FactoryGirl.create(:user) }
  
  background do
    login(user)
    @email = (0...8).map { (65 + rand(26)).chr }.join
    FactoryGirl.create(:user, :email => "test2@email.com")
  end

  scenario "Successfully" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: "#{@email}@email.com",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_content I18n.t('controllers.users.update.flash.success')
  end
  
  scenario "Unsuccessfully - Email already taken" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: "test2@email.com",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.email.taken')
  end
  
  scenario "Unsuccessfully - Invalid Email" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: "aldkjf",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_content I18n.t('activerecord.errors.models.user.attributes.email.invalid')
  end

  scenario "Unsuccessfully - Missing name" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: "",
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Missing email" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: "",
      user_password: user.password,
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Missing password" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: user.email,
      user_password: "",
      user_password_confirmation: user.password_confirmation,
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Missing confirm password" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: "",
    })
    expect(page).to have_css ".error"
  end
  
  scenario "Unsuccessfully - Confirm password doesn't match password" do
    visit user_path(id: user)
    click_link I18n.t('actions.edit')
    update_user({
      user_name: user.name,
      user_email: user.email,
      user_password: user.password,
      user_password_confirmation: "bla",
    })
    expect(page).to have_css ".error"
  end
end
