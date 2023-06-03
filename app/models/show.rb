class Show < ApplicationRecord
  belongs_to :user

  has_many :userreviews, dependent: :destroy
  has_many :places, dependent: :destroy
  has_one_attached :imageup
  
 
  accepts_nested_attributes_for :places
  accepts_nested_attributes_for :userreviews


 
  attr_accessor :current_user
end
