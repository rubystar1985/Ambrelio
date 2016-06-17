class Rating < ActiveRecord::Base
  belongs_to :post

  validates_presence_of :post_id, :rate
  validates_inclusion_of :rate, :in => 1..5

  delegate :average_rate, to: :post
end
