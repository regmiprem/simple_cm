class SectionEdit < ActiveRecord::Base
  attr_accessible :page_id, :name, :position, :visible, :content_type, :content
  belongs_to :editor, :class_name =>"AdminUser", :foreign_key => 'admin_user_id'
  belongs_to :section
end
