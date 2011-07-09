require 'lib/position_mover'
class Subject < ActiveRecord::Base
  
  include PositionMover
  
  has_many :pages

  #Don't need to validate(in most cases)
  # id's, foreign keys, timestamp, booleans, counters
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  
  
  #scope
  scope :visible, where(:visible => true)
  scope :invisible, where(:visible => false)
  scope :sorted, order('subjects.position ASC')
  scope :search, lambda { |query| where(["name LIKE ?", "%#{query}%"])}
end