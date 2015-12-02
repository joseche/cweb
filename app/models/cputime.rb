class Cputime < ActiveRecord::Base
  belongs_to :host
  validates :host, presence: true

  validates_numericality_of :user,  :greater_than_or_equal_to => 0
  validates_numericality_of :sys,  :greater_than_or_equal_to => 0
  validates_numericality_of :idle, :greater_than_or_equal_to => 0
  validates_numericality_of :nice, :greater_than_or_equal_to => 0

=begin
  validates_numericality_of :user,  :less_than_or_equal_to => 100
  validates_numericality_of :sys,  :less_than_or_equal_to => 100
  validates_numericality_of :idle, :less_than_or_equal_to => 100
  validates_numericality_of :nice, :less_than_or_equal_to => 100
=end
end
