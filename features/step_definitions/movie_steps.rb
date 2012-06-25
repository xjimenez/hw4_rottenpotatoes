# hw4_rottenpotatoes

# Add a declarative step here for populating the DB with movies.
Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

# In 'features/step_definitions/movie_steps.rb' 
Then /^the director of "([^"]*)" should be "([^"]*)"$/ do |input_movie_IGNORED, input_director|
  page.should have_xpath('//li[contains(.,"Director")]', :text => "#{input_director}")
end

