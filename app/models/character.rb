# == Schema Information
#
# Table name: characters
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  actor_id   :integer
#  movie_id   :integer
#
class Character < ApplicationRecord
  
  # 1 to 1 relationships --> belongs_to()
  # 1 to many relationships --> has_many()
  # many-to-many relationships --> special case
  
  #Character to Movie: 

  #each character is in a single movie, and the movie has only one character with that name, so this is a 1 to 1 relationship. 

  #Therefore use this code below
  belongs_to :movie
  
  #ATTENTION: te abbreviated version will only work if the method name is the same as the table name --> method: movie / table name: Movie.
  # If they are not the same, use the more complete version of the code:

  # belongs_to(:movie, {:foreign_key => "movie_id", :class_name => "Movie"})  

  #which is the same as this code:  
  
  #def movie
   # key = self.movie_id

    #matching_set = Movie.where({ :id => key })

    #the_one = matching_set.at(0)

    #return the_one
  #end

  #Character to Actor is also a 1:1 relationship. One actor plays only one role in a movie, and a character can only be played by one actor.

  # Also, we can use the abbreviated version of the code, because the method name is the same as the data frame name.

  #Therefore:

  belongs_to :actor

  # Which is the same as:
  
  #belongs_to(:actor, { :foreign_key =>"actor_id", :class_name =>"Actor"})
  
  # and the same as:
  
  #def actor
  
  #key = self.actor_id

  #matching_set = Actor.where({ :id => key})

  #the_one = matching_set.at(0)

  #return the_one
  #end 


end
