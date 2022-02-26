class CompanySearchesController < ApplicationController
  def new
    @errors = {}
  end

  def show
    @errors = {}

    # TODO move to config
    Google::Maps.configure do |config|
      config.authentication_mode = Google::Maps::Configuration::API_KEY
      config.api_key = Rails.application.credentials.gmaps_api_key
    end

    if params[:location] == ""
      @errors["location"] = "Please fill in the location field."
    else
      result = Google::Maps.geocode(params[:location])
      if result && result.first
        @lat = result.first.latitude
        @long = result.first.longitude
      else
        @errors["location"] = "Unable to find entered location. Please try again."
      end
    end

    if params[:radius] == ""
      @radius = 1
    else
      @radius = params[:radius]
    end
    @location_name = params[:location]

    if params[:category_id] == ""
      @errors["category"] = "Please select the sector."
    else
      @category_id = params[:category_id]
      @category = Category.find(@category_id)
      @company_list = Company.where(category: @category_id).order(rating: :desc)
    end

    if @errors.length > 0
      @lat = nil
      @long = nil
      render 'new'
    end
  end
end
