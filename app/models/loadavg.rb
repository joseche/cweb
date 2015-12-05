class Loadavg < ActiveRecord::Base
  belongs_to :host
  validates :host, presence: true

  validates_numericality_of :load1,  :greater_than_or_equal_to => 0
  validates_numericality_of :load5,  :greater_than_or_equal_to => 0
  validates_numericality_of :load15, :greater_than_or_equal_to => 0

  validates_numericality_of :load1,  :less_than_or_equal_to => 100
  validates_numericality_of :load5,  :less_than_or_equal_to => 100
  validates_numericality_of :load15, :less_than_or_equal_to => 100

  def to_csv
    name = self.host.fqdn.partition('.').first
    return name+','+self.dt.to_s(:localdb) +','+self.load1.to_s+','+self.load5.to_s+','+self.load15.to_s+"\n"
  end

  def to_arr
    name = self.host.fqdn.partition('.').first
    return "[new Date('"+self.dt.to_time.iso8601+"'),"+self.load1.to_s+','+self.load5.to_s+','+self.load15.to_s+"],\n"
  end

end
