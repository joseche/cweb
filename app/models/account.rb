class Account < ActiveRecord::Base
  belongs_to :user
  validates :api_token, presence: true, uniqueness: true
  before_validation :generate_api_token
  has_many :hosts

  def generate_api_token
    return if api_token.present?
    loop do
      self.api_token = SecureRandom.hex
      break unless Account.exists? api_token: api_token
    end
  end

  def new
    @account = Account.new
  end
end
