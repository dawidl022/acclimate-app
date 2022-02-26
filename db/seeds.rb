require 'csv'

by_category = {}
data = CSV.parse(
  File.read("#{Rails.root}/db/data/climate_ratings.csv"), headers: true)

data.each do |company|
  if by_category[company["Sector"]]
    by_category[company["Sector"]] << company
  else
    by_category[company["Sector"]] = [company]
  end
end

categories = Category.create(by_category.map { |category, _| {name: category} })

by_category.each_with_index do |(category, companies), index|
  companies.each do |company|
    Company.create({
      name: company["Company"],
      category: Category.find_by_name(category),
      rating: company["Rating"]
    })
  end
end
