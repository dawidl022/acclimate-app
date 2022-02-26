module CompanySearchesHelper
  def error_element(error_type)
    if @errors[error_type]
      content_tag(:div, class: "error", id: "#{error_type}-error") do
        @errors[error_type]
      end
    end
  end
end
