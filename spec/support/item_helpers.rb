module ItemHelpers
  def save_item(fields={})
    select fields[:item_type], from: "item_type_id" if fields[:item_type]
    fill_in "item_text", with: fields[:item_text] if fields[:item_text]
    fill_in "item_order", with: fields[:item_order] if fields[:item_order]
    fill_in "item_is_private", with: fields[:item_is_private] if fields[:item_is_private]
    fill_in "item_is_active", with: fields[:item_is_active] if fields[:item_is_active]
    click_button "save_button"
  end
end

include ItemHelpers