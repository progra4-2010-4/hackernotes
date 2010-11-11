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
    self.title = self.content[0..TitleLength] if self.title.blank?
  
  end

  def render_formatted
        #convert to html
        md = RDiscount.new self.content 
        #examine with hpricot
        html = Hpricot md.to_html
        #search for code and highlight it
        html.search "pre" do |code| 
            lang = ""
            lines = code.innerText.split "\n"
            lines.each do |line|
                if line[0..2] == "@@@"
                    lang = line.gsub "@@@", '' 
                    break
                end
            end
            #ok, we have the lang, now, color it
            newhtml = Hpricot CodeRay.scan(lines[1..-1].join("\n"), lang.to_sym).div :line_numbers => :inline, :css => :class
            html.replace_child code, newhtml
        end
        #return the string representation of the note
        html.to_s
  end
end
