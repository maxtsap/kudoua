::Refinery::Application.routes.draw do
  resources :main_galleries, :only => [:index, :show]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :main_galleries, :except => :show do
      collection do
        post :update_positions
      end
    end
  end
end
