# File 'spec/controllers/movies_controller_spec.rb'
require 'spec_helper'
 
describe MoviesController do
  describe "routing 'on GET to :similar'" do
    it 'routes /movies/:id/similar' do
      { :get => '/movies/1/similar' }.should route_to(
        :controller => 'movies',
        :id => '1',
        :action => 'similar')
    end
  end
  describe "action 'similar'" do
    before :each do
      @fake_results = [mock('Movie', :director => 'Ridley Scott'), mock('Movie', :director => 'Ridley Scott')]
    end
    it 'should call the model method to find movies whose director matches that of the current movie' do
      Movie.should_receive(:find_by_id).and_return(@fake_results[0])
      Movie.should_receive(:find_all_by_director).and_return(@fake_results)
      get :similar, {:id => '1'}
    end
    it "should select the 'similar' movies template for rendering" do
      Movie.stub(:find_by_id).and_return(@fake_results[0])
      Movie.stub(:find_all_by_director).and_return(@fake_results)
      get :similar, {:id => 1}
      response.should render_template('similar')
    end
    it 'should make the results available to that template' do
      Movie.stub(:find_by_id).and_return(@fake_results[0])
      Movie.stub(:find_all_by_director).and_return(@fake_results)
      get :similar, {:id => 1}
      assigns(:movie).should equal(@fake_results[0])
      assigns(:movies).should == @fake_results
    end
  end
end
