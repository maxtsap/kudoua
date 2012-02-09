require 'spec_helper'

describe MainGallery do

  def reset_main_gallery(options = {})
    @valid_attributes = {
      :id => 1
    }

    @main_gallery.destroy! if @main_gallery
    @main_gallery = MainGallery.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_main_gallery
  end

  context "validations" do
    
  end

end