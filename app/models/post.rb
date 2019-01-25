class Post < ApplicationRecord
  has_one_attached :picture

  validates :name, presence: true
  validates_length_of :name, :maximum => 20;
  validates :description, presence: true
  validates :purchased, default: false
end
