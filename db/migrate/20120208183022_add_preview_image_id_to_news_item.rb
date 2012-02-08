class AddPreviewImageIdToNewsItem < ActiveRecord::Migration
  def self.up
    add_column :news_items, :preview_image_id, :integer
  end

  def self.down
    remove_column :news_items, :preview_image_id
  end
end
