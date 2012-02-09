class MainGallery < ActiveRecord::Base

  # def title was created automatically because you didn't specify a string field
  # when you ran the refinery_engine generator. Love, Refinery CMS.

  belongs_to :image

  def title
    self.image.image_name
  end
  
  belongs_to :image
end
