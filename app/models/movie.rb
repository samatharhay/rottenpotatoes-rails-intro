class Movie < ActiveRecord::Base
   def self.possible_ratings
       return ['G','PG','PG-13','R']
   end
   
   def self.with_ratings ratings
      self.where(ratings)
   end
end
