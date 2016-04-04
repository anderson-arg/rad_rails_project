module AccountHelpers
  def login(user = FactoryGirl.create(:user))
    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button 'Login'
  end
  
  def login_not_found
    visit login_path
    fill_in "session_email", with: ""
    fill_in "session_password", with: ""
    click_button 'Login'
  end
  
  def logout
    click_link 'logout'
  end
end

include AccountHelpers