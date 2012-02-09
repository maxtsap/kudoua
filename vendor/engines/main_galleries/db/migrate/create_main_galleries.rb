class CreateMainGalleries < ActiveRecord::Migration

  def self.up
    create_table :main_galleries do |t|
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :main_galleries, :id

    load(Rails.root.join('db', 'seeds', 'main_galleries.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "main_galleries"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/main_galleries"})
    end

    drop_table :main_galleries
  end

end
