class MainGalleriesController < ApplicationController

  before_filter :find_all_main_galleries
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @main_gallery in the line below:
    present(@page)
  end

  def show
    @main_gallery = MainGallery.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @main_gallery in the line below:
    present(@page)
  end

protected

  def find_all_main_galleries
    @main_galleries = MainGallery.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/main_galleries").first
  end

end
