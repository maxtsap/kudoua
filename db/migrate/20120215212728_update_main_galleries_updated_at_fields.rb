class UpdateMainGalleriesUpdatedAtFields < ActiveRecord::Migration
  def self.up
    update("UPDATE main_galleries SET updated_at=#{Time.current.to_date}, created_at=#{Time.current.to_date}")
  end

  def self.down
  end
end
