class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :set_name
  has_many :topics

  scope :from_oauth, -> (provider, email) { by_email(email).where(provider: provider) }
  scope :by_email, -> (email) { where(email: email) }

  def set_name
    self.name = self.email.split('@').first if self.name.nil?
  end

  def self.minimum_password_length
    password_length.min || 6
  end
end
