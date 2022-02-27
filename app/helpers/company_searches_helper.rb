module CompanySearchesHelper
  class PluralCategory
    attr_reader :id, :name

    def initialize(id, name)
      @id = id
      @name = name[2..]
    end
  end

  def error_element(error_type)
    if @errors[error_type]
      content_tag(:div, class: "error", id: "#{error_type}-error") do
        @errors[error_type]
      end
    end
  end

  def pluralized_categories
    Category.all.map do |category|
      PluralCategory.new(category.id, pluralize(2, category.name))
    end
  end
end
