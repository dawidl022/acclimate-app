class CompanySearchesController < ApplicationController
  def new
  end

  def show
    # TODO validate input
    # TODO remember the category once selected
    Google::Maps.configure do |config|
      config.authentication_mode = Google::Maps::Configuration::API_KEY
      config.api_key = Rails.application.credentials.gmaps_api_key
    end
    result = Google::Maps.geocode(params[:location])
    @lat = result.first.latitude
    @long = result.first.longitude
    @radius = params[:radius]
    @location_name = params[:location]

    @category_id = params[:category_id]
    @category = Category.find(@category_id)
    @company_list = Company.where(category: @category_id).order(rating: :desc)
  end
end
