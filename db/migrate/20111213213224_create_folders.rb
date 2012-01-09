class CreateFolders < ActiveRecord::Migration

  def self.up
    create_table :folders do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :folders, :id

    load(Rails.root.join('db', 'seeds', 'folders.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "folders"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/folders"})
    end

    drop_table :folders
  end

end
