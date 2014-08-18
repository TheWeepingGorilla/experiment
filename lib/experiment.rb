class Experiment < ActiveRecord::Base
  has_and_belongs_to_many :scientists

  scope :no_start, -> { where(:start => nil)}
  scope :no_end, -> { where(:end => nil)}

  validates :description, :presence => true, :length => { :maximum => 50 }
  validates :location, :presence => true, :length => { :maximum => 50 }

  before_save :downcase_location

  private

  def downcase_location
    self.location = self.location.downcase
  end
end
