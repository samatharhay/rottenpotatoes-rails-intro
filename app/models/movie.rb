class Movie < ActiveRecord::Base
    def self.ratings
        Movie.select(:rating).distinct.inject([]) {|a, m| a.push m.rating}
    end
    
   # def self.ratings(ratings)
  #    if params[:ratings].nil? #non checks aka the begining
   #     @movies = Movie.where(rating: @all_ratings)
    #  else
     #   @movies = Movie.where(rating: params[:ratings].keys)
    #  end
    #end
end
