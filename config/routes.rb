Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  # Is the to: necessary?
  resources :cocktails, only: [:new, :create, :index, :show] do
    resources :doses, only: [:new, :create]
end

resources :doses, only: [:index, :destroy]

# For image upload stuff: mount Attachinary::Engine => "/attachinary"

end

# Before:
#        Prefix Verb   URI Pattern                   Controller#Action
#     cocktails GET    /cocktails(.:format)          cocktails#index
#               POST   /cocktails(.:format)          cocktails#create
#  new_cocktail GET    /cocktails/new(.:format)      cocktails#new
# edit_cocktail GET    /cocktails/:id/edit(.:format) cocktails#edit
#      cocktail GET    /cocktails/:id(.:format)      cocktails#show
#               PATCH  /cocktails/:id(.:format)      cocktails#update
#               PUT    /cocktails/:id(.:format)      cocktails#update
#               DELETE /cocktails/:id(.:format)      cocktails#destroy

# After:
#            Prefix Verb   URI Pattern                                 Controller#Action
#  cocktail_doses POST   /cocktails/:cocktail_id/doses(.:format)     doses#create
# new_cocktail_dose GET    /cocktails/:cocktail_id/doses/new(.:format) doses#new
#         cocktails GET    /cocktails(.:format)                        cocktails#index
#                   POST   /cocktails(.:format)                        cocktails#create
#      new_cocktail GET    /cocktails/new(.:format)                    cocktails#new
#          cocktail GET    /cocktails/:id(.:format)                    cocktails#show
#             doses GET    /doses(.:format)                            doses#index
#              dose DELETE /doses/:id(.:format)                        doses#destroy
#              root GET    /                                           cocktails#index
