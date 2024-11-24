# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end



Doorkeeper::Application.create(
  {
    "name"=>"preact",
    "uid"=>"mSlOCcS6VIYAhT6lluz66WfTKeKyxGQqFUIJmhdYPc4",
    "secret"=>"YFhHJV-3ZWmju-oPojoec2h7he0Ip735iXq9jXFHTYQ",
    "redirect_uri"=>"http://localhost:5173/callback",
    "scopes"=>"",
    "confidential"=>false
  }
)