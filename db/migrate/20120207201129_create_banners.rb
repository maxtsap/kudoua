class CreateBanners < ActiveRecord::Migration

  def self.up
    create_table :banners do |t|
      t.integer :image_id
      t.string :link
      t.string :title
      t.integer :position

      t.timestamps
    end

    add_index :banners, :id

    load(Rails.root.join('db', 'seeds', 'banners.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "banners"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/banners"})
    end

    drop_table :banners
  end

end
