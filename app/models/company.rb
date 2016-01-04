class Company < ActiveRecord::Base
  has_many :users
  accepts_nested_attributes_for :users, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
