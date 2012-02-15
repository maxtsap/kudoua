class UpdateMainGalleriesUpdatedAtFields < ActiveRecord::Migration
  def self.up
    update("UPDATE main_galleries SET updated_at='#{Time.current.to_s(:db)}', created_at='#{Time.current.to_s(:db)}'")
  end

  def self.down
  end
end
