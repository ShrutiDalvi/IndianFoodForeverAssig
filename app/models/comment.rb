class Comment < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :commenter, :body, :recipe_id
  validates_presence_of :commenter, :message => "Your Commenter can't be blank"
  validates_presence_of :body, :message => "Your body can't be blank"
end