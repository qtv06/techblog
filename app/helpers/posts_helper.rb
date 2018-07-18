module PostsHelper
  def categories_for_select
    Category.all.collect{|c| [c.category_name, c.id]}
  end
end
