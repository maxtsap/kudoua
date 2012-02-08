module Admin
  class BannersController < Admin::BaseController

    crudify :banner,
            :title_attribute => 'title', :xhr_paging => true

  end
end
