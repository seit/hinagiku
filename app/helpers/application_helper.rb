module ApplicationHelper
  def delete_link(object)
    link_to "削 除 ", object, :method => :delete, :confirm =>"本 当 に 削 除 し ま す か ？"
  end
end
