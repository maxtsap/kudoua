class CreateMainGalleries < ActiveRecord::Migration

  def self.up
    create_table :main_galleries do |t|
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    insert("INSERT INTO main_galleries(image_id) SELECT images.id FROM images WHERE images.use_on_main = 1")

    add_index :main_galleries, :id

    load(Rails.root.join('db', 'seeds', 'main_galleries.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "main_galleries"})
    end

    drop_table :main_galleries
  end

end
