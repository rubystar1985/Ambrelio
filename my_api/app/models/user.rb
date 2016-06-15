class User < ActiveRecord::Base
  validates :login, presence: true

  has_many :posts
end
