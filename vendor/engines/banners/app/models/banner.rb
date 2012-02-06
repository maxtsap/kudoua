class Banner < ActiveRecord::Base

  acts_as_indexed :fields => [:link]

  validates :link, :presence => true, :uniqueness => true
  
  belongs_to :image
end
