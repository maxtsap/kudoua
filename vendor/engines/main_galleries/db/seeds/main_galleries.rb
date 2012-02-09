if defined?(User)
  User.all.each do |user|
    if user.plugins.where(:name => 'main_galleries').blank?
      user.plugins.create(:name => 'main_galleries',
                          :position => (user.plugins.maximum(:position) || -1) +1)
    end
  end
end
