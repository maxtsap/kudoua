module Admin
  class BannersController < Admin::BaseController

    crudify :banner,
            :title_attribute => 'link', :xhr_paging => true

  end
end
