class Word < ActiveRecord::Base
  belongs_to :kind
  belongs_to :author
  
  validates_presence_of :title
  validates_presence_of :kind_id
  validates_presence_of :author_id
end
