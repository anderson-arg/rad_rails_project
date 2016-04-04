module UserHelpers
  def save_user(fields={})
    fill_in "user_name", with: fields[:user_name] if fields[:user_name]
    fill_in "user_email", with: fields[:user_email] if fields[:user_email]
    fill_in "user_password", with: fields[:user_password] if fields[:user_password]
    fill_in "user_password_confirmation", with: fields[:user_password_confirmation] if fields[:user_password_confirmation]
    click_button I18n.t("actions.register")
  end
end

include UserHelpers