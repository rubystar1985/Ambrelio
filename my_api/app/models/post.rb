require 'resolv'

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :ratings

  validates_presence_of :user_id, :title, :content, :ip
  validates :ip, :format => { :with => Resolv::IPv4::Regex }

  def average_rate
    ratings.average(:rate).to_f.round(1)
  end
end
