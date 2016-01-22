class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_many :comments, dependent: :destroy
  belongs_to :account, touch: true
  belongs_to :company, touch: true
  accepts_nested_attributes_for :company, :update_only => true
  acts_as_commentable

  enum role: [:admin, :subscriber, :user]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
