class AddShowOnMainToImages < ActiveRecord::Migration
  def self.up
    add_column :images, :use_on_main, :boolean
  end

  def self.down
    remove_column :images, :use_on_main
  end
end
