class Banner < ActiveRecord::Base

  acts_as_indexed :fields => [:link, :title]

  validates :link, :presence => true, :uniqueness => true
  
  belongs_to :image
end
