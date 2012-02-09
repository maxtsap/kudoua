module NavigationHelpers
  module Refinery
    module MainGalleries
      def path_to(page_name)
        case page_name
        when /the list of main_galleries/
          admin_main_galleries_path

         when /the new main_gallery form/
          new_admin_main_gallery_path
        else
          nil
        end
      end
    end
  end
end
