class Recipe < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  attr_accessible :category_id, :ingredients, :description, :name
end