module Admin
  class MainGalleriesController < Admin::BaseController

    crudify :main_gallery, :xhr_paging => true

  end
end
