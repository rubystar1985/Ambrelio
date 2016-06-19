class User < ActiveRecord::Base
  validates :login, presence: true
  validates :login, uniqueness: true, unless: :anonymous?

  has_many :posts

  Anonymous = 'Anonymous'

  def anonymous?
    login == Anonymous
  end
end
