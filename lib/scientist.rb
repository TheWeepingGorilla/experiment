class Scientist < ActiveRecord::Base
  has_and_belongs_to_many :experiments

  validates :name, :presence => true, :length => { :maximum => 50 }
end
