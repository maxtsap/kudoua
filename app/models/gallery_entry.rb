class GalleryEntry < ActiveRecord::Base

  acts_as_indexed :fields => [:name, :body]

  validates_presence_of :image
  validates_inclusion_of :entry_type, :in => 0..1

  belongs_to :gallery
  belongs_to :image

  after_save :set_name

  def self.types
    {
      :image => 0,
      :video => 1
    }
  end

  def image?
    entry_type == self.class.types[:image]
  end

  def video?
    entry_type == self.class.types[:video]
  end

  self.types.each do |type_name, value|
    eval("scope :#{type_name}, where(:entry_type => #{value})")
  end

  def set_name
    if self.name.blank?
      self.name = "image_#{self.id}"
    end
  end

end
