class ChangeBodySizeOfPageParts < ActiveRecord::Migration
  def self.up
    change_column :page_parts, :body, :text, :limit => 16777215
    change_column :page_part_translations, :body, :text, :limit => 16777215
  end

  def self.down
    change_column :page_parts, :body, :text
    change_column :page_part_translations, :body, :text
  end
end
