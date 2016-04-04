module ListHelpers
  def save_list(fields={})
    select fields[:list_category], from: "list_category_id" if fields[:list_category]
    fill_in "list_title", with: fields[:list_title] if fields[:list_title]
    fill_in "list_description", with: fields[:list_description] if fields[:list_description]
    fill_in "list_is_private", with: fields[:list_is_private] if fields[:list_is_private]
    fill_in "list_is_active", with: fields[:list_is_active] if fields[:list_is_active]
    click_button "save_button"
  end
end

include ListHelpers