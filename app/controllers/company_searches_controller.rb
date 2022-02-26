class CompanySearchesController < ApplicationController
  def new
  end

  def show
    # TODO validate input
    category_id = params[:category_id]
    @category = Category.find(category_id)
    @company_list = Company.where(category: category_id).order(rating: :desc)
  end
end
