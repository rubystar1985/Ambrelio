require 'resolv'

class Post < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :user_id, :title, :content, :ip
  validates :ip, :format => { :with => Resolv::IPv4::Regex }
end
