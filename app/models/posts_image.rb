class PostsImage < ActiveRecord::Base
  belongs_to :image
  belongs_to :post
end