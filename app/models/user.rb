class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_many :comments, dependent: :destroy
  belongs_to :company, touch: true
  accepts_nested_attributes_for :company, update_only: :true

  enum role: [:admin, :editor, :subscriber, :user]
  after_initialize :set_default_role, if: :new_record?
  
  before_save   :downcase_email
  validates :name,  presence: true, length: { maximum: 50 }
  validates :username,  presence: true, length: { maximum: 50 }

  def set_default_role
    self.role ||= :user
  end
  
  private

    def downcase_email
      self.email = email.downcase
    end
    
end
