class Company < ActiveRecord::Base
  has_many :users
  acts_as_commentable
end
