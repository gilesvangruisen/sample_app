class Micropost < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user

  validates_presence_of :user_id, :content
  validates_length_of :content, :maximum => 140

  default_scope order: 'microposts.created_at DESC'
end
