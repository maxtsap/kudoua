Given /^I have no main_galleries$/ do
  MainGallery.delete_all
end


Then /^I should have ([0-9]+) main_galler[y|ies]+?$/ do |count|
  MainGallery.count.should == count.to_i
end
