class Account < ActiveRecord::Base
  has_many :users, dependent: :destroy
  
  enum status: [:member, :client, :client_plus, :admin]
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :member
  end
end
