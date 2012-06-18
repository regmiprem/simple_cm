class Comment < ActiveRecord::Base
EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i  
  belongs_to :section
  attr_accessible :body, :commenter, :email
  validates_presence_of :commenter
  validates_presence_of :body
  validates :email, :presence =>true, :length => { :maximum=> 100 },
   :format => EMAIL_REGEX, :confirmation => true 
end
