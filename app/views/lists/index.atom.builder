atom_feed do |feed|
  feed.title = "Lists"
  feed.updated @all_lists.maximum(:updated_at)
  
  @all_lists.each do |list|
    feed.entry(list) do |entry|
      entry.title list.title
      entry.content list.description
      entry.url user_list_path(list.user, list) if list.user
      entry.author do |author|
        author.name list.user.name if list.user
      end
    end
  end
end