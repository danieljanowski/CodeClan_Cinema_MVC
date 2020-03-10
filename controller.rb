require('sinatra')
require('sinatra/contrib/all')

require_relative('models/film')
also_reload('./models/*')

get '/films' do
  @list_of_movies = Film.all
  erb(:index)
end

get '/films/:num' do
  film_id = params[:num].to_i
  @movie_title = Film.find_by_id(film_id).first.title
  @movie_price= Film.find_by_id(film_id).first.price
  erb(:film_details)
end
