# File 'spec/models/movie_spec.rb'
require 'spec_helper'

describe Movie do
  it 'should include director info' do
    movie = Movie.new(:title => 'Blade Runner', :rating => 'PG', :director => 'Ridley Scott', :release_date => '1982-06-25')
    movie.director.should == 'Ridley Scott'
  end
end

