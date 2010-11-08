# == Schema Information
# Schema version: 20101108141900
#
# Table name: notes
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

class Note < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :content
  TitleLength = 10
  before_save :validar_titulo

  def validar_titulo 
    self.title = self.content[0..TitleLength] if self.title.nil?
  
  end
end
