Given /^a Rails "(2[^"]*)" project named "([^"]*)" with Cucumber\-Rails generated with "([^"]*)"$/ do |rails_version, project_name, options|
  create_file("Gemfile", "source 'http://rubygems.org'\ngem 'rails', '#{rails_version}'")
  run("bundle install", true)
  run("which rails", true)
  # run("rails #{project_name}", true)
  # assert_passing_with("README")
  # cd(project_name)
  # 
  # cucumber_rails = %{gem "cucumber-rails", :path => '../../..', :group => :test\n}
  # append_to_file("Gemfile", cucumber_rails)
  # 
  # run("rails generate cucumber:install #{options}", true)
end
