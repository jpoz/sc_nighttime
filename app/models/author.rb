class Author < ActiveRecord::Base
  def full_name
    name = self.first
    name = name + " " + self.middle unless self.middle.blank? 
    name = name + " " +self.last
    name
  end
  
  def short_name
    name = self.first[0...1] + ". " 
    name = name + self.middle[0...1] + ". " unless self.middle.blank?
    name = name + self.last
    name
  end
end
