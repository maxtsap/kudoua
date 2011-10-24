class CreatePostsImages < ActiveRecord::Migration
  def self.up
    create_table :posts_images do |t|
      t.integer :post_id
      t.integer :image_id
      t.integer :position
      t.string :chunk
      t.string :caption
      t.string :photographer

      t.timestamps
    end
  end

  def self.down
    drop_table :posts_images
  end
end