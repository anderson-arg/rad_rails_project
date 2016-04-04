module ListHelpers
  def save_list(fields={})
    select fields[:list_category], from: "list_list_category_id" if fields[:list_category]
    fill_in "list_title", with: fields[:list_title] if fields[:list_title]
    fill_in "list_description", with: fields[:list_description] if fields[:list_description]
    click_button I18n.t('actions.save')
  end
end

include ListHelpers