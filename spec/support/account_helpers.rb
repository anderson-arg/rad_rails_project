module AccountHelpers
  def login
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "#{I18n.t('actions.login')}"
  end
end

include AccountHelpers