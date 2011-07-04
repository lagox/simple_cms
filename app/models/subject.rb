class Subject < ActiveRecord::Base
  
  has_many :pages

  validates :name, :presence => true

  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}
end