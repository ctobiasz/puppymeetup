class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  belongs_to :location, optional: true
  has_one_attached :avatar

  validates :first_name, :last_name, presence: true
  validates :username, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :email, presence: true, uniqueness: true, :uniqueness => { :case_sensitive => false }
  validates :password, confirmation: true, length: { minimum: 6 }
  validates :purchased, default: false


end
