class Virtualmem < ActiveRecord::Base
  belongs_to :host
  validates :host, presence: true
end
