module ItemHelpers
  def save_item(fields={})
    select fields[:item_type], from: "item_item_type_id" if fields[:item_type]
    fill_in "item_text", with: fields[:item_text] if fields[:item_text]
    fill_in "item_order", with: fields[:item_order] if fields[:item_order]
    click_button I18n.t('actions.save')
  end
end

include ItemHelpers