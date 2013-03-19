class Category < ActiveRecord::Base
  has_many :Recipe
  attr_accessible :name
end
