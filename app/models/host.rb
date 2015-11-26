class Host < ActiveRecord::Base
  belongs_to :account
  has_many :tag
end
