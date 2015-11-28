class Host < ActiveRecord::Base
  belongs_to :account
  has_many :tags
  validates :signature, presence: true, uniqueness: true

  def collect(data)
    logger.info data.to_s
  end

end
