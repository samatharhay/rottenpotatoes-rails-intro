class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def chosen_rating?(rating)
    chosen_ratings = @param
    return true if chosen_ratings.nil?
    chosen_ratings.include? rating
  end
  
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.possible_ratings
    @sort = params[:sort]
    if params[:ratings].nil? 
      @param = ['G','PG','PG-13','R']
    else
      @param = params[:ratings].keys
    end
    @movies=Movie.where(rating: @param).order(@sort)
  end
    
  #  @all_ratings = Movie.possible_ratings
   # @sort = params[:sort] ||session[:sort]
  #  if params[:ratings].nil?
  #    session[:ratings] = session[:ratings] || {'G'=>"1",'PG'=>"1",'PG-13'=>"1",'R'=>"1"}
  #  else
  #    session[:ratings] = params[:ratings]|| session[:ratings] || {'G'=>"1",'PG'=>"1",'PG-13'=>"1",'R'=>"1"}
  #  end
  #  session[:sort] = @sort #incase the sort changed
  #  
  #  if(params[:sort].nil? && !(session[:sort].nil?)) || (params[:ratings].nil? && !(session[:ratings].nil?)) 
  #    flash.keep
  #    redirect_to movies_path(sort: session[:sort], ratings: session[:ratings])
  #  else
  #    @movies = Movie.with_ratings(rating: session[:ratings].keys).order(session[:sort])
  #  end
  #end
  
  
 

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
  
 

end
