class Activation < ActiveRecord::Base
  belongs_to :user
  validates :key, presence: true, uniqueness: true
  before_validation :generate_key

  def generate_key
    return if self.key.present?
    loop do
      self.key = SecureRandom.hex
      break unless Activation.exists? key: key
    end
  end

  def new
    @validation = Activation.new
  end
end