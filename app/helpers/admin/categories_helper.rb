module Admin::CategoriesHelper

  def display_name(depth)
    ("&nbsp;" * 4 * depth).html_safe
  end

  def category_options_array(categories=[], ancestry=nil, depth=0)
    Category.where(ancestry: ancestry).order(:id).each do |category|
      categories << [display_name(depth) + category.name, category.id]
      category_options_array(categories, category.id, depth+1)
    end
    categories
  end
end
