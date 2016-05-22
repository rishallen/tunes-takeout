require 'dotenv'
require 'yelp'

class Food
  attr_reader :name, :url, :image_url, :phone, :address

  def initialize(data)
    raise
    @name = data.business.name
    @url = data.business.url
    @image_url = data.business.image_url
    @phone = data.business.phone
    @address = data.business.location.display_address
  end

  def self.find(food_id)
    Yelp.client.business(URI.escape(food_id)).business
  end
end
