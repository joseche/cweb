class Loadavg < ActiveRecord::Base
  belongs_to :host
  validates :host, presence: true

  validates_numericality_of :load1,  :greater_than_or_equal_to => 0
  validates_numericality_of :load5,  :greater_than_or_equal_to => 0
  validates_numericality_of :load15, :greater_than_or_equal_to => 0

  validates_numericality_of :load1,  :less_than_or_equal_to => 100
  validates_numericality_of :load5,  :less_than_or_equal_to => 100
  validates_numericality_of :load15, :less_than_or_equal_to => 100

end
